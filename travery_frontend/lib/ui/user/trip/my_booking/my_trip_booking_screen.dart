import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/trip/my_booking/view_models/my_trip_booking_view_model.dart';
import 'package:travery_frontend/ui/user/trip/widgets/trip_booking_card.dart';
import 'package:travery_frontend/ui/user/widgets/empty_state.dart';
import 'package:travery_frontend/ui/user/widgets/error_state.dart';
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
  late int _selectedIndex;
  bool _showRail = false;

  static const _titles = [
    'Đơn đặt tour của tôi',
    'Đơn đặt xe của tôi',
    'Đơn đặt phòng của tôi',
  ];
  static const _railItems = [
    _RailItem(
      icon: Icons.confirmation_number_outlined,
      selectedIcon: Icons.confirmation_number,
      label: 'Tour',
    ),
    _RailItem(
      icon: Icons.directions_bus_outlined,
      selectedIcon: Icons.directions_bus,
      label: 'Xe khách',
    ),
    _RailItem(
      icon: Icons.hotel_outlined,
      selectedIcon: Icons.hotel,
      label: 'Khách sạn',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final tab = GoRouterState.of(context).uri.queryParameters['tab'];
    final parsed = int.tryParse(tab ?? '')?.clamp(0, 2) ?? 0;
    if (parsed != _selectedIndex) {
      setState(() => _selectedIndex = parsed);
    }
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
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: IndexedStack(
                    index: _selectedIndex,
                    children: const [
                      BookingListScreen(showHeader: false),
                      _TripBookingListContent(),
                      _HotelBookingListContent(),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  width: _showRail ? 80 : 0,
                  child: _showRail
                      ? _buildNavigationRail()
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  _titles[_selectedIndex],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF131B2E),
                  ),
                ),
              ),
              IconButton(
                onPressed: () => setState(() => _showRail = !_showRail),
                icon: Icon(
                  _showRail ? Icons.view_sidebar : Icons.view_sidebar_outlined,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 4),
          Container(color: const Color(0xFFE8EAF0), height: 1),
        ],
      ),
    );
  }

  Widget _buildNavigationRail() {
    return NavigationRail(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          _selectedIndex = index;
          _showRail = false;
        });
        context.go('${Routes.tripMyBookings}?tab=$index');
      },
      backgroundColor: Colors.white,
      indicatorColor: AppColors.primary.withValues(alpha: 0.1),
      labelType: NavigationRailLabelType.selected,
      destinations: _railItems
          .map(
            (d) => NavigationRailDestination(
              icon: Icon(d.icon),
              selectedIcon: Icon(d.selectedIcon, color: AppColors.primary),
              label: Text(d.label, style: const TextStyle(fontSize: 11)),
            ),
          )
          .toList(),
    );
  }
}

class _RailItem {
  final IconData icon;
  final IconData selectedIcon;
  final String label;

  const _RailItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
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
          onRefresh: () async =>
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
