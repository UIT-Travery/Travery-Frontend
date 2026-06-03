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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.loadHotels.execute();
    });
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
                listenable: vm.loadHotels,
                builder: (context, _) {
                  final cmd = vm.loadHotels;

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
                            'Không thể tải danh sách khách sạn',
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

                  final hotels = cmd.result is Ok<List<BusinessHotel>>
                      ? (cmd.result as Ok<List<BusinessHotel>>).value
                      : <BusinessHotel>[];

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
                                  onTap: () => {
                                    context.push(Routes.adminCreateHotel),
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
                          padding: const EdgeInsets.only(
                            bottom: 10,
                            left: 16,
                            right: 16,
                          ),
                          itemCount: hotels.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final h = hotels[index];
                            return HotelCard(
                              name: h.name,
                              address: h.address,
                              cityProvince: h.cityProvince,
                              starRating: h.starRating!,
                              roomCount: h.roomCount!,
                              occupancyRate: h.occupancyRate!,
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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Xem chi tiết: ${h.name}'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
