import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_small_button.dart';

class RecepDashboardCheckoutList extends StatefulWidget {
  const RecepDashboardCheckoutList({super.key});

  @override
  State<RecepDashboardCheckoutList> createState() => _RecepDashboardCheckoutListState();
}

class _RecepDashboardCheckoutListState extends State<RecepDashboardCheckoutList> {
  bool _showAll = false;

  final List<Map<String, String>> _mockData = [
    {
      'name': 'N. Kim Oanh',
      'phone': '0908090876',
      'time': '12:00- HÔM NAY',
    },
    {
      'name': 'H. Minh Chiến',
      'phone': '0909000222',
      'time': '12:00- 27/05/2026',
    },
    {
      'name': 'Trần Anh',
      'phone': '0909111222',
      'time': '12:00- 28/05/2026',
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
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Chi tiết Check-out',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDarkBlackBlue,
              ),
            ),
          ),
          
          // List Items
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: itemsToShow.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FAFB),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item['name']} - ${item['phone']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFF111827),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['time']!,
                            style: const TextStyle(
                              color: Color(0xFF9CA3AF),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      RecepSmallButton(
                        label: 'Check-out',
                        onTap: () {
                          // TODO: Implement checkout
                        },
                      ),
                    ],
                  ),
                ),
              )).toList(),
            ),
          ),
          
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
