enum RecepRoomStatus { ready, dirty, maintenance, occupied }

enum RecepRoomType { standard, vip, suite }

enum RecepBedType { single, double }

class RecepRoom {
  final String roomNumber;
  final RecepRoomType roomType;
  final RecepRoomStatus roomStatus;
  final RecepBedType bedType;

  const RecepRoom({
    required this.roomNumber,
    required this.roomType,
    required this.roomStatus,
    required this.bedType,
  });
}
