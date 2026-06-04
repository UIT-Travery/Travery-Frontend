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
import 'package:travery_frontend/ui/user/widgets/user_app_bar.dart';
import 'package:travery_frontend/ui/user/tour/booking_list/booking_list_screen.dart';
import 'package:travery_frontend/ui/user/hotel/my_booking/hotel_my_booking_screen.dart';

class MyTripBookingScreen extends StatefulWidget {
  const MyTripBookingScreen({
    super.key,
    this.initialTab = 0,
    this.refreshTick = 0,
  });

  final int initialTab;
  final int refreshTick;

  @override
  State<MyTripBookingScreen> createState() => _MyTripBookingScreenState();
}

class _MyTripBookingScreenState extends State<MyTripBookingScreen> {
  late int _selectedIndex;
  bool _showRail = false;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialTab.clamp(0, 2);
  }

  @override
  void didUpdateWidget(MyTripBookingScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialTab != widget.initialTab) {
      setState(() => _selectedIndex = widget.initialTab.clamp(0, 2));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFF),
      appBar: UserAppBar(
        title: _titles[_selectedIndex],
        titleFontSize: 15,
        showBackButton: false,
        actions: [
          IconButton(
            onPressed: () => setState(() => _showRail = !_showRail),
            icon: Icon(
              _showRail ? Icons.close : Icons.view_sidebar_outlined,
              color: AppColors.primary,
            ),
          ),
        ],
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
        return BookingListScreen(
          key: ValueKey('tour-${widget.refreshTick}'),
          showHeader: false,
        );
      case 1:
        return _TripBookingListContent(
          key: ValueKey('trip-${widget.refreshTick}'),
        );
      case 2:
        return HotelMyBookingScreen(
          key: ValueKey('hotel-${widget.refreshTick}'),
          showHeader: false,
        );
      default:
        return BookingListScreen(
          key: ValueKey('tour-default-${widget.refreshTick}'),
          showHeader: false,
        );
    }
  }

  static const _titles = [
    'Đơn đặt tour của tôi',
    'Đơn đặt xe của tôi',
    'Đơn đặt phòng của tôi',
  ];
}

class _TripBookingListContent extends StatefulWidget {
  const _TripBookingListContent({super.key});

  @override
  State<_TripBookingListContent> createState() =>
      _TripBookingListContentState();
}

class _TripBookingListContentState extends State<_TripBookingListContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<MyTripBookingViewModel>().loadBookings(refresh: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyTripBookingViewModel>(
      builder: (context, vm, _) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: vm.statusFilters.map((filter) {
                    final isSelected = vm.selectedStatus == filter;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () =>
                            vm.loadBookings(status: filter, refresh: true),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? _getChipColor(filter)
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
              child: vm.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : vm.error != null
                  ? ErrorState(
                      message: '',
                      onRetry: () => vm.loadBookings(refresh: true),
                    )
                  : vm.bookings.isEmpty
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
                              if (!context.mounted || paymentUrl == null) {
                                return;
                              }
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
      case 'CHECKED_IN':
        return 'Đã check-in';
      case 'CHECKED_OUT':
        return 'Đã check-out';
      case 'CANCELLED':
        return 'Đã hủy';
      case 'NO_SHOW':
        return 'Không đến';
      default:
        return filter;
    }
  }

  Color _getChipColor(String filter) {
    switch (filter) {
      case 'PAID':
        return const Color(0xFF10B981);
      case 'CHECKED_IN':
        return const Color(0xFF007AFF);
      case 'CHECKED_OUT':
        return const Color(0xFF6B7280);
      case 'CANCELLED':
        return const Color(0xFFEF4444);
      case 'NO_SHOW':
      case 'PENDING':
      default:
        return const Color(0xFFF59E0B);
    }
  }
}
