import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/admin/view/widgets/small_button.dart';
import 'package:travery_frontend/utils/core_result.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_theme.dart';
import 'widgets/hotel_card.dart';
import 'package:travery_frontend/domain/models/admin/business_hotel/business_hotel.dart';
import 'package:travery_frontend/ui/admin/view_model/hotel_management_view_model.dart';

class HotelManagementScreen extends StatefulWidget {
  const HotelManagementScreen({super.key, required this.viewModel});

  final HotelManagementViewModel viewModel;

  @override
  State<HotelManagementScreen> createState() => _HotelManagementScreenState();
}

class _HotelManagementScreenState extends State<HotelManagementScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.loadHotels();
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      widget.viewModel.loadMoreHotels();
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.viewModel;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // ── Content ──────────────────────────────────────────────────────
            Expanded(
              child: ListenableBuilder(
                listenable: vm,
                builder: (context, _) {
                  if (vm.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (vm.hasError) {
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
                            'Không thể tải danh sách khách sạn',
                            style: TextStyle(
                              fontSize: AppTextTheme.bodyLarge,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () => vm.loadHotels(),
                            child: const Text('Thử lại'),
                          ),
                        ],
                      ),
                    );
                  }

                  final hotels = vm.hotels;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── Page header ────────────────────────────────────────
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                          left: 16,
                          right: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Khách sạn hoạt động',
                                  style: TextStyle(
                                    fontSize: AppTextTheme.headlineLarge,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                SmallButton(
                                  prefixIcon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  label: 'Thêm',
                                  onTap: () async {
                                    await context.push(Routes.adminCreateHotel);
                                    print('Returned to HotelManagementScreen, executing loadHotels...');
                                    vm.loadHotels();
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Hiện có ${hotels.length} cơ sở đang vận hành',
                              style: TextStyle(
                                fontSize: AppTextTheme.bodySmall,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ── Hotel list ─────────────────────────────────────────
                      Expanded(
                        child: ListView.separated(
                          controller: _scrollController,
                          padding: const EdgeInsets.only(
                            bottom: 10,
                            left: 16,
                            right: 16,
                          ),
                          itemCount: hotels.length + (vm.isLoadingMore ? 1 : 0),
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            if (index == hotels.length) {
                              return const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Center(child: CircularProgressIndicator()),
                              );
                            }
                            final h = hotels[index];
                            return HotelCard(
                              name: h.name,
                              address: h.address,
                              cityProvince: h.cityProvince,
                              starRating: h.starRating ?? 0.0,
                              roomCount: h.roomCount ?? 0,
                              occupancyRate: h.occupancyRate ?? 0.0,
                              imageUrl: h.imageUrl,
                              onTap: () => _onHotelTap(h),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Handlers ─────────────────────────────────────────────────────────────────
  void _onHotelTap(BusinessHotel h) {
    context.push(
      Routes.adminHotelDetail,
      extra: h,
    );
  }
}
