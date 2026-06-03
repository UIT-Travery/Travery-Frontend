import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../domain/models/admin/business_room_type/business_room_type.dart';
import 'widgets/hotel_room_type_card.dart';
import 'widgets/small_button.dart';

class ViewRoomtypeListScreen extends StatefulWidget {
  const ViewRoomtypeListScreen({super.key});

  @override
  State<ViewRoomtypeListScreen> createState() => _ViewRoomtypeListScreenState();
}

class _ViewRoomtypeListScreenState extends State<ViewRoomtypeListScreen> {
  final List<String> categories = ['Tất cả', 'Standard', 'VIP', 'Suite'];
  String selectedCategory = 'Tất cả';

  final List<BusinessRoomType> mockRoomTypes = [
    BusinessRoomType(
      name: 'Standard',
      pricePerNight: 2450000,
      aldultCapacity: 2,
      childCapacity: 0,
      bedType: BedType.twin,
    ),
    BusinessRoomType(
      name: 'VIP',
      pricePerNight: 2450000,
      aldultCapacity: 2,
      childCapacity: 0,
      bedType: BedType.double,
    ),
    BusinessRoomType(
      name: 'Suite',
      pricePerNight: 2450000,
      aldultCapacity: 2,
      childCapacity: 0,
      bedType: BedType.single,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Quản lý Loại phòng',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Danh sách các loại phòng',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
                SmallButton(
                  label: 'Thêm',
                  prefixIcon: const Icon(
                    Icons.add,
                    size: 16,
                    color: Colors.white,
                  ),
                  color: const Color(0xFF0055C3),
                  onTap: () {
                    context.push(
                      '/admin_create_room_type_screen.dart',
                    ); // Assuming generic push for demo
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  final isSelected = category == selectedCategory;
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF0055C3)
                              : const Color(0xFFE2E8F0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF475569),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemCount: mockRoomTypes.length,
                itemBuilder: (context, index) {
                  final roomType = mockRoomTypes[index];
                  return HotelRoomTypeCard(
                    roomType: roomType,
                    onTap: () {
                      context.push(
                        '/admin_view_roomtype_screen.dart',
                        extra: roomType,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
