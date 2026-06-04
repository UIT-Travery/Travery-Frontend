import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/domain/models/receptionist/recep_room/recep_room.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_check_in_out_card.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_large_button.dart';

class RecepViewCheckinoutListScreen extends StatefulWidget {
  const RecepViewCheckinoutListScreen({super.key});

  @override
  State<RecepViewCheckinoutListScreen> createState() =>
      _RecepViewCheckinoutListScreenState();
}

class _RecepViewCheckinoutListScreenState
    extends State<RecepViewCheckinoutListScreen> {
  String _selectedFilter = 'TẤT CẢ';

  Widget _buildFilterChip(String label) {
    final isSelected = _selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = label;
        });
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
      backgroundColor: AppColors.background,
      appBar: AppBar(
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
              child: const CircleAvatar(
                backgroundColor: AppColors.primaryDarkBlackBlue,
                child: Icon(Icons.person, color: Colors.white, size: 20),
              ),
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
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
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
              child: ListView(
                children: [
                  RecepCheckInOutCard(
                    guestName: 'Trần Văn A',
                    roomCount: 3,
                    guestCount: 6,
                    roomType: 'Standard',
                    bedType: RecepBedType.single,
                    bedCount: 2,
                    isCheckIn: true,
                    date: 'Today',
                    onTapAction: () {},
                  ),
                  const SizedBox(height: 16),
                  RecepCheckInOutCard(
                    guestName: 'Trần Văn A',
                    roomCount: 3,
                    guestCount: 6,
                    roomType: 'Standard',
                    bedType: RecepBedType.single,
                    bedCount: 2,
                    isCheckIn: true,
                    date: '26/05/2026',
                    onTapAction: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
