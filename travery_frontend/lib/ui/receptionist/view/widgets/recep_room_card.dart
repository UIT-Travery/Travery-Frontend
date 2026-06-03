import 'package:flutter/material.dart';
import '../../../../domain/models/receptionist/recep_room/recep_room.dart';

class RecepRoomCard extends StatelessWidget {
  final RecepRoom room;

  const RecepRoomCard({
    super.key,
    required this.room,
  });

  Color _getBorderColor(RecepRoomStatus status) {
    switch (status) {
      case RecepRoomStatus.ready:
        return Colors.green;
      case RecepRoomStatus.dirty:
        return Colors.orange;
      case RecepRoomStatus.occupied:
        return Colors.blue;
      case RecepRoomStatus.maintenance:
        return Colors.red;
    }
  }

  String _getRoomTypeName(RecepRoomType type) {
    switch (type) {
      case RecepRoomType.standard:
        return 'Standard';
      case RecepRoomType.vip:
        return 'VIP';
      case RecepRoomType.suite:
        return 'Suite';
    }
  }

  String _getBedDescription(RecepBedType type) {
    switch (type) {
      case RecepBedType.single:
        return '1 Giường đơn';
      case RecepBedType.double:
        return '1 Giường đôi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: _getBorderColor(room.roomStatus),
              width: 5,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              room.roomNumber,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Text(
              _getRoomTypeName(room.roomType),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              _getBedDescription(room.bedType),
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
