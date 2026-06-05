import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_vehicle/coordinator_vehicle.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CoordinatorCoachOnlySelectionBottomSheet extends StatefulWidget {
  final void Function(CoordinatorVehicle vehicle)? onSelectionConfirmed;

  const CoordinatorCoachOnlySelectionBottomSheet({
    super.key,
    this.onSelectionConfirmed,
  });

  @override
  State<CoordinatorCoachOnlySelectionBottomSheet> createState() =>
      _CoordinatorCoachOnlySelectionBottomSheetState();
}

class _CoordinatorCoachOnlySelectionBottomSheetState
    extends State<CoordinatorCoachOnlySelectionBottomSheet> {
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
      final vehicleResult = await repository.getAllVehicles();

      if (mounted) {
        setState(() {
          if (vehicleResult is Ok<List<CoordinatorVehicle>>) {
            _vehicles = vehicleResult.value;
          } else if (vehicleResult is Error<List<CoordinatorVehicle>>) {
             _errorMessage = vehicleResult.error.toString();
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

  @override
  Widget build(BuildContext context) {
    // Limit height to half screen to avoid being too tall
    final maxHeight = MediaQuery.of(context).size.height * 0.55;

    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight),
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                      'Chọn phương tiện',
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

          const Divider(height: 1, color: AppColors.inputBorder),

          // List content
          Flexible(
            child: _isLoading
                ? const Padding(
                    padding: EdgeInsets.all(40),
                    child: Center(
                        child: CircularProgressIndicator(
                            color: AppColors.primary)),
                  )
                : _errorMessage != null
                    ? Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          'Lỗi: $_errorMessage',
                          style: const TextStyle(color: AppColors.error),
                        ),
                      )
                    : _buildVehicleList(),
          ),

          SizedBox(height: MediaQuery.of(context).padding.bottom + 8),
        ],
      ),
    );
  }

  Widget _buildVehicleList() {
    if (_vehicles.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Text(
            'Không có phương tiện nào',
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ),
      );
    }

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
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
            widget.onSelectionConfirmed?.call(vehicle);
          },
        );
      },
    );
  }
}

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
