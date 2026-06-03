import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/domain/models/receptionist/recep_add_on/recep_add_on.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_add_on_card.dart';

class RecepViewAddonListScreen extends StatefulWidget {
  const RecepViewAddonListScreen({super.key});

  @override
  State<RecepViewAddonListScreen> createState() => _RecepViewAddonListScreenState();
}

class _RecepViewAddonListScreenState extends State<RecepViewAddonListScreen> {
  String selectedFilter = 'TẤT CẢ';

  final List<String> filters = [
    'TẤT CẢ',
    'SPA',
    'GIẶT ỦI',
    'BỮA SÁNG',
    'BỮA TRƯA',
    'BỮA TỐI'
  ];

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
            Text('Lễ tân', style: TextStyle(color: AppColors.primaryDarkBlackBlue, fontWeight: FontWeight.bold, fontSize: 16)),
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
          )
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Yêu cầu Tiện ích',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Quản lý và cập nhật trạng thái dịch vụ nhanh chóng.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            // Filter list
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: filters.map((filter) {
                  bool isSelected = selectedFilter == filter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryDarkBlackBlue : AppColors.primaryLightWhiteBlue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          filter,
                          style: TextStyle(
                            color: isSelected ? Colors.white : AppColors.textSecondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),
            // Addon List
            Expanded(
              child: ListView(
                children: [
                  RecepAddOnCard(
                    type: RecepAddonType.spa,
                    guestName: 'Trần Thị B',
                    guestCount: 3,
                    onCheckTap: () {},
                  ),
                  const SizedBox(height: 16),
                  RecepAddOnCard(
                    type: RecepAddonType.laundry,
                    guestName: 'Trần Thị B',
                    guestCount: 3,
                    onCheckTap: () {},
                  ),
                  const SizedBox(height: 16),
                  RecepAddOnCard(
                    type: RecepAddonType.breakfast,
                    guestName: 'Trần Thị B',
                    guestCount: 3,
                    onCheckTap: () {},
                  ),
                  const SizedBox(height: 16),
                  RecepAddOnCard(
                    type: RecepAddonType.lunch,
                    guestName: 'Trần Thị B',
                    guestCount: 3,
                    onCheckTap: () {},
                  ),
                  const SizedBox(height: 16),
                  RecepAddOnCard(
                    type: RecepAddonType.dinner,
                    guestName: 'Trần Thị B',
                    guestCount: 3,
                    onCheckTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
