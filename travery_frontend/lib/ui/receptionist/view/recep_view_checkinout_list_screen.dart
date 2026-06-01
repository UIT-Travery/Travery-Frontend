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
  bool isCheckInList = true;

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
            Text(
              isCheckInList
                  ? 'Danh sách khách check-in'
                  : 'Danh sách khách check-out',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              isCheckInList
                  ? 'Chọn một hành khách để tiến hành check-in'
                  : 'Chọn một hành khách để tiến hành check-out',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: RecepLargeButton(
                    label: 'CHECK-IN',
                    backgroundColor: isCheckInList
                        ? AppColors.primaryDarkBlackBlue
                        : AppColors.primaryLightWhiteBlue,
                    textColor: isCheckInList
                        ? Colors.white
                        : AppColors.textSecondary,
                    onTap: () {
                      setState(() {
                        isCheckInList = true;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: RecepLargeButton(
                    label: 'CHECK-OUT',
                    backgroundColor: !isCheckInList
                        ? AppColors.primaryDarkBlackBlue
                        : AppColors.primaryLightWhiteBlue,
                    textColor: !isCheckInList
                        ? Colors.white
                        : AppColors.textSecondary,
                    onTap: () {
                      setState(() {
                        isCheckInList = false;
                      });
                    },
                  ),
                ),
              ],
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
                    isCheckIn: isCheckInList,
                    date: isCheckInList ? 'Today' : '26/05/2026',
                    onTapAction: () {},
                  ),
                  const SizedBox(height: 16),
                  RecepCheckInOutCard(
                    guestName: 'Trần Văn B',
                    roomCount: 1,
                    guestCount: 2,
                    roomType: 'Standard',
                    bedType: RecepBedType.double,
                    bedCount: 1,
                    isCheckIn: isCheckInList,
                    date: isCheckInList ? 'Today' : '26/05/2026',
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
