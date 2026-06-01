import 'package:flutter/material.dart';
import 'widgets/amenity_card.dart';
import 'widgets/small_button.dart';
import 'update_amenity_screen.dart';
import 'create_amenity_screen.dart';

class AmenityManagementScreen extends StatefulWidget {
  const AmenityManagementScreen({super.key});

  @override
  State<AmenityManagementScreen> createState() =>
      _AmenityManagementScreenState();
}

class _AmenityManagementScreenState extends State<AmenityManagementScreen> {
  String selectedFilter = 'Tất cả';
  final List<String> filters = ['Tất cả', 'Phòng', 'Khách sạn'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Cơ sở vật chất',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
                SmallButton(
                  label: 'Thêm',
                  prefixIcon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAmenityScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Danh sách các cơ sở vật chất',
              style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 16),
            Row(
              children: filters.map((filter) {
                final isSelected = selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF003399)
                            : const Color(0xFFDCE6FB),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        filter,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF64748B),
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  AmenityCard(
                    title: 'WIFI miễn phí',
                    subtitle: 'Khách sạn',
                    iconData: Icons.wifi,
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdateAmenityScreen(
                            amenityType: 'Khách sạn',
                            amenityName: 'WIFI miễn phí',
                            iconData: Icons.wifi,
                          ),
                        ),
                      );
                    },
                  ),
                  AmenityCard(
                    title: 'Ẩm thực Á-Âu',
                    subtitle: 'Khách sạn',
                    iconData: Icons.restaurant,
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdateAmenityScreen(
                            amenityType: 'Khách sạn',
                            amenityName: 'Ẩm thực Á-Âu',
                            iconData: Icons.restaurant,
                          ),
                        ),
                      );
                    },
                  ),
                  AmenityCard(
                    title: 'Bồn tắm',
                    subtitle: 'Phòng',
                    iconData: Icons.bathtub,
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdateAmenityScreen(
                            amenityType: 'Phòng',
                            amenityName: 'Bồn tắm',
                            iconData: Icons.bathtub,
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
