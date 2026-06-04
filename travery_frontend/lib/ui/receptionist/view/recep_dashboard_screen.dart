import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_dashboard_info_box.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_dashboard_checkin_list.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_dashboard_checkout_list.dart';

class RecepDashboardScreen extends StatefulWidget {
  const RecepDashboardScreen({super.key});

  @override
  State<RecepDashboardScreen> createState() => _RecepDashboardScreenState();
}

class _RecepDashboardScreenState extends State<RecepDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FB),
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(
                Icons.home_outlined,
                color: Color(0xFF1E3A8A),
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Lễ tân',
              style: TextStyle(
                color: Color(0xFF1E3A8A),
                fontWeight: FontWeight.bold,
                fontSize: 18,
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
                radius: 16,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bảng Điều Khiển',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E232C),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '14:30, 24/05/2024',
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(
                  child: RecepDashboardInfoBox(
                    label: 'Sẵn sàng',
                    quantity: '42',
                    status: 'Trống',
                    color: 'green',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: RecepDashboardInfoBox(
                    label: 'Đang ở',
                    quantity: '118',
                    status: 'Chiếm',
                    color: 'blue',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Row(
              children: [
                Expanded(
                  child: RecepDashboardInfoBox(
                    label: 'Đang dọn',
                    quantity: '08',
                    status: 'Vệ sinh',
                    color: 'yellow',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: RecepDashboardInfoBox(
                    label: 'Bảo trì',
                    quantity: '03',
                    status: 'Sửa',
                    color: 'red',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const RecepDashboardCheckinList(),
            const SizedBox(height: 24),
            const RecepDashboardCheckoutList(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
