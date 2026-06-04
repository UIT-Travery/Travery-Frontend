/// Room status enum matching backend AVAILABLE | OCCUPIED | CLEANING | MAINTENANCE.
enum RoomStatus { available, occupied, cleaning, maintenance }

extension RoomStatusX on RoomStatus {
  String get apiValue {
    switch (this) {
      case RoomStatus.available:
        return 'AVAILABLE';
      case RoomStatus.occupied:
        return 'OCCUPIED';
      case RoomStatus.cleaning:
        return 'CLEANING';
      case RoomStatus.maintenance:
        return 'MAINTENANCE';
    }
  }

  String get displayName {
    switch (this) {
      case RoomStatus.available:
        return 'Còn trống';
      case RoomStatus.occupied:
        return 'Đang sử dụng';
      case RoomStatus.cleaning:
        return 'Đang dọn dẹp';
      case RoomStatus.maintenance:
        return 'Bảo trì';
    }
  }

  static RoomStatus fromApi(String? value) {
    switch (value) {
      case 'AVAILABLE':
        return RoomStatus.available;
      case 'OCCUPIED':
        return RoomStatus.occupied;
      case 'CLEANING':
        return RoomStatus.cleaning;
      case 'MAINTENANCE':
        return RoomStatus.maintenance;
      default:
        return RoomStatus.available;
    }
  }
}

/// ReceptionistRoomResponse — returned by getRooms and createRoom.
class ReceptionistRoomResponse {
  final String id;
  final String roomNumber;
  final String? roomTypeName;
  final RoomStatus status;
  final int floor;

  const ReceptionistRoomResponse({
    required this.id,
    required this.roomNumber,
    this.roomTypeName,
    required this.status,
    required this.floor,
  });

  factory ReceptionistRoomResponse.fromJson(Map<String, dynamic> json) {
    return ReceptionistRoomResponse(
      id: json['id'] as String? ?? '',
      roomNumber: json['roomNumber'] as String? ?? '',
      roomTypeName: json['roomTypeName'] as String?,
      status: RoomStatusX.fromApi(json['status'] as String?),
      floor: json['floor'] as int? ?? 1,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'roomNumber': roomNumber,
        'roomTypeName': roomTypeName,
        'status': status.apiValue,
        'floor': floor,
      };
}
