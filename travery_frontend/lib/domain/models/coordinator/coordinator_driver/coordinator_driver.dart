enum DriverStatus { available, unavailable }

class CoordinatorDriver {
  final String id;
  final String name;
  final String email;
  final String imageUrl;
  final String? phoneNumber;
  final DriverStatus status;

  const CoordinatorDriver({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    this.phoneNumber,
    required this.status,
  });
}
