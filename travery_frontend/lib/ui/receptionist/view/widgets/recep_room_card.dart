import 'package:flutter/material.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_room_response.dart';

class RecepRoomCard extends StatelessWidget {
  final RecepRoomResponse room;
  final VoidCallback? onTap;

  const RecepRoomCard({super.key, required this.room, this.onTap});

  Color _getBorderColor(String status) {
    switch (status.toUpperCase()) {
      case 'AVAILABLE':
      case 'READY':
        return Colors.green;
      case 'DIRTY':
      case 'CLEANING':
        return Colors.orange;
      case 'OCCUPIED':
        return Colors.blue;
      case 'MAINTENANCE':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              left: BorderSide(color: _getBorderColor(room.status), width: 5),
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
                room.roomTypeName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
