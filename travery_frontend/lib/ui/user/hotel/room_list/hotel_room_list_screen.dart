import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/data/models/hotel/hotel_detail_data.dart';
import 'package:travery_frontend/ui/user/hotel/widgets/hotel_app_bar.dart';

class HotelRoomListScreen extends StatefulWidget {
  const HotelRoomListScreen({super.key});

  @override
  State<HotelRoomListScreen> createState() => _HotelRoomListScreenState();
}

class _HotelRoomListScreenState extends State<HotelRoomListScreen> {
  final List<HotelRoomData> _selectedRooms = [];
  List<HotelRoomData> _rooms = _dummyRooms;

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }

  double get _totalPrice {
    return _selectedRooms.fold(0, (sum, room) => sum + room.pricePerNight);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
      final hotel = extra?['hotel'];
      if (hotel != null && hotel is HotelDetailData) {
        setState(() {
          _rooms = hotel.rooms;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: const HotelAppBar(title: 'Danh sách loại phòng'),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _rooms.length,
        separatorBuilder: (_, _) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final room = _rooms[index];
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
      bottomNavigationBar: _buildBottomBar(),
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
                    errorBuilder: (_, _, _) => Container(
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
                Positioned(
                  top: 10,
                  right: 10,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF10B981)
                          : Colors.white.withValues(alpha: 0.9),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF10B981)
                            : const Color(0xFFD1D5DB),
                        width: 2,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: const Color(
                                  0xFF10B981,
                                ).withValues(alpha: 0.3),
                                blurRadius: 8,
                                spreadRadius: 1,
                              ),
                            ]
                          : null,
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              size: 16,
                              color: Colors.white,
                            )
                          : const SizedBox.shrink(),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              room.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                            if (room.bedType != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                HotelRoomData.getBedTypeLabel(room.bedType!),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                            ],
                          ],
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
                  if (room.description != null &&
                      room.description!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      room.description!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF4B5563),
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  if (room.capacityAdults != null ||
                      room.capacityChildren != null) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.people_outline,
                          size: 14,
                          color: Color(0xFF6B7280),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${room.capacityAdults ?? 0} người lớn${room.capacityChildren != null ? ', ${room.capacityChildren} trẻ em' : ''}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ],
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
