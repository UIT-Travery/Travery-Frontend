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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HotelMyBookingViewModel>().loadBookings();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFAFAFF),
      child: Consumer<HotelMyBookingViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.error != null) {
            return ErrorState(message: '', onRetry: () => vm.loadBookings());
          }

          if (vm.bookings.isEmpty) {
            return const EmptyState(
              icon: Icons.hotel_outlined,
              title: 'Chưa có đơn đặt phòng nào',
              subtitle: 'Hãy đặt phòng để trải nghiệm dịch vụ!',
            );
          }

          return RefreshIndicator(
            onRefresh: () async => vm.loadBookings(),
            color: AppColors.primary,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: vm.bookings.length,
              itemBuilder: (context, index) {
                final booking = vm.bookings[index];
                return HotelBookingCard(
                  booking: booking,
                  statusLabel: _getStatusLabel(booking.status),
                  onTap: () => context.push(
                    Routes.hotelBookingDetail.replaceFirst(':id', booking.id),
                    extra: {'booking': booking},
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  String _getStatusLabel(String status) {
    switch (status.toUpperCase()) {
      case 'PAID':
        return 'Đã thanh toán';
      case 'PENDING':
        return 'Đang chờ';
      case 'CANCELLED':
        return 'Đã hủy';
      case 'CHECKED_IN':
        return 'Đang ở';
      default:
        return status;
    }
  }
}
