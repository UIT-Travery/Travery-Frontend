import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_driver/coordinator_driver.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_guide/coordinator_guide.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_vehicle/coordinator_vehicle.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_driver_vehicle_guide_selection_view_model.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';

class CoordinatorDriverVehicleGuideSelectionBottomSheet extends StatefulWidget {
  final CoordinatorDriverVehicleGuideSelectionViewModel viewModel;

  const CoordinatorDriverVehicleGuideSelectionBottomSheet({
    super.key,
    required this.viewModel,
  });

  /// Shows the bottom sheet
  static Future<Map<String, dynamic>?> show(BuildContext context) {
    final viewModel = CoordinatorDriverVehicleGuideSelectionViewModel(
      coordinatorRepository: context.read<CoordinatorRepository>(),
    );
    return showModalBottomSheet<Map<String, dynamic>?>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CoordinatorDriverVehicleGuideSelectionBottomSheet(
        viewModel: viewModel,
      ),
    );
  }

  @override
  State<CoordinatorDriverVehicleGuideSelectionBottomSheet> createState() =>
      _CoordinatorDriverVehicleGuideSelectionBottomSheetState();
}

class _CoordinatorDriverVehicleGuideSelectionBottomSheetState
    extends State<CoordinatorDriverVehicleGuideSelectionBottomSheet> {
  int _currentStep = 0; // 0: Tài xế, 1: Xe, 2: Hướng dẫn viên

  CoordinatorDriver? _selectedDriver;
  CoordinatorVehicle? _selectedVehicle;
  CoordinatorGuide? _selectedGuide;

  @override
  void initState() {
    super.initState();
    widget.viewModel.executeLoadAll();
    widget.viewModel.loadDrivers.addListener(_onDataLoaded);
    widget.viewModel.loadVehicles.addListener(_onDataLoaded);
    widget.viewModel.loadGuides.addListener(_onDataLoaded);
  }

  void _onDataLoaded() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    widget.viewModel.loadDrivers.removeListener(_onDataLoaded);
    widget.viewModel.loadVehicles.removeListener(_onDataLoaded);
    widget.viewModel.loadGuides.removeListener(_onDataLoaded);
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
    } else {
      // Finished all selections
      Navigator.of(context).pop({
        'driver': _selectedDriver,
        'vehicle': _selectedVehicle,
        'guide': _selectedGuide,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // ── Header ───────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: AppColors.textPrimary),
                    onPressed: () => context.pop(),
                  ),
                ),
                const Text(
                  'Phân công',
                  style: TextStyle(
                    fontSize: AppTextTheme.bodyLarge,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),

          _buildStepper(),
          const SizedBox(height: 16),

          Divider(height: 1, color: Colors.grey.withValues(alpha: 0.2)),
          Expanded(
            child: Container(
              color: AppColors.background.withValues(alpha: 0.5),
              child: _buildListContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepper() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStepChip('Tài xế', 0, _selectedDriver != null),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(
            Icons.arrow_forward,
            size: 18,
            color: AppColors.textPrimary,
          ),
        ),
        _buildStepChip('Xe', 1, _selectedVehicle != null),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(
            Icons.arrow_forward,
            size: 18,
            color: AppColors.textPrimary,
          ),
        ),
        _buildStepChip('Hướng dẫn viên', 2, _selectedGuide != null),
      ],
    );
  }

  Widget _buildStepChip(String label, int stepIndex, bool isSelected) {
    final isActive = _currentStep == stepIndex;
    final isDone = isSelected && !isActive;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primary
            : (isDone ? Colors.green : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isDone) ...[
            const Icon(Icons.check, size: 14, color: Colors.white),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: (isActive || isDone) ? Colors.white : Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListContent() {
    switch (_currentStep) {
      case 0:
        return _buildDriverList();
      case 1:
        return _buildVehicleList();
      case 2:
      default:
        return _buildGuideList();
    }
  }

  Widget _buildDriverList() {
    final cmd = widget.viewModel.loadDrivers;
    if (cmd.running) {
      return const Center(child: CircularProgressIndicator());
    }
    if (cmd.error) {
      return Center(child: Text('Lỗi: ${cmd.result}'));
    }
    final result = cmd.result;
    final drivers = result is Ok<List<CoordinatorDriver>> ? result.value : <CoordinatorDriver>[];
    if (drivers.isEmpty) {
      return const Center(child: Text('Không có tài xế nào'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: drivers.length,
      itemBuilder: (context, index) {
        final driver = drivers[index];
        final isSelected = _selectedDriver?.id == driver.id;
        return _buildPersonCard(
          name: driver.name,
          email: driver.email,
          imageUrl: driver.imageUrl,
          isReady: driver.status == DriverStatus.available,
          isSelected: isSelected,
          onSelect: () {
            setState(() {
              _selectedDriver = driver;
            });
            _nextStep();
          },
        );
      },
    );
  }

  Widget _buildVehicleList() {
    final cmd = widget.viewModel.loadVehicles;
    if (cmd.running) {
      return const Center(child: CircularProgressIndicator());
    }
    if (cmd.error) {
      return Center(child: Text('Lỗi: ${cmd.result}'));
    }
    final result = cmd.result;
    final vehicles = result is Ok<List<CoordinatorVehicle>> ? result.value : <CoordinatorVehicle>[];
    if (vehicles.isEmpty) {
      return const Center(child: Text('Không có xe nào'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: vehicles.length,
      itemBuilder: (context, index) {
        final vehicle = vehicles[index];
        final isSelected = _selectedVehicle?.id == vehicle.id;
        return _buildVehicleCard(
          plate: vehicle.licensePlate,
          type: vehicle.vehicleType,
          capacity: vehicle.capacity,
          imageUrl: vehicle.imageUrl,
          isReady: vehicle.vehicleStatus == 'AVAILABLE' ||
              vehicle.vehicleStatus == 'Sẵn sàng',
          isSelected: isSelected,
          onSelect: () {
            setState(() {
              _selectedVehicle = vehicle;
            });
            _nextStep();
          },
        );
      },
    );
  }

  Widget _buildGuideList() {
    final cmd = widget.viewModel.loadGuides;
    if (cmd.running) {
      return const Center(child: CircularProgressIndicator());
    }
    if (cmd.error) {
      return Center(child: Text('Lỗi: ${cmd.result}'));
    }
    final result = cmd.result;
    final guides = result is Ok<List<CoordinatorGuide>> ? result.value : <CoordinatorGuide>[];
    if (guides.isEmpty) {
      return const Center(child: Text('Không có hướng dẫn viên nào'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: guides.length,
      itemBuilder: (context, index) {
        final guide = guides[index];
        final isSelected = _selectedGuide?.id == guide.id;
        return _buildPersonCard(
          name: guide.name,
          email: guide.email,
          imageUrl: guide.imageUrl,
          isReady: guide.status == GuideStatus.available,
          isSelected: isSelected,
          onSelect: () {
            setState(() {
              _selectedGuide = guide;
            });
            _nextStep();
          },
        );
      },
    );
  }

  Widget _buildPersonCard({
    required String name,
    required String email,
    required String imageUrl,
    required bool isReady,
    required bool isSelected,
    required VoidCallback onSelect,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface, // Often white
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected
              ? AppColors.primary
              : AppColors.primary.withValues(alpha: 0.1),
          width: isSelected ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                    image: imageUrl.isNotEmpty
                        ? DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: imageUrl.isEmpty
                      ? const Icon(
                          Icons.person_outline,
                          color: AppColors.textSecondary,
                          size: 28,
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: AppTextTheme.bodyMedium,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.email_outlined,
                            size: 14,
                            color: AppColors.textSecondary,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              email,
                              style: const TextStyle(
                                fontSize: AppTextTheme.bodySmall,
                                color: AppColors.textSecondary,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _buildStatusBadge(isReady: isReady),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: onSelect,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Colors.green : AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text(
                  isSelected ? 'Đã Chọn' : 'Chọn',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleCard({
    required String plate,
    required String type,
    required int capacity,
    required String imageUrl,
    required bool isReady,
    required bool isSelected,
    required VoidCallback onSelect,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface, // Often white
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected
              ? AppColors.primary
              : AppColors.primary.withValues(alpha: 0.1),
          width: isSelected ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                    image: imageUrl.isNotEmpty
                        ? DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: imageUrl.isEmpty
                      ? const Icon(
                          Icons.directions_bus_outlined,
                          color: AppColors.textSecondary,
                          size: 28,
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plate,
                        style: const TextStyle(
                          fontSize: AppTextTheme.bodyMedium,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.directions_car_outlined,
                            size: 14,
                            color: AppColors.textSecondary,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              '$type • $capacity chỗ',
                              style: const TextStyle(
                                fontSize: AppTextTheme.bodySmall,
                                color: AppColors.textSecondary,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _buildStatusBadge(isReady: isReady),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: onSelect,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Colors.green : AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text(
                  isSelected ? 'Đã Chọn' : 'Chọn',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge({required bool isReady}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isReady
            ? Colors.blue.withValues(alpha: 0.1)
            : Colors.green.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        isReady ? 'SẴN SÀNG' : 'ĐANG CHẠY',
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: isReady ? Colors.blue : Colors.green,
        ),
      ),
    );
  }
}
