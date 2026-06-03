import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour_template/coordinator_tour_template.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_button.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_tour_template_detail_view_model.dart';
import 'package:travery_frontend/utils/alert.dart';
import 'package:travery_frontend/utils/core_result.dart' as core_result;

import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';

class CoordinatorViewTemplateScreen extends StatefulWidget {
  final CoordinatorTourTemplate template;
  final CoordinatorTourTemplateDetailViewModel viewModel;

  const CoordinatorViewTemplateScreen({
    super.key,
    required this.template,
    required this.viewModel,
  });

  @override
  State<CoordinatorViewTemplateScreen> createState() =>
      _CoordinatorViewTemplateScreenState();
}

class _CoordinatorViewTemplateScreenState
    extends State<CoordinatorViewTemplateScreen> {
  late CoordinatorTourTemplate _template;
  int _currentImageIndex = 0;

  String _formatPrice(String priceStr) {
    final price = double.tryParse(priceStr) ?? 0.0;
    final formatter = NumberFormat('#,###', 'vi_VN');
    return '${formatter.format(price)} VNĐ';
  }

  // ── Lifecycle ─────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    _template = widget.template;
    widget.viewModel.deleteTemplate.addListener(_onDeleteResult);
    widget.viewModel.createInstanceFromTemplate.addListener(_onCreateResult);
    widget.viewModel.loadTemplate.addListener(_onLoadResult);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.loadTemplate.execute(_template.id);
    });
  }

  @override
  void didUpdateWidget(covariant CoordinatorViewTemplateScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.deleteTemplate.removeListener(_onDeleteResult);
    oldWidget.viewModel.createInstanceFromTemplate.removeListener(
      _onCreateResult,
    );
    oldWidget.viewModel.loadTemplate.removeListener(_onLoadResult);
    widget.viewModel.deleteTemplate.addListener(_onDeleteResult);
    widget.viewModel.createInstanceFromTemplate.addListener(_onCreateResult);
    widget.viewModel.loadTemplate.addListener(_onLoadResult);
  }

  @override
  void dispose() {
    widget.viewModel.deleteTemplate.removeListener(_onDeleteResult);
    widget.viewModel.createInstanceFromTemplate.removeListener(_onCreateResult);
    widget.viewModel.loadTemplate.removeListener(_onLoadResult);
    super.dispose();
  }

  void _onDeleteResult() {
    if (!mounted) return;
    if (widget.viewModel.deleteTemplate.error) {
      final result = widget.viewModel.deleteTemplate.result;
      String msg = 'Xóa lộ trình thất bại';
      if (result != null && result is core_result.Error) {
        msg = (result).error.toString().replaceAll('HttpException: ', '');
      }
      widget.viewModel.deleteTemplate.clearResult();
      Utils.showErrorNotification(context, msg);
    } else if (widget.viewModel.deleteTemplate.completed) {
      widget.viewModel.deleteTemplate.clearResult();
      Utils.showSuccessNotification(context, 'Xóa lộ trình thành công');
      context.pop();
    }
    setState(() {});
  }

  void _onCreateResult() {
    if (!mounted) return;
    if (widget.viewModel.createInstanceFromTemplate.error) {
      final result = widget.viewModel.createInstanceFromTemplate.result;
      String msg = 'Tạo tour thất bại';
      if (result != null && result is core_result.Error) {
        msg = (result as core_result.Error).error.toString().replaceAll(
          'HttpException: ',
          '',
        );
      }
      widget.viewModel.createInstanceFromTemplate.clearResult();
      Utils.showErrorNotification(context, msg);
    } else if (widget.viewModel.createInstanceFromTemplate.completed) {
      widget.viewModel.createInstanceFromTemplate.clearResult();
      Utils.showSuccessNotification(context, 'Tạo tour thành công!');
      Navigator.of(context).pop();
    }
    setState(() {});
  }

  void _onLoadResult() {
    if (!mounted) return;
    if (widget.viewModel.loadTemplate.completed) {
      final result = widget.viewModel.loadTemplate.result;
      if (result != null && result is core_result.Ok<CoordinatorTourTemplate>) {
        setState(() {
          _template = result.value;
        });
      }
    }
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final isLoading =
        widget.viewModel.deleteTemplate.running ||
        widget.viewModel.createInstanceFromTemplate.running ||
        widget.viewModel.loadTemplate.running;

    return Stack(
      children: [
        _buildScaffold(context, _template),
        if (isLoading)
          Container(
            color: Colors.black26,
            child: const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          ),
      ],
    );
  }

  Widget _buildScaffold(
    BuildContext context,
    CoordinatorTourTemplate template,
  ) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Column(
        children: [
          // ── Scrollable content ────────────────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Hero Image with gradient + back button + tour name ────
                  Stack(
                    children: [
                      // Hero image (Carousel)
                      SizedBox(
                        height: 280,
                        width: double.infinity,
                        child: template.images.isNotEmpty
                            ? PageView.builder(
                                itemCount: template.images.length,
                                onPageChanged: (index) {
                                  setState(() {
                                    _currentImageIndex = index;
                                  });
                                },
                                itemBuilder: (context, index) {
                                  return Image.network(
                                    template.images[index],
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                              color: AppColors.inputBackground,
                                              child: const Icon(
                                                Icons.image_outlined,
                                                color: AppColors.icon,
                                                size: 60,
                                              ),
                                            ),
                                  );
                                },
                              )
                            : (template.imageUrl.isNotEmpty
                                  ? Image.network(
                                      template.imageUrl,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Container(
                                                color:
                                                    AppColors.inputBackground,
                                                child: const Icon(
                                                  Icons.image_outlined,
                                                  color: AppColors.icon,
                                                  size: 60,
                                                ),
                                              ),
                                    )
                                  : Container(
                                      color: AppColors.inputBackground,
                                      child: const Icon(
                                        Icons.image_outlined,
                                        color: AppColors.icon,
                                        size: 60,
                                      ),
                                    )),
                      ),
                      // Gradient overlay
                      Positioned.fill(
                        child: IgnorePointer(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withValues(alpha: 0.72),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Back button
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 8,
                        left: 12,
                        child: SafeArea(
                          child: Material(
                            color: Colors.black26,
                            shape: const CircleBorder(),
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              onTap: () => Navigator.of(context).pop(),
                              child: const Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Tour name at bottom of image
                      Positioned(
                        left: 16,
                        right: 16,
                        bottom: template.images.length > 1 ? 40 : 20,
                        child: Text(
                          template.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: AppTextTheme.headlineSmall,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Dots Indicator
                      if (template.images.length > 1)
                        Positioned(
                          bottom: 16,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              template.images.length,
                              (index) => Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                width: _currentImageIndex == index ? 24 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: _currentImageIndex == index
                                      ? AppColors.primary
                                      : Colors.white.withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),

                  // ── Description ───────────────────────────────────────────
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Text(
                      template.description,
                      style: const TextStyle(
                        fontSize: AppTextTheme.bodyMedium,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ── Giá vé ────────────────────────────────────────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionHeader('Giá vé'),
                        const SizedBox(height: 12),
                        _buildPriceRow(
                          'Người lớn',
                          _formatPrice(template.adultPrice),
                        ),
                        const SizedBox(height: 8),
                        _buildPriceRow(
                          'Trẻ em',
                          _formatPrice(template.childPrice),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ── Địa điểm ──────────────────────────────────────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionHeader('Địa điểm'),
                        const SizedBox(height: 12),
                        _buildLocationRow(
                          'Điểm xuất phát',
                          template.startLocation.isNotEmpty
                              ? template.startLocation
                              : 'Chưa cập nhật',
                        ),
                        const SizedBox(height: 8),
                        _buildLocationRow(
                          'Điểm đến',
                          template.destination.isNotEmpty
                              ? template.destination
                              : 'Chưa cập nhật',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // // ── Khách sạn ────────────────────────────────────────────
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       _buildSectionHeader('Khách sạn'),
                  //       const SizedBox(height: 12),
                  //       _buildHotelCard(),
                  //     ],
                  //   ),
                  // ),

                  // const SizedBox(height: 24),
                ],
              ),
            ),
          ),

          // ── Bottom Actions ────────────────────────────────────────────────
          Container(
            padding: EdgeInsets.fromLTRB(
              16,
              12,
              16,
              MediaQuery.of(context).padding.bottom + 12,
            ),
            decoration: BoxDecoration(
              color: AppColors.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.07),
                  blurRadius: 12,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CoordinatorButton(
                  text: 'Tạo tour mới từ lộ trình này',
                  color: AppColors.primary,
                  onTap: () {
                    context.push(Routes.coordinatorCreateTour, extra: template);
                  },
                ),
                const SizedBox(height: 10),
                CoordinatorButton(
                  text: 'Xóa lộ trình',
                  color: AppColors.error,
                  prefixIcon: Icons.delete_outline,
                  onTap: () {
                    _showDeleteConfirmDialog(context, template);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: AppTextTheme.labelMedium,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow(String label, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: AppTextTheme.bodyMedium,
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          price,
          style: const TextStyle(
            fontSize: AppTextTheme.bodyMedium,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: AppTextTheme.bodyMedium,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: AppTextTheme.bodyMedium,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  // Widget _buildHotelCard() {
  //   // Fallback mock hotel data since the template model may not have hotel info
  //   const hotelName = 'Khách sạn Hoa Cương';
  //   const hotelAddress = 'Tổ 1, Thị trấn Đồng Văn, Tỉnh Khánh Hòa';
  //   const hotelRooms = '12 giường đơn';

  //   return Container(
  //     decoration: BoxDecoration(
  //       color: AppColors.surface,
  //       borderRadius: BorderRadius.circular(12),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withValues(alpha: 0.05),
  //           blurRadius: 8,
  //           offset: const Offset(0, 3),
  //         ),
  //       ],
  //     ),
  //     padding: const EdgeInsets.all(12),
  //     child: Row(
  //       children: [
  //         // Hotel image placeholder
  //         ClipRRect(
  //           borderRadius: BorderRadius.circular(8),
  //           child: Container(
  //             width: 72,
  //             height: 72,
  //             color: AppColors.inputBackground,
  //             child: const Icon(
  //               Icons.hotel_outlined,
  //               color: AppColors.primary,
  //               size: 32,
  //             ),
  //           ),
  //         ),
  //         const SizedBox(width: 12),
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               const Text(
  //                 hotelName,
  //                 style: TextStyle(
  //                   fontSize: AppTextTheme.bodyMedium,
  //                   fontWeight: FontWeight.bold,
  //                   color: AppColors.textPrimary,
  //                 ),
  //                 maxLines: 1,
  //                 overflow: TextOverflow.ellipsis,
  //               ),
  //               const SizedBox(height: 4),
  //               Row(
  //                 children: const [
  //                   Icon(
  //                     Icons.location_on_outlined,
  //                     size: 13,
  //                     color: AppColors.textSecondary,
  //                   ),
  //                   SizedBox(width: 3),
  //                   Expanded(
  //                     child: Text(
  //                       hotelAddress,
  //                       style: TextStyle(
  //                         fontSize: AppTextTheme.bodySmall,
  //                         color: AppColors.textSecondary,
  //                       ),
  //                       maxLines: 1,
  //                       overflow: TextOverflow.ellipsis,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(height: 4),
  //               Row(
  //                 children: const [
  //                   Icon(
  //                     Icons.bed_outlined,
  //                     size: 13,
  //                     color: AppColors.textSecondary,
  //                   ),
  //                   SizedBox(width: 3),
  //                   Text(
  //                     hotelRooms,
  //                     style: TextStyle(
  //                       fontSize: AppTextTheme.bodySmall,
  //                       color: AppColors.textSecondary,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  void _showDeleteConfirmDialog(
    BuildContext context,
    CoordinatorTourTemplate template,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xóa lộ trình'),
        content: const Text(
          'Bạn có chắc muốn xóa lộ trình này không? Hành động này không thể hoàn tác.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              widget.viewModel.deleteTemplate.execute(template.id);
            },
            child: const Text('Xóa', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
  }
}
