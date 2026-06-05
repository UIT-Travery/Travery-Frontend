import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_check_in_out_card.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_app_bar_avatar.dart';
import 'package:travery_frontend/ui/receptionist/view_models/recep_view_checkinout_list_view_model.dart';

class RecepViewCheckinoutListScreen extends StatefulWidget {
  const RecepViewCheckinoutListScreen({super.key});

  @override
  State<RecepViewCheckinoutListScreen> createState() =>
      _RecepViewCheckinoutListScreenState();
}

class _RecepViewCheckinoutListScreenState
    extends State<RecepViewCheckinoutListScreen> {
  String _selectedFilter = 'TẤT CẢ';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    String? apiStatus;
    switch (_selectedFilter) {
      case 'CHỜ NHẬN PHÒNG':
        apiStatus = 'PENDING';
        break;
      case 'ĐANG Ở':
        apiStatus = 'CHECKED_IN';
        break;
      case 'ĐÃ TRẢ PHÒNG':
        apiStatus = 'CHECKED_OUT';
        break;
      case 'TẤT CẢ':
      default:
        apiStatus = null;
        break;
    }

    final viewModel = context.read<RecepViewCheckinoutListViewModel>();
    viewModel.loadBookings.execute(apiStatus);
    viewModel.loadBookings.addListener(_onResult);
  }

  @override
  void dispose() {
    final viewModel = context.read<RecepViewCheckinoutListViewModel>();
    viewModel.loadBookings.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    final viewModel = context.read<RecepViewCheckinoutListViewModel>();
    if (viewModel.loadBookings.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(viewModel.loadBookings.errorMessage ?? 'Có lỗi xảy ra'),
        ),
      );
    }
    if (mounted) setState(() {});
  }

  Widget _buildFilterChip(String label) {
    final isSelected = _selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = label;
        });
        _loadData();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryDarkBlackBlue
              : AppColors.primaryLightWhiteBlue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.primaryDarkBlackBlue,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.surface,
        title: const Row(
          children: [
            Icon(Icons.home_outlined, color: AppColors.primaryDarkBlackBlue),
            SizedBox(width: 8),
            Text(
              'Lễ tân',
              style: TextStyle(
                color: AppColors.primaryDarkBlackBlue,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () => context.push(Routes.recepProfile),
              child: const RecepAppBarAvatar(),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Danh sách khách booking',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Chọn một hành khách để tiến hành điều phối',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('TẤT CẢ'),
                  const SizedBox(width: 8),
                  _buildFilterChip('CHỜ NHẬN PHÒNG'),
                  const SizedBox(width: 8),
                  _buildFilterChip('ĐANG Ở'),
                  const SizedBox(width: 8),
                  _buildFilterChip('ĐÃ TRẢ PHÒNG'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Builder(
                builder: (context) {
                  final viewModel = context
                      .watch<RecepViewCheckinoutListViewModel>();
                  return ListenableBuilder(
                    listenable: viewModel.loadBookings,
                    builder: (context, child) {
                      final isLoading = viewModel.loadBookings.running;

                      if (isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (viewModel.bookings.isEmpty) {
                        return const Center(child: Text('Không có dữ liệu'));
                      }

                      return ListView.builder(
                        itemCount: viewModel.bookings.length,
                        itemBuilder: (context, index) {
                          final booking = viewModel.bookings[index];
                          // Note: API response RecepBookingListResponse does not have roomCount, guestCount, etc.
                          // We will map the available fields and use placeholders for others.
                          final isCheckIn = booking.status == 'PENDING';

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: RecepCheckInOutCard(
                              guestName: booking.guestName,
                              phoneNumber: booking.phoneNumber,
                              roomCount: 1, // Placeholder
                              guestCount: 2, // Placeholder
                              checkInDate: booking.checkInDate,
                              checkOutDate: booking.checkOutDate,
                              status: booking.status,
                              onTapAction: () {
                                context.push(
                                  Routes.recepDetailBooking.replaceFirst(
                                    ':id',
                                    booking.id,
                                  ),
                                  extra: {'isCheckIn': isCheckIn},
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
