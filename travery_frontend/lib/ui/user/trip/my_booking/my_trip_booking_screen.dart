import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/trip/my_booking/view_models/my_trip_booking_view_model.dart';
import 'package:travery_frontend/ui/user/trip/widgets/trip_booking_card.dart';
import 'package:travery_frontend/ui/user/tour/booking_list/booking_list_screen.dart';
import 'package:travery_frontend/ui/user/widgets/user_app_bar.dart';
import 'package:travery_frontend/ui/user/hotel/my_booking/hotel_my_booking_screen.dart';

class MyTripBookingScreen extends StatefulWidget {
  const MyTripBookingScreen({super.key});

  @override
  State<MyTripBookingScreen> createState() => _MyTripBookingScreenState();
}

class _MyTripBookingScreenState extends State<MyTripBookingScreen> {
  int _selectedNavIndex = 0;
  bool _showRail = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MyTripBookingViewModel>().loadBookings();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFF),
      appBar: UserAppBar(
        title: 'Đơn đặt vé của tôi',
        showBackButton: false,
        actions: [
          IconButton(
            onPressed: () => setState(() => _showRail = !_showRail),
            icon: Icon(
              _showRail ? Icons.view_sidebar : Icons.view_sidebar_outlined,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(child: _buildContent()),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: _showRail ? 80 : 0,
            child: _showRail
                ? NavigationRail(
                    selectedIndex: _selectedNavIndex,
                    onDestinationSelected: (index) {
                      setState(() {
                        _selectedNavIndex = index;
                        _showRail = false;
                      });
                    },
                    backgroundColor: Colors.white,
                    indicatorColor: AppColors.primary.withValues(alpha: 0.1),
                    labelType: NavigationRailLabelType.selected,
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.confirmation_number_outlined),
                        selectedIcon: Icon(
                          Icons.confirmation_number,
                          color: AppColors.primary,
                        ),
                        label: Text('Tour', style: TextStyle(fontSize: 11)),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.directions_bus_outlined),
                        selectedIcon: Icon(
                          Icons.directions_bus,
                          color: AppColors.primary,
                        ),
                        label: Text('Xe khách', style: TextStyle(fontSize: 11)),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.hotel_outlined),
                        selectedIcon: Icon(
                          Icons.hotel,
                          color: AppColors.primary,
                        ),
                        label: Text(
                          'Khách sạn',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedNavIndex) {
      case 0:
        return const BookingListScreen();
      case 1:
        return const _TripBookingListContent();
      case 2:
        return const HotelMyBookingScreen();
      default:
        return const BookingListScreen();
    }
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

        if (vm.bookings.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.directions_bus_outlined,
                  size: 64,
                  color: Color(0xFFE2E8F0),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Chưa có đơn đặt xe nào',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF414755),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Hãy đặt xe để trải nghiệm dịch vụ!',
                  style: TextStyle(fontSize: 13, color: Color(0xFF717786)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => context.go(Routes.tripHome),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Đặt xe ngay'),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () =>
              vm.loadBookings(status: vm.selectedStatus, refresh: true),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: vm.statusFilters.map((filter) {
                      final isSelected =
                          (vm.selectedStatus ?? 'Tất cả') == filter;
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
                              color: isSelected
                                  ? AppColors.primary
                                  : const Color(0xFFDAE2FD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              _getStatusDisplayName(filter),
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xFF414755),
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
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  itemCount: vm.bookings.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
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
              ),
            ],
          ),
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
      case 'CANCELLED':
        return 'Đã hủy';
      default:
        return filter;
    }
  }
}
