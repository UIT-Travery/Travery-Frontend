import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_driver/coordinator_driver.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_vehicle/coordinator_vehicle.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_coach_selection_card.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CoordinatorCoachSelectionBottomsheet extends StatefulWidget {
  final void Function(CoordinatorDriver? driver, CoordinatorVehicle? vehicle)?
      onSelectionConfirmed;

  const CoordinatorCoachSelectionBottomsheet({
    super.key,
    this.onSelectionConfirmed,
  });

  @override
  State<CoordinatorCoachSelectionBottomsheet> createState() =>
      _CoordinatorCoachSelectionBottomsheetState();
}

enum _CoachTab { driver, vehicle }

class _CoordinatorCoachSelectionBottomsheetState
    extends State<CoordinatorCoachSelectionBottomsheet> {
  _CoachTab _activeTab = _CoachTab.driver;

  List<CoordinatorDriver> _drivers = [];
  List<CoordinatorVehicle> _vehicles = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final repository = context.read<CoordinatorRepository>();
      final driverResult = await repository.getAllDrivers();
      final vehicleResult = await repository.getAllVehicles();

      if (mounted) {
        setState(() {
          if (driverResult is Ok<List<CoordinatorDriver>>) {
            _drivers = driverResult.value;
          }
          if (vehicleResult is Ok<List<CoordinatorVehicle>>) {
            _vehicles = vehicleResult.value;
          }
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  String _driverStatusLabel(DriverStatus status) {
    switch (status) {
      case DriverStatus.available:
        return 'Sẵn sàng';
      case DriverStatus.unavailable:
        return 'Đang chạy';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.inputBorder,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header row
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.close,
                      size: 22, color: AppColors.textSecondary),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Phân công xe và tài xế',
                      style: const TextStyle(
                        fontSize: AppTextTheme.bodyLarge,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 22),
              ],
            ),
          ),

          // Tab switcher
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildTabChip(label: 'Tài xế', tab: _CoachTab.driver),
                const SizedBox(width: 8),
                _buildTabChip(label: 'Xe', tab: _CoachTab.vehicle),
              ],
            ),
          ),

          const SizedBox(height: 12),
          const Divider(height: 1, color: AppColors.inputBorder),

          // List content
          Flexible(
            child: _isLoading
                ? const Padding(
                    padding: EdgeInsets.all(40),
                    child: Center(
                        child:
                            CircularProgressIndicator(color: AppColors.primary)),
                  )
                : _errorMessage != null
                    ? Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          'Lỗi: $_errorMessage',
                          style: const TextStyle(color: AppColors.error),
                        ),
                      )
                    : _activeTab == _CoachTab.driver
                        ? _buildDriverList()
                        : _buildVehicleList(),
          ),

          SizedBox(height: MediaQuery.of(context).padding.bottom + 8),
        ],
      ),
    );
  }

  Widget _buildTabChip({
    required String label,
    required _CoachTab tab,
  }) {
    final isActive = _activeTab == tab;
    return GestureDetector(
      onTap: () => setState(() => _activeTab = tab),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : AppColors.inputBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: AppTextTheme.bodyMedium,
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildDriverList() {
    if (_drivers.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Text(
            'Không có tài xế nào',
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _drivers.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final driver = _drivers[index];
        return CoordinatorCoachSelectionCard(
          Largelabel: driver.name,
          smallLabel: driver.email,
          status: _driverStatusLabel(driver.status),
          imageUrl: driver.imageUrl.isNotEmpty ? driver.imageUrl : null,
          onSelect: () {
            Navigator.of(context).pop();
            widget.onSelectionConfirmed?.call(driver, null);
          },
        );
      },
    );
  }

  Widget _buildVehicleList() {
    if (_vehicles.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Text(
            'Không có xe nào',
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _vehicles.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final vehicle = _vehicles[index];
        return _CoordinatorVehicleSelectionCard(
          licensePlate: vehicle.licensePlate,
          vehicleType: vehicle.vehicleType,
          status: vehicle.vehicleStatus,
          imageUrl: vehicle.imageUrl.isNotEmpty ? vehicle.imageUrl : null,
          onSelect: () {
            Navigator.of(context).pop();
            widget.onSelectionConfirmed?.call(null, vehicle);
          },
        );
      },
    );
  }
}

// ── Vehicle card variant (icon differs from driver card) ─────────────────────
class _CoordinatorVehicleSelectionCard extends StatelessWidget {
  final String licensePlate;
  final String vehicleType;
  final String status;
  final String? imageUrl;
  final VoidCallback? onSelect;

  const _CoordinatorVehicleSelectionCard({
    required this.licensePlate,
    required this.vehicleType,
    required this.status,
    this.imageUrl,
    this.onSelect,
  });

  Widget _buildStatusBadge() {
    final normalized = status.toLowerCase();
    Color bgColor;
    Color textColor;

    if (normalized.contains('sẵn')) {
      bgColor = AppColors.primaryLightWhiteBlue;
      textColor = AppColors.primaryDarkBlackBlue;
    } else if (normalized.contains('chạy') || normalized.contains('đang')) {
      bgColor = AppColors.success.withValues(alpha: 0.15);
      textColor = AppColors.success;
    } else {
      bgColor = AppColors.inputBackground;
      textColor = AppColors.textSecondary;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Vehicle icon placeholder
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.inputBorder,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: imageUrl != null && imageUrl!.isNotEmpty
                        ? Image.network(imageUrl!, fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => const Center(
                              child: Icon(Icons.directions_bus_outlined,
                                  color: AppColors.textSecondary, size: 32),
                            ))
                        : const Center(
                            child: Icon(Icons.directions_bus_outlined,
                                color: AppColors.textSecondary, size: 32),
                          ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        licensePlate,
                        style: const TextStyle(
                          fontSize: AppTextTheme.headlineSmall,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.directions_bus_outlined,
                              size: 16, color: AppColors.textSecondary),
                          const SizedBox(width: 6),
                          Text(
                            vehicleType,
                            style: const TextStyle(
                              fontSize: AppTextTheme.bodyMedium,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _buildStatusBadge(),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 36,
              width: double.infinity,
              child: Material(
                color: AppColors.primaryDarkBlackBlue,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: onSelect,
                  child: const Center(
                    child: Text(
                      'Chọn',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppTextTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
