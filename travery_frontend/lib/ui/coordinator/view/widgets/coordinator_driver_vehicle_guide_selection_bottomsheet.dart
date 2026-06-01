import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';

class CoordinatorDriverVehicleGuideSelectionBottomSheet extends StatefulWidget {
  const CoordinatorDriverVehicleGuideSelectionBottomSheet({super.key});

  /// Shows the bottom sheet
  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          const CoordinatorDriverVehicleGuideSelectionBottomSheet(),
    );
  }

  @override
  State<CoordinatorDriverVehicleGuideSelectionBottomSheet> createState() =>
      _CoordinatorDriverVehicleGuideSelectionBottomSheetState();
}

class _CoordinatorDriverVehicleGuideSelectionBottomSheetState
    extends State<CoordinatorDriverVehicleGuideSelectionBottomSheet> {
  int _currentStep = 0; // 0: Tài xế, 1: Xe, 2: Hướng dẫn viên

  final List<Map<String, dynamic>> _mockDrivers = [
    {'name': 'Nguyễn Văn Bình', 'email': 'binh@tra.gm.com', 'isReady': true},
    {'name': 'Nguyễn Văn Bình', 'email': 'binh@tra.gm.com', 'isReady': false},
    {'name': 'Nguyễn Văn Bình', 'email': 'binh@tra.gm.com', 'isReady': true},
    {'name': 'Nguyễn Văn Bình', 'email': 'binh@tra.gm.com', 'isReady': true},
  ];

  final List<Map<String, dynamic>> _mockVehicles = [
    {'plate': '95A-123.45', 'type': 'Limosine', 'isReady': true},
    {'plate': '95A-123.45', 'type': 'Limosine', 'isReady': false},
    {'plate': '95A-123.45', 'type': 'Limosine', 'isReady': true},
    {'plate': '95A-123.45', 'type': 'Limosine', 'isReady': true},
  ];

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
    } else {
      // Finished all selections
      Navigator.of(context).pop();
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
        _buildStepChip('Tài xế', 0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(
            Icons.arrow_forward,
            size: 18,
            color: AppColors.textPrimary,
          ),
        ),
        _buildStepChip('Xe', 1),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(
            Icons.arrow_forward,
            size: 18,
            color: AppColors.textPrimary,
          ),
        ),
        _buildStepChip('Hướng dẫn viên', 2),
      ],
    );
  }

  Widget _buildStepChip(String label, int stepIndex) {
    final isActive = _currentStep == stepIndex;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isActive ? Colors.white : Colors.grey.shade600,
        ),
      ),
    );
  }

  Widget _buildListContent() {
    switch (_currentStep) {
      case 0:
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _mockDrivers.length,
          itemBuilder: (context, index) {
            final driver = _mockDrivers[index];
            return _buildPersonCard(
              name: driver['name'],
              email: driver['email'],
              isReady: driver['isReady'],
              onSelect: _nextStep,
            );
          },
        );
      case 1:
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _mockVehicles.length,
          itemBuilder: (context, index) {
            final vehicle = _mockVehicles[index];
            return _buildVehicleCard(
              plate: vehicle['plate'],
              type: vehicle['type'],
              isReady: vehicle['isReady'],
              onSelect: _nextStep,
            );
          },
        );
      case 2:
      default:
        // Use mock drivers as guide list for demonstration
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _mockDrivers.length,
          itemBuilder: (context, index) {
            final guide = _mockDrivers[index];
            return _buildPersonCard(
              name: guide['name'],
              email: guide['email'],
              isReady: guide['isReady'],
              onSelect: _nextStep,
            );
          },
        );
    }
  }

  Widget _buildPersonCard({
    required String name,
    required String email,
    required bool isReady,
    required VoidCallback onSelect,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface, // Often white
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
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
                  ),
                  child: const Icon(
                    Icons.person_outline,
                    color: AppColors.textSecondary,
                    size: 28,
                  ),
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
                          Text(
                            email,
                            style: const TextStyle(
                              fontSize: AppTextTheme.bodySmall,
                              color: AppColors.textSecondary,
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
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  'Chọn',
                  style: TextStyle(fontWeight: FontWeight.bold),
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
    required bool isReady,
    required VoidCallback onSelect,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface, // Often white
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
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
                  ),
                  child: const Icon(
                    Icons.directions_bus_outlined,
                    color: AppColors.textSecondary,
                    size: 28,
                  ),
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
                          Text(
                            type,
                            style: const TextStyle(
                              fontSize: AppTextTheme.bodySmall,
                              color: AppColors.textSecondary,
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
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  'Chọn',
                  style: TextStyle(fontWeight: FontWeight.bold),
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
