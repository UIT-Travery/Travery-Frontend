import 'package:flutter/material.dart';
import 'widgets/hotel_service_card.dart';
import 'widgets/small_button.dart';
import 'create_hotel_service.dart';
import 'update_hotel_service_screen.dart';

class ViewHotelServiceListScreen extends StatelessWidget {
  const ViewHotelServiceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FB),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Quản lý Dịch vụ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
                SmallButton(
                  label: 'Thêm',
                  prefixIcon: const Icon(Icons.add, color: Colors.white, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateHotelServiceScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Danh sách các dịch vụ trong khách sạn',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  HotelServiceCard(
                    title: 'Spa',
                    subtitle: 'Spa Thụy Điển',
                    price: '500.000 đ',
                    unit: '/NGƯỜI',
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdateHotelServiceScreen(
                            serviceType: 'Spa',
                            serviceName: 'Spa Thụy Điển',
                            unit: 'Người',
                            price: '500000',
                          ),
                        ),
                      );
                    },
                  ),
                  HotelServiceCard(
                    title: 'Bữa sáng',
                    subtitle: 'Bữa sáng Châu Âu',
                    price: '450.000 đ',
                    unit: '/SUẤT',
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdateHotelServiceScreen(
                            serviceType: 'Ăn uống',
                            serviceName: 'Bữa sáng Châu Âu',
                            unit: 'Suất',
                            price: '450000',
                          ),
                        ),
                      );
                    },
                  ),
                  HotelServiceCard(
                    title: 'Giặt sấy',
                    subtitle: 'Giặt sấy trong 24h',
                    price: '80.000 đ',
                    unit: '/KG',
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdateHotelServiceScreen(
                            serviceType: 'Giặt ủi',
                            serviceName: 'Giặt sấy trong 24h',
                            unit: 'KG',
                            price: '80000',
                          ),
                        ),
                      );
                    },
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
