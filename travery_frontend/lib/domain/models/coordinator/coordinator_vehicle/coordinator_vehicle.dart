List<String> vehicleTypes = ['Limousine', 'Giường nằm', 'Ghế ngồi'];
List<String> vehicleStatus = ['Sẵn sàng', 'Đang chạy', 'Bảo trì'];

class CoordinatorVehicle {
  final String id;
  final String licensePlate;
  final String vehicleType;
  final String vehicleStatus;
  final int capacity;
  final String imageUrl;

  const CoordinatorVehicle({
    required this.id,
    required this.licensePlate,
    required this.vehicleType,
    required this.vehicleStatus,
    required this.capacity,
    required this.imageUrl,
  });
}
