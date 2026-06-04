import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/common/notification/view/widgets/notification_badge.dart';
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
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFFE0E7FF),
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
          NotificationBadge(
            onTap: () => context.push(Routes.notifications),
            iconColor: const Color(0xFF1E3A8A),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () => context.push(Routes.recepProfile),
              child: const CircleAvatar(
                radius: 16,
                backgroundImage:
                    NetworkImage('https://i.pravatar.cc/150?img=11'),
              ),
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: RecepDashboardInfoBox(
                    label: 'Sắp đến',
                    quantity: '12',
                    status: '+2',
                    color: 'blue',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: RecepDashboardInfoBox(
                    label: 'Sắp đi',
                    quantity: '08',
                    status: '-1',
                    color: 'yellow',
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Khách sắp đến',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            RecepDashboardCheckinList(),
            SizedBox(height: 24),
            Text(
              'Khách sắp đi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            RecepDashboardCheckoutList(),
          ],
        ),
      ),
    );
  }
}
