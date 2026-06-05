import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_driver/coordinator_driver.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_coach_selection_card.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CoordinatorDriverOnlySelectionBottomSheet extends StatefulWidget {
  final void Function(CoordinatorDriver driver)? onSelectionConfirmed;

  const CoordinatorDriverOnlySelectionBottomSheet({
    super.key,
    this.onSelectionConfirmed,
  });

  @override
  State<CoordinatorDriverOnlySelectionBottomSheet> createState() =>
      _CoordinatorDriverOnlySelectionBottomSheetState();
}

class _CoordinatorDriverOnlySelectionBottomSheetState
    extends State<CoordinatorDriverOnlySelectionBottomSheet> {
  List<CoordinatorDriver> _drivers = [];
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

      if (mounted) {
        setState(() {
          if (driverResult is Ok<List<CoordinatorDriver>>) {
            _drivers = driverResult.value;
          } else if (driverResult is Error<List<CoordinatorDriver>>) {
            _errorMessage = driverResult.error.toString();
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
    // Limit height to half screen
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
                      'Chọn tài xế',
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
                    : _buildDriverList(),
          ),

          SizedBox(height: MediaQuery.of(context).padding.bottom + 8),
        ],
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
      physics: const BouncingScrollPhysics(),
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
            widget.onSelectionConfirmed?.call(driver);
          },
        );
      },
    );
  }
}
