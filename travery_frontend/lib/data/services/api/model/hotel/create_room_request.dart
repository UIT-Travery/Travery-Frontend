/// CreateRoomRequest — body for POST /api/v1/admin/hotels/{hotelId}/rooms.
class CreateRoomRequest {
  final String roomNumber;
  final int floor;
  final String roomTypeId;

  const CreateRoomRequest({
    required this.roomNumber,
    required this.floor,
    required this.roomTypeId,
  });

  Map<String, dynamic> toJson() => {
        'roomNumber': roomNumber,
        'floor': floor,
        'roomTypeId': roomTypeId,
      };
}
