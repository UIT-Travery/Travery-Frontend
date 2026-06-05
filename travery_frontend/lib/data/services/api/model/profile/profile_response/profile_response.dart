class ProfileData {
  const ProfileData({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.avatarUrl,
    required this.status,
    required this.role,
    required this.createdAt,
    this.passportNumber,
    this.dateOfBirth,
    this.gender,
    this.hotelName,
    this.hotelId,
  });

  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String avatarUrl;
  final String status;
  final String role;
  final String createdAt;
  final String? passportNumber;
  final String? dateOfBirth;
  final String? gender;
  final String? hotelName;
  final String? hotelId;

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['id'] as String? ?? '',
      fullName: json['fullName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      avatarUrl: json['avatarUrl'] as String? ?? '',
      status: json['status'] as String? ?? '',
      role: json['role'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      passportNumber: json['passportNumber'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: json['gender'] as String?,
      hotelName: json['hotelName'] as String?,
      hotelId: json['hotelId'] as String?,
    );
  }
}
