import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/trip/my_booking/view_models/my_trip_booking_view_model.dart';
import 'package:travery_frontend/ui/user/trip/widgets/trip_booking_card.dart';
import 'package:travery_frontend/ui/user/widgets/empty_state.dart';
import 'package:travery_frontend/ui/user/widgets/error_state.dart';
import 'package:travery_frontend/ui/user/tour/booking_list/booking_list_screen.dart';
import 'package:travery_frontend/ui/user/hotel/my_booking/hotel_my_booking_screen.dart';
import 'package:travery_frontend/ui/user/hotel/my_booking/view_models/hotel_my_booking_view_model.dart';

class MyTripBookingScreen extends StatelessWidget {
  const MyTripBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HotelMyBookingViewModel()..loadBookings(),
        ),
      ],
      child: const _MyTripBookingContent(),
    );
  }
}

class _MyTripBookingContent extends StatefulWidget {
  const _MyTripBookingContent();

  @override
  State<_MyTripBookingContent> createState() => _MyTripBookingContentState();
}

class _MyTripBookingContentState extends State<_MyTripBookingContent> {
  late int _selectedIndex;
  bool _showRail = false;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final showRail =
          GoRouterState.of(context).uri.queryParameters['rail'] == 'true';
      if (showRail) setState(() => _showRail = true);
    });
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
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFF),
      appBar: _buildAppBar(),
      body: Row(
        children: [
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                const BookingListScreen(showHeader: false),
                const _TripBookingListContent(),
                const HotelMyBookingScreen(showHeader: false),
              ],
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: _showRail ? 80 : 0,
            child: _showRail
                ? NavigationRail(
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
                    leading: IconButton(
                      icon: const Icon(Icons.close, size: 20),
                      onPressed: () => setState(() => _showRail = false),
                    ),
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

  AppBar _buildAppBar() {
    final titles = [
      'Đơn đặt tour của tôi',
      'Đơn đặt xe của tôi',
      'Đơn đặt phòng của tôi',
    ];
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        titles[_selectedIndex],
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
          icon: const Icon(
            Icons.view_sidebar_outlined,
            color: AppColors.primary,
          ),
        ),
      ],
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: _HeaderDivider(),
      ),
    );
  }
}

class _HeaderDivider extends StatelessWidget {
  const _HeaderDivider();

  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFFE8EAF0), height: 1);
  }
}

class _TripBookingListContent extends StatefulWidget {
  const _TripBookingListContent();

  @override
  State<_TripBookingListContent> createState() =>
      _TripBookingListContentState();
}

class _TripBookingListContentState extends State<_TripBookingListContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyTripBookingViewModel>(
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
