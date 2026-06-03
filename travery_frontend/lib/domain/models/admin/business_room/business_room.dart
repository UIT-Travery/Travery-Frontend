import 'package:travery_frontend/domain/models/admin/business_room_type/business_room_type.dart';

class BusinessRoom {
  final String id;
  final String name;
  final BusinessRoomType type;
  final String status;
  final String hotelId;

  BusinessRoom({
    required this.id,
    required this.name,
    required this.type,
    required this.status,
    required this.hotelId,
  });
}
