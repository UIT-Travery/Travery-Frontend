import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

class RecepDashboardCheckinList extends StatefulWidget {
  const RecepDashboardCheckinList({super.key});

  @override
  State<RecepDashboardCheckinList> createState() => _RecepDashboardCheckinListState();
}

class _RecepDashboardCheckinListState extends State<RecepDashboardCheckinList> {
  bool _showAll = false;

  final List<Map<String, String>> _mockData = [
    {
      'name': 'Lê Minh Tuấn',
      'phone': '0909400800',
      'rooms': '3',
      'people': '12',
    },
    {
      'name': 'Trần Thị Bích',
      'phone': '0908456788',
      'rooms': '6',
      'people': '12',
    },
    {
      'name': 'Nguyễn Văn A',
      'phone': '0901234567',
      'rooms': '2',
      'people': '4',
    },
    {
      'name': 'Trần Văn B',
      'phone': '0987654321',
      'rooms': '1',
      'people': '2',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final itemsToShow = _showAll ? _mockData : _mockData.take(2).toList();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Check-in Hôm nay',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDarkBlackBlue,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLightWhiteBlue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    '12 Lượt',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Table Headers
          Container(
            color: const Color(0xFFF8FAFC), 
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'KHÁCH HÀNG',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'SĐT',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'SỐ PHÒNG',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'SỐ NGƯỜI',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          
          // List Items
          ...itemsToShow.map((item) => Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade100),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        item['name']!,
                        style: const TextStyle(
                          color: Color(0xFF111827),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        item['phone']!,
                        style: const TextStyle(
                          color: AppColors.primaryDarkBlackBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        item['rooms']!,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        item['people']!,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )),
          
          // Xem tất cả button
          InkWell(
            onTap: () {
              setState(() {
                _showAll = !_showAll;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _showAll ? 'Thu gọn' : 'Xem tất cả',
                style: const TextStyle(
                  color: AppColors.primaryDarkBlackBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
