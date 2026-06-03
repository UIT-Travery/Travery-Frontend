import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/trip/my_booking/view_models/my_trip_booking_view_model.dart';
import 'package:travery_frontend/ui/user/trip/widgets/trip_booking_card.dart';
import 'package:travery_frontend/ui/user/widgets/empty_state.dart';
import 'package:travery_frontend/ui/user/widgets/error_state.dart';
import 'package:travery_frontend/ui/user/widgets/booking_navigation_shell.dart';
import 'package:travery_frontend/data/services/trip/trip_booking_repository.dart';
import 'package:travery_frontend/ui/user/hotel/my_booking/view_models/hotel_my_booking_view_model.dart';
import 'package:travery_frontend/ui/user/hotel/widgets/hotel_booking_card.dart';
import 'package:travery_frontend/ui/user/tour/booking_list/booking_list_screen.dart';

class MyTripBookingScreen extends StatefulWidget {
  const MyTripBookingScreen({super.key});

  @override
  State<MyTripBookingScreen> createState() => _MyTripBookingScreenState();
}

class _MyTripBookingScreenState extends State<MyTripBookingScreen> {
  late int _initialIndex;

  @override
  void initState() {
    super.initState();
    _initialIndex = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final tab = GoRouterState.of(context).uri.queryParameters['tab'];
    final parsed = int.tryParse(tab ?? '')?.clamp(0, 2) ?? 0;
    if (parsed != _initialIndex) {
      setState(() => _initialIndex = parsed);
    }
  }

  void _onIndexChanged(int index) {
    setState(() => _initialIndex = index);
    context.go('${Routes.tripMyBookings}?tab=$index');
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => MyTripBookingViewModel(
            repository: ctx.read<TripBookingRepository>(),
          )..loadBookings(),
        ),
        ChangeNotifierProvider(
          create: (_) => HotelMyBookingViewModel()..loadBookings(),
        ),
      ],
      child: BookingNavigationShell(
        initialIndex: _initialIndex,
        titles: const [
          'Đơn đặt tour của tôi',
          'Đơn đặt xe của tôi',
          'Đơn đặt phòng của tôi',
        ],
        showBackButton: false,
        onIndexChanged: _onIndexChanged,
        children: const [
          BookingListScreen(showHeader: false),
          _TripBookingListContent(),
          _HotelBookingListContent(),
        ],
      ),
    );
  }
}

class _TripBookingListContent extends StatelessWidget {
  const _TripBookingListContent();

  @override
  Widget build(BuildContext context) {
    return Consumer<MyTripBookingViewModel>(
      builder: (context, vm, _) {
        if (vm.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (vm.error != null) {
          return ErrorState(
            message: '',
            onRetry: () => vm.loadBookings(refresh: true),
          );
        }

        if (vm.bookings.isEmpty) {
          return const EmptyState(
            icon: Icons.directions_bus_outlined,
            title: 'Chưa có đơn đặt xe nào',
            subtitle: 'Hãy đặt xe để trải nghiệm dịch vụ!',
          );
        }

        return RefreshIndicator(
          onRefresh: () =>
              vm.loadBookings(status: vm.selectedStatus, refresh: true),
          color: AppColors.primary,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: vm.bookings.length,
            itemBuilder: (context, index) {
              final b = vm.bookings[index];
              return TripBookingCard(
                departureTime: b.departureTime,
                arrivalTime: b.estimatedArrivalTime,
                originDestination: b.originDestination,
                destinationDestination: b.destinationDestination,
                bookedSeatNames: b.bookedSeatNames,
                basePrice: b.basePrice,
                totalPrice: b.totalPrice,
                status: b.status,
                statusLabel: vm.getStatusLabel(b.status),
                coachLicensePlate: b.coachLicensePlate,
                paymentDeadline: b.paymentDeadline,
                paymentMethod: b.paymentMethod,
                paymentStatus: b.paymentStatus,
                onTap: () => context.push(
                  Routes.tripBookingDetail,
                  extra: {'booking': b},
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _HotelBookingListContent extends StatelessWidget {
  const _HotelBookingListContent();

  @override
  Widget build(BuildContext context) {
    return Consumer<HotelMyBookingViewModel>(
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
