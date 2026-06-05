import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_guide/coordinator_guide.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_coach_selection_card.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CoordinatorGuideOnlySelectionBottomSheet extends StatefulWidget {
  final void Function(CoordinatorGuide guide)? onSelectionConfirmed;

  const CoordinatorGuideOnlySelectionBottomSheet({
    super.key,
    this.onSelectionConfirmed,
  });

  @override
  State<CoordinatorGuideOnlySelectionBottomSheet> createState() =>
      _CoordinatorGuideOnlySelectionBottomSheetState();
}

class _CoordinatorGuideOnlySelectionBottomSheetState
    extends State<CoordinatorGuideOnlySelectionBottomSheet> {
  List<CoordinatorGuide> _guides = [];
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
      final guideResult = await repository.getAllGuides();

      if (mounted) {
        setState(() {
          if (guideResult is Ok<List<CoordinatorGuide>>) {
            _guides = guideResult.value;
          } else if (guideResult is Error<List<CoordinatorGuide>>) {
            _errorMessage = guideResult.error.toString();
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

  String _guideStatusLabel(GuideStatus status) {
    switch (status) {
      case GuideStatus.available:
        return 'Sẵn sàng';
      case GuideStatus.unavailable:
        return 'Bận';
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
                      'Chọn hướng dẫn viên',
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
                    : _buildGuideList(),
          ),

          SizedBox(height: MediaQuery.of(context).padding.bottom + 8),
        ],
      ),
    );
  }

  Widget _buildGuideList() {
    if (_guides.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Text(
            'Không có hướng dẫn viên nào',
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ),
      );
    }

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: _guides.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final guide = _guides[index];
        return CoordinatorCoachSelectionCard(
          Largelabel: guide.name,
          smallLabel: '${guide.yearsExperience} năm K/N - ${guide.languages.join(', ')}',
          status: _guideStatusLabel(guide.status),
          imageUrl: guide.imageUrl.isNotEmpty ? guide.imageUrl : null,
          onSelect: () {
            Navigator.of(context).pop();
            widget.onSelectionConfirmed?.call(guide);
          },
        );
      },
    );
  }
}
