import 'package:flutter/material.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_coach/coordinator_coach.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';

class CoordinatorViewCoachScreen extends StatelessWidget {
  final CoordinatorCoach coach;

  const CoordinatorViewCoachScreen({super.key, required this.coach});

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // ── Blue gradient AppBar ─────────────────────────────────────────
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16, statusBarHeight + 10, 16, 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.primaryDarkBlackBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Text(
                  'Chi tiết xe',
                  style: TextStyle(
                    fontSize: AppTextTheme.headlineSmall,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // ── Scrollable body ───────────────────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Vehicle hero image
                  _buildHeroImage(),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: Column(
                      children: [
                        // Vehicle card
                        _buildInfoCard(
                          children: [
                            _buildCardRow(
                              icon: Icons.directions_bus_filled_rounded,
                              label: 'PHƯƠNG TIỆN',
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${coach.vehicle.vehicleType}-${coach.capacity} chỗ',
                              style: const TextStyle(
                                fontSize: AppTextTheme.headlineSmall,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              coach.vehicle.licensePlate,
                              style: const TextStyle(
                                fontSize: AppTextTheme.headlineSmall,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Driver card
                        _buildInfoCard(
                          children: [
                            _buildCardRow(
                              icon: Icons.badge_outlined,
                              label: 'TÀI XẾ',
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                // Avatar
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryLightWhiteBlue,
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: coach.driver.imageUrl.isNotEmpty
                                        ? Image.network(
                                            coach.driver.imageUrl,
                                            fit: BoxFit.cover,
                                            errorBuilder: (_, _, _) =>
                                                _buildInitials(
                                                  coach.driver.name,
                                                ),
                                          )
                                        : _buildInitials(coach.driver.name),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      coach.driver.name,
                                      style: const TextStyle(
                                        fontSize: AppTextTheme.bodyLarge,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      coach.driver.phoneNumber ?? 'Không có',
                                      style: const TextStyle(
                                        fontSize: AppTextTheme.bodyMedium,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Route card (departure + destination)
                        _buildInfoCard(children: [_buildRouteRow()]),
                        const SizedBox(height: 12),

                        // Time & price card
                        _buildInfoCard(children: [_buildTimeAndPriceRow()]),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroImage() {
    return Container(
      height: 200,
      width: double.infinity,
      color: AppColors.inputBackground,
      child: coach.vehicle.imageUrl.isNotEmpty
          ? Image.network(
              coach.vehicle.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => const Center(
                child: Icon(
                  Icons.directions_bus_filled_rounded,
                  color: AppColors.textSecondary,
                  size: 64,
                ),
              ),
            )
          : const Center(
              child: Icon(
                Icons.directions_bus_filled_rounded,
                color: AppColors.textSecondary,
                size: 64,
              ),
            ),
    );
  }

  Widget _buildInfoCard({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildCardRow({required IconData icon, required String label}) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.textSecondary),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: AppColors.textSecondary,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }

  Widget _buildRouteRow() {
    // Parse departure time for route display
    final parts = coach.name.split('–');
    final from = parts.isNotEmpty ? parts[0].trim() : 'Nơi đi';
    final to = parts.length > 1 ? parts[1].trim() : 'Nơi đến';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Departure
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const SizedBox(
                  width: 14,
                  height: 14,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.circle_outlined,
                      size: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                Container(
                  width: 1.5,
                  height: 40,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'NƠI ĐI',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textSecondary,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    from,
                    style: const TextStyle(
                      fontSize: AppTextTheme.bodyLarge,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    coach.vehicle.licensePlate,
                    style: const TextStyle(
                      fontSize: AppTextTheme.bodySmall,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Destination
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on_rounded,
              size: 14,
              color: AppColors.primary,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'DESTINATION',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textSecondary,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    to,
                    style: const TextStyle(
                      fontSize: AppTextTheme.bodyLarge,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    coach.vehicle.vehicleType,
                    style: const TextStyle(
                      fontSize: AppTextTheme.bodySmall,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeAndPriceRow() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Thời gian:',
              style: TextStyle(
                fontSize: AppTextTheme.bodyLarge,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              coach.departureTime,
              style: const TextStyle(
                fontSize: AppTextTheme.bodyLarge,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const Divider(height: 20, color: AppColors.inputBorder),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Giá vé:',
              style: TextStyle(
                fontSize: AppTextTheme.bodyLarge,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              '${coach.capacity * 1000}.000 VND',
              style: const TextStyle(
                fontSize: AppTextTheme.bodyLarge,
                fontWeight: FontWeight.bold,
                color: AppColors.error,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInitials(String name) {
    final initials = name
        .split(' ')
        .where((w) => w.isNotEmpty)
        .map((w) => w[0].toUpperCase())
        .take(2)
        .join();
    return Center(
      child: Text(
        initials,
        style: const TextStyle(
          color: AppColors.primaryDarkBlackBlue,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
