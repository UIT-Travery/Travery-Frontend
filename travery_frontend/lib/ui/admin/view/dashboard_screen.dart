import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/domain/models/admin/business_dashboard/business_dashboard.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/admin/view_model/dashboard_view_model.dart';
import 'package:travery_frontend/utils/core_result.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_theme.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  /// 0 = Tháng, 1 = Quý
  int _selectedPeriod = 0;

  @override
  void initState() {
    super.initState();
    // Trigger data load after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DashboardViewModel>().loadStats.execute();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: ListenableBuilder(
          listenable: context.read<DashboardViewModel>().loadStats,
          builder: (context, _) {
            final vm = context.read<DashboardViewModel>();
            final cmd = vm.loadStats;

            if (cmd.running) {
              return const Center(child: CircularProgressIndicator());
            }

            if (cmd.error) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 48,
                      color: AppColors.error,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Không thể tải dữ liệu',
                      style: TextStyle(
                        fontSize: AppTextTheme.bodyLarge,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => cmd.execute(),
                      child: const Text('Thử lại'),
                    ),
                  ],
                ),
              );
            }

            final stats = cmd.result is Ok<BusinessDashboard>
                ? (cmd.result as Ok<BusinessDashboard>).value
                : null;

            if (stats == null) {
              return const SizedBox.shrink();
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── App bar ──────────────────────────────────────────────────
                  _buildAppBar(),

                  const SizedBox(height: 20),

                  // ── Page title ───────────────────────────────────────────────
                  Text(
                    'Báo cáo Tổng quát',
                    style: TextStyle(
                      fontSize: AppTextTheme.headlineLarge,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '24 THÁNG 10, 2023 – HÔM NAY',
                    style: TextStyle(
                      fontSize: AppTextTheme.bodySmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ── Stat cards ───────────────────────────────────────────────
                  _StatCard(
                    icon: Icons.attach_money_rounded,
                    iconBgColor: const Color(0xFFE8F0FE),
                    iconColor: AppColors.primaryDarkBlackBlue,
                    label: 'DOANH THU',
                    value: '\$${_formatNumber(stats.totalRevenue.toInt())}',
                    badgeText:
                        '+${stats.revenueGrowthPercent.toStringAsFixed(1)}%',
                    badgeColor: const Color(0xFFE6F4EA),
                    badgeTextColor: const Color(0xFF2E7D32),
                  ),

                  const SizedBox(height: 12),

                  _StatCard(
                    icon: Icons.confirmation_number_outlined,
                    iconBgColor: const Color(0xFFF3E8FF),
                    iconColor: const Color(0xFF7B2FF7),
                    label: 'LƯỢT ĐẶT',
                    value: _formatNumber(stats.totalBooking),
                    badgeText:
                        '+${stats.bookingGrowthPercent.toStringAsFixed(1)}%',
                    badgeColor: const Color(0xFFE6F4EA),
                    badgeTextColor: const Color(0xFF2E7D32),
                  ),

                  const SizedBox(height: 20),

                  // ── Revenue by service ────────────────────────────────────────
                  _buildRevenueCard(stats),

                  const SizedBox(height: 20),

                  // ── Operational health ───────────────────────────────────────
                  _buildOperationalHealthCard(stats),

                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // App bar
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildAppBar() {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.grid_view_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'Travery Admin',
          style: TextStyle(
            fontSize: AppTextTheme.headlineMedium,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Revenue chart card
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildRevenueCard(BusinessDashboard stats) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Doanh thu theo Dịch vụ',
                style: TextStyle(
                  fontSize: AppTextTheme.bodyLarge,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              // Period toggle
              Container(
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    _PeriodToggleButton(
                      label: 'TH',
                      isSelected: _selectedPeriod == 0,
                      onTap: () => setState(() => _selectedPeriod = 0),
                    ),
                    _PeriodToggleButton(
                      label: 'QUÝ',
                      isSelected: _selectedPeriod == 1,
                      onTap: () => setState(() => _selectedPeriod = 1),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Bar chart
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 500,
                minY: 0,
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (_) => AppColors.primaryDarkBlackBlue,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      const labels = ['Tours', 'Xe khách', 'Khách sạn'];
                      return BarTooltipItem(
                        '${labels[groupIndex]}\n${rod.toY.toInt()}M',
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: (value, meta) {
                        final data = _selectedPeriod == 0
                            ? [
                                stats.tourRevenueM,
                                stats.carRevenueM,
                                stats.hotelRevenueM,
                              ]
                            : [
                                stats.tourRevenueQuarterM,
                                stats.carRevenueQuarterM,
                                stats.hotelRevenueQuarterM,
                              ];
                        final idx = value.toInt();
                        if (idx < 0 || idx >= data.length) {
                          return const SizedBox.shrink();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            '${data[idx].toInt()}M',
                            style: TextStyle(
                              fontSize: AppTextTheme.bodySmall,
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: (value, meta) {
                        const labels = ['Tours', 'Xe khách', 'Khách sạn'];
                        final idx = value.toInt();
                        if (idx < 0 || idx >= labels.length) {
                          return const SizedBox.shrink();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            labels[idx],
                            style: TextStyle(
                              fontSize: AppTextTheme.bodySmall,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                barGroups: _buildBarGroups(stats),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups(BusinessDashboard stats) {
    final data = _selectedPeriod == 0
        ? [stats.tourRevenueM, stats.carRevenueM, stats.hotelRevenueM]
        : [
            stats.tourRevenueQuarterM,
            stats.carRevenueQuarterM,
            stats.hotelRevenueQuarterM,
          ];

    return List.generate(data.length, (i) {
      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: data[i],
            color: AppColors.primaryDarkBlackBlue,
            width: 40,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
            ),
          ),
        ],
      );
    });
  }

  // ─────────────────────────────────────────────────────────────────────────
  // Operational health card
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildOperationalHealthCard(BusinessDashboard stats) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF1F3FF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sức khỏe Vận hành',
            style: TextStyle(
              fontSize: AppTextTheme.bodyLarge,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 16),

          // Metric row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _HealthMetricItem(
                onTap: () {
                  context.push(Routes.adminTourManagement);
                },
                icon: Icons.flag_outlined,
                iconColor: AppColors.primaryDarkBlackBlue,
                value: '${stats.ongoingTours}',
                label: 'TOUR',
              ),
              _HealthMetricItem(
                onTap: () {
                  context.push(Routes.adminVehicleManagement);
                },
                icon: Icons.directions_bus_outlined,
                iconColor: AppColors.primaryDarkBlackBlue,
                value: '${stats.vehicleUtilizationPercent.toInt()}%',
                label: 'ĐỘI XE',
              ),
              _HealthMetricItem(
                onTap: () {
                  context.push(Routes.adminHotelManagement);
                },
                icon: Icons.bed_outlined,
                iconColor: AppColors.primaryDarkBlackBlue,
                value: '${stats.hotelOccupancyPercent.toInt()}%',
                label: 'PHÒNG',
              ),
            ],
          ),

          const SizedBox(height: 20),

          // System stability
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ĐỘ ỔN ĐỊNH HỆ THỐNG',
                style: TextStyle(
                  fontSize: AppTextTheme.bodySmall,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                '${stats.systemStabilityPercent}%',
                style: TextStyle(
                  fontSize: AppTextTheme.bodySmall,
                  fontWeight: FontWeight.bold,
                  color: AppColors.success,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: stats.systemStabilityPercent / 100,
              minHeight: 8,
              backgroundColor: AppColors.inputBorder,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.success,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatNumber(int n) {
    if (n >= 1000000) {
      return '${(n / 1000000).toStringAsFixed(1)}M';
    } else if (n >= 1000) {
      return '${(n / 1000).toStringAsFixed(1)}K';
    }
    return '$n';
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// Reusable widgets
// ═════════════════════════════════════════════════════════════════════════════

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.badgeText,
    required this.badgeColor,
    required this.badgeTextColor,
  });

  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String label;
  final String value;
  final String badgeText;
  final Color badgeColor;
  final Color badgeTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          // Icon
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),

          const SizedBox(width: 12),

          // Label + value
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: AppTextTheme.bodySmall,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: AppTextTheme.headlineMedium,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),

          // Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: badgeColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              badgeText,
              style: TextStyle(
                fontSize: AppTextTheme.bodySmall,
                fontWeight: FontWeight.bold,
                color: badgeTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _PeriodToggleButton extends StatelessWidget {
  const _PeriodToggleButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryDarkBlackBlue
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: AppTextTheme.bodySmall,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _HealthMetricItem extends StatelessWidget {
  const _HealthMetricItem({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: AppTextTheme.headlineMedium,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: AppTextTheme.bodySmall,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
