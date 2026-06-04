import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/data/services/trip/trip_booking_repository.dart';
import 'package:travery_frontend/ui/user/trip/my_booking/view_models/my_trip_booking_view_model.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'package:travery_frontend/ui/user/trip/widgets/trip_booking_card.dart';
import 'package:travery_frontend/ui/user/widgets/empty_state.dart';
import 'package:travery_frontend/ui/user/widgets/error_state.dart';
import 'package:travery_frontend/ui/user/tour/booking_list/booking_list_screen.dart';
import 'package:travery_frontend/ui/user/hotel/my_booking/hotel_my_booking_screen.dart';

class MyTripBookingScreen extends StatefulWidget {
  const MyTripBookingScreen({super.key});

  @override
  State<MyTripBookingScreen> createState() => _MyTripBookingScreenState();
}

class _MyTripBookingScreenState extends State<MyTripBookingScreen> {
  int _selectedIndex = 0;
  bool _showRail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF131B2E),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => setState(() => _showRail = !_showRail),
            icon: Icon(
              _showRail ? Icons.close : Icons.view_sidebar_outlined,
              color: AppColors.primary,
            ),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: SizedBox(
            height: 1,
            child: ColoredBox(color: Color(0xFFE8EAF0)),
          ),
        ),
      ),
      body: Row(
        children: [
          Expanded(child: _buildCurrentTab()),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: _showRail ? 80 : 0,
            child: _showRail
                ? NavigationRail(
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: (i) => setState(() {
                      _selectedIndex = i;
                      _showRail = false;
                    }),
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
                        label: Text('Tour', style: TextStyle(fontSize: 10)),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.directions_bus_outlined),
                        selectedIcon: Icon(
                          Icons.directions_bus,
                          color: AppColors.primary,
                        ),
                        label: Text('Xe khách', style: TextStyle(fontSize: 10)),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.hotel_outlined),
                        selectedIcon: Icon(
                          Icons.hotel,
                          color: AppColors.primary,
                        ),
                        label: Text(
                          'Khách sạn',
                          style: TextStyle(fontSize: 10),
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

  Widget _buildCurrentTab() {
    switch (_selectedIndex) {
      case 0:
        return const BookingListScreen(showHeader: false);
      case 1:
        return const _TripBookingListContent();
      case 2:
        return const HotelMyBookingScreen(showHeader: false);
      default:
        return const BookingListScreen(showHeader: false);
    }
  }

  static const _titles = [
    'Đơn đặt tour của tôi',
    'Đơn đặt xe của tôi',
    'Đơn đặt phòng của tôi',
  ];
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
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                                ? const Color(0xFF0058BC)
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
              child: vm.bookings.isEmpty
                  ? const EmptyState(
                      icon: Icons.directions_bus_outlined,
                      title: 'Chưa có đơn đặt xe nào',
                      subtitle: 'Hãy đặt xe để trải nghiệm dịch vụ!',
                    )
                  : RefreshIndicator(
                      onRefresh: () async => vm.loadBookings(
                        status: vm.selectedStatus,
                        refresh: true,
                      ),
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
                            onPay: () async {
                              final payment = b.payment;
                              String? paymentUrl;
                              if (payment != null &&
                                  payment.paymentUrl.isNotEmpty) {
                                paymentUrl = payment.paymentUrl;
                              } else {
                                final repo = context
                                    .read<TripBookingRepository>();
                                final result = await repo.createPayment(b.id);
                                paymentUrl = switch (result) {
                                  Ok(value: final d) => d.paymentUrl,
                                  Error() => null,
                                };
                              }
                              if (!context.mounted || paymentUrl == null)
                                return;
                              context.push(
                                Routes.tripPayment,
                                extra: {
                                  'bookingId': b.id,
                                  'paymentUrl': paymentUrl,
                                  'transactionId':
                                      b.payment?.transactionId ?? '',
                                  'tripName':
                                      '${b.originDestination} → ${b.destinationDestination}',
                                  'amount': b.payment?.amount ?? b.totalPrice,
                                },
                              );
                            },
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
      case 'CANCELLED':
        return 'Đã hủy';
      default:
        return filter;
    }
  }
}
