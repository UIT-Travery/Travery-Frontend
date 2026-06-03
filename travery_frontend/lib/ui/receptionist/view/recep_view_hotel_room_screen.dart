import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/domain/models/receptionist/recep_room/recep_room.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_room_card.dart';

class RecepViewHotelRoomScreen extends StatefulWidget {
  const RecepViewHotelRoomScreen({super.key});

  @override
  State<RecepViewHotelRoomScreen> createState() => _RecepViewHotelRoomScreenState();
}

class _RecepViewHotelRoomScreenState extends State<RecepViewHotelRoomScreen> {
  final List<RecepRoom> dummyRooms = const [
    RecepRoom(roomNumber: '101', roomType: RecepRoomType.standard, roomStatus: RecepRoomStatus.occupied, bedType: RecepBedType.double),
    RecepRoom(roomNumber: '102', roomType: RecepRoomType.standard, roomStatus: RecepRoomStatus.occupied, bedType: RecepBedType.single),
    RecepRoom(roomNumber: '103', roomType: RecepRoomType.standard, roomStatus: RecepRoomStatus.ready, bedType: RecepBedType.double),
    RecepRoom(roomNumber: '104', roomType: RecepRoomType.standard, roomStatus: RecepRoomStatus.dirty, bedType: RecepBedType.single),
    RecepRoom(roomNumber: '201', roomType: RecepRoomType.standard, roomStatus: RecepRoomStatus.occupied, bedType: RecepBedType.double),
    RecepRoom(roomNumber: '202', roomType: RecepRoomType.standard, roomStatus: RecepRoomStatus.occupied, bedType: RecepBedType.single),
    RecepRoom(roomNumber: '203', roomType: RecepRoomType.standard, roomStatus: RecepRoomStatus.ready, bedType: RecepBedType.double),
    RecepRoom(roomNumber: '204', roomType: RecepRoomType.standard, roomStatus: RecepRoomStatus.occupied, bedType: RecepBedType.single),
  ];

  int _getFloor(String roomNumber) {
    if (roomNumber.length <= 2) return 0;
    String floorStr = roomNumber.substring(0, roomNumber.length - 2);
    return int.tryParse(floorStr) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    // Group rooms by floor
    final Map<int, List<RecepRoom>> groupedRooms = {};
    for (var room in dummyRooms) {
      int floor = _getFloor(room.roomNumber);
      if (!groupedRooms.containsKey(floor)) {
        groupedRooms[floor] = [];
      }
      groupedRooms[floor]!.add(room);
    }

    final sortedFloors = groupedRooms.keys.toList()..sort();

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Danh sách phòng',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Chọn một hành khách để tiến hành check-in', // Follow the image text
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
              child: ListView.builder(
                itemCount: sortedFloors.length,
                itemBuilder: (context, index) {
                  final floor = sortedFloors[index];
                  final rooms = groupedRooms[floor]!;
                  return _buildFloorSection(floor, rooms);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFloorSection(int floor, List<RecepRoom> rooms) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
        tilePadding: EdgeInsets.zero,
        title: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.primaryDarkBlackBlue,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Tầng $floor',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        iconColor: AppColors.textPrimary,
        collapsedIconColor: AppColors.textPrimary,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2.2, // To match image aspect ratio
              ),
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                return RecepRoomCard(room: rooms[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
