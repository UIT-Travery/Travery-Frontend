import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_large_button.dart';

class RecepRoomSelectionScreen extends StatefulWidget {
  const RecepRoomSelectionScreen({super.key});

  @override
  State<RecepRoomSelectionScreen> createState() => _RecepRoomSelectionScreenState();
}

class _RecepRoomSelectionScreenState extends State<RecepRoomSelectionScreen> {
  final List<int> selectedIndices = [0, 2];

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
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chọn phòng',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Vui lòng chọn 3 phòng theo yêu cầu của hành khách',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryDarkBlackBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.filter_alt_outlined, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Text('Lọc', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  _buildRoomSelectCard(0, '101', 'Standard', '1 Giường đôi', true),
                  const SizedBox(height: 12),
                  _buildRoomSelectCard(1, '101', 'VIP', '1 Giường đơn', true),
                  const SizedBox(height: 12),
                  _buildRoomSelectCard(2, '101', 'Suite', '2 Giường đôi', true),
                  const SizedBox(height: 12),
                  _buildRoomSelectCard(3, '101', 'Standard', '1 Giường đôi', true),
                  const SizedBox(height: 12),
                  _buildRoomSelectCard(4, '101', 'Standard', '1 Giường đôi', true),
                  const SizedBox(height: 12),
                  _buildRoomSelectCard(5, '101', 'Standard', '1 Giường đôi', true),
                  const SizedBox(height: 12),
                  _buildRoomSelectCard(6, '101', 'Standard', '1 Giường đôi', true),
                ],
              ),
            ),
            const SizedBox(height: 16),
            RecepLargeButton(
              label: 'Xác nhận chọn phòng',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRoomSelectCard(int index, String roomNumber, String type, String bed, bool isAvailable) {
    bool isSelected = selectedIndices.contains(index);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedIndices.remove(index);
          } else {
            selectedIndices.add(index);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primaryDarkBlackBlue : AppColors.inputBorder,
            width: isSelected ? 2 : 1,
          )
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  roomNumber,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  type,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.bed, size: 16, color: AppColors.textSecondary),
                        const SizedBox(width: 4),
                        Text(
                          bed,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryDarkBlackBlue, // Note color from image
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'Trống',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            if (isSelected)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.primaryDarkBlackBlue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
