import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/hotel/my_booking/view_models/hotel_my_booking_view_model.dart';
import 'package:travery_frontend/ui/user/hotel/widgets/hotel_booking_card.dart';
import 'package:travery_frontend/ui/user/widgets/empty_state.dart';
import 'package:travery_frontend/ui/user/widgets/error_state.dart';

class HotelMyBookingScreen extends StatefulWidget {
  const HotelMyBookingScreen({super.key, this.showHeader = true});

  final bool showHeader;

  @override
  State<HotelMyBookingScreen> createState() => _HotelMyBookingScreenState();
}

class _HotelMyBookingScreenState extends State<HotelMyBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HotelMyBookingViewModel>(
      builder: (context, vm, _) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: vm.statusFilters.map((filter) {
                    final isSelected =
                        (vm.selectedStatus ?? 'Tất cả') == filter;
                    final chipColor = isSelected
                        ? vm.getStatusColor(filter == 'Tất cả' ? '' : filter)
                        : const Color(0xFFDAE2FD);
                    final textColor = isSelected
                        ? Colors.white
                        : const Color(0xFF414755);
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () => vm.loadBookings(status: filter),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: chipColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            _getStatusDisplayName(filter),
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: textColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Expanded(
              child: vm.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : vm.error != null
                  ? ErrorState(message: '', onRetry: () => vm.loadBookings())
                  : vm.bookings.isEmpty
                  ? const EmptyState(
                      icon: Icons.hotel_outlined,
                      title: 'Chưa có đơn đặt phòng nào',
                      subtitle: 'Hãy đặt phòng để trải nghiệm dịch vụ!',
                    )
                  : RefreshIndicator(
                      onRefresh: () async => vm.loadBookings(),
                      color: AppColors.primary,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: vm.bookings.length,
                        itemBuilder: (context, index) {
                          final booking = vm.bookings[index];
                          return HotelBookingCard(
                            booking: booking,
                            statusLabel: vm.getStatusLabel(booking.status),
                            onTap: () => context.push(
                              Routes.hotelBookingDetail.replaceFirst(
                                ':id',
                                booking.id,
                              ),
                              extra: {'booking': booking},
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }

  String _getStatusDisplayName(String filter) {
    switch (filter) {
      case 'Tất cả':
        return 'Tất cả';
      case 'PENDING':
        return 'Đang chờ';
      case 'PAID':
        return 'Đã thanh toán';
      case 'CHECKED_IN':
        return 'Đang ở';
      case 'CHECKED_OUT':
        return 'Đã trả phòng';
      case 'CANCELLED':
        return 'Đã hủy';
      default:
        return filter;
    }
  }
}
