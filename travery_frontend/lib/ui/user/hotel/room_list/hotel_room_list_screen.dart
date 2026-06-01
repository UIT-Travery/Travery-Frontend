import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/data/models/hotel/hotel_detail_data.dart';

class HotelRoomListScreen extends StatefulWidget {
  const HotelRoomListScreen({super.key});

  @override
  State<HotelRoomListScreen> createState() => _HotelRoomListScreenState();
}

class _HotelRoomListScreenState extends State<HotelRoomListScreen> {
  final List<HotelRoomData> _selectedRooms = [];

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }

  double get _totalPrice {
    return _selectedRooms.fold(0, (sum, room) => sum + room.pricePerNight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _dummyRooms.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final room = _dummyRooms[index];
                final isSelected = _selectedRooms.contains(room);
                return _RoomCard(
                  room: room,
                  isSelected: isSelected,
                  formatPrice: _formatPrice,
                  onToggle: () {
                    setState(() {
                      if (isSelected) {
                        _selectedRooms.remove(room);
                      } else {
                        _selectedRooms.add(room);
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(
        4,
        MediaQuery.of(context).padding.top + 8,
        16,
        16,
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
          const Expanded(
            child: Text(
              'Danh sách loại phòng',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        12,
        16,
        MediaQuery.of(context).padding.bottom + 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Đã chọn ${_selectedRooms.length} phòng',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF007AFF),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Tổng cộng: ${_formatPrice(_totalPrice)}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _selectedRooms.isNotEmpty
                  ? () {
                      context.push(
                        Routes.hotelBookingInput,
                        extra: {'selectedRooms': _selectedRooms},
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF007AFF),
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey[300],
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Đặt ngay',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static final List<HotelRoomData> _dummyRooms = [
    HotelRoomData(
      id: 'r1',
      name: 'Deluxe',
      pricePerNight: 4500000,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuA0_mA9U8Qg_7br-lR7uO8V8t5oACmHhWqCM-qBthKWdTtfkCgPERGNJA5Mu2mFgzhoxfiXgHLbLhP2WnsUr52UFxTEY3e-W8g1M5Cf9iVkFVKQlKHvf_gWhQciOihyO3tLLXWmAi4D88MC7jl7fj6sr00KHpj1Tpu9Iip4I5BnqNXfBK9-rBpwL0MQ0E-MmSmPqLTBqoHA6jNTgQePqFrn_kKNozlWmPc0Tx4P-2wis71P1oniK-f8iC8HknvRTYdtH3SEnubGyw',
      features: ['Hồ bơi riêng', 'View biển', 'Quầy bar'],
      isAvailable: true,
    ),
    HotelRoomData(
      id: 'r2',
      name: 'Superior',
      pricePerNight: 3500000,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuA0_mA9U8Qg_7br-lR7uO8V8t5oACmHhWqCM-qBthKWdTtfkCgPERGNJA5Mu2mFgzhoxfiXgHLbLhP2WnsUr52UFxTEY3e-W8g1M5Cf9iVkFVKQlKHvf_gWhQciOihyO3tLLXWmAi4D88MC7jl7fj6sr00KHpj1Tpu9Iip4I5BnqNXfBK9-rBpwL0MQ0E-MmSmPqLTBqoHA6jNTgQePqFrn_kKNozlWmPc0Tx4P-2wis71P1oniK-f8iC8HknvRTYdtH3SEnubGyw',
      features: ['View thành phố', 'Wifi miễn phí'],
      isAvailable: true,
    ),
    HotelRoomData(
      id: 'r3',
      name: 'Standard',
      pricePerNight: 2500000,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuA0_mA9U8Qg_7br-lR7uO8V8t5oACmHhWqCM-qBthKWdTtfkCgPERGNJA5Mu2mFgzhoxfiXgHLbLhP2WnsUr52UFxTEY3e-W8g1M5Cf9iVkFVKQlKHvf_gWhQciOihyO3tLLXWmAi4D88MC7jl7fj6sr00KHpj1Tpu9Iip4I5BnqNXfBK9-rBpwL0MQ0E-MmSmPqLTBqoHA6jNTgQePqFrn_kKNozlWmPc0Tx4P-2wis71P1oniK-f8iC8HknvRTYdtH3SEnubGyw',
      features: ['Giường đôi', 'Điều hòa'],
      isAvailable: false,
    ),
  ];
}

class _RoomCard extends StatelessWidget {
  const _RoomCard({
    required this.room,
    required this.isSelected,
    required this.formatPrice,
    required this.onToggle,
  });

  final HotelRoomData room;
  final bool isSelected;
  final String Function(double) formatPrice;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF007AFF)
                : const Color(0xFFE5E7EB),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    room.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFFF0F7FF),
                      child: const Center(
                        child: Icon(
                          Icons.bed,
                          size: 48,
                          color: Color(0xFFBFDBFE),
                        ),
                      ),
                    ),
                  ),
                ),
                if (room.isAvailable)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2ECC71),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        room.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            formatPrice(room.pricePerNight),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF007AFF),
                            ),
                          ),
                          const Text(
                            '/ đêm',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF9CA3AF),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: room.features.map((f) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFE5E7EB)),
                        ),
                        child: Text(
                          f,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF4B5563),
                          ),
                        ),
                      );
                    }).toList(),
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
