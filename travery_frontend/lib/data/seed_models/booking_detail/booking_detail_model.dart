class BookingDetailModel {
  final String id;
  final String status;
  final double totalPrice;
  final double? pricePerAdultAtBooking;
  final double? pricePerChildAtBooking;
  final String? paymentDeadline;
  final String? specialRequests;
  final String? createdAt;
  final String tourName;
  final String? startDate;
  final String? endDate;
  final List<BookingMember> members;
  final String? paymentMethod;
  final String? paymentStatus;
  final String? transactionId;
  final String? paymentUrl;
  final double? paymentAmount;
  final String? paymentExpiresAt;

  const BookingDetailModel({
    required this.id,
    required this.status,
    required this.totalPrice,
    this.pricePerAdultAtBooking,
    this.pricePerChildAtBooking,
    this.paymentDeadline,
    this.specialRequests,
    this.createdAt,
    required this.tourName,
    this.startDate,
    this.endDate,
    this.members = const [],
    this.paymentMethod,
    this.paymentStatus,
    this.transactionId,
    this.paymentUrl,
    this.paymentAmount,
    this.paymentExpiresAt,
  });

  int get guestCount => members.length;

  DateTime? get departureDate {
    if (startDate == null) return null;
    try {
      return DateTime.parse(startDate!);
    } catch (_) {
      return null;
    }
  }

  bool get canCancel => status == 'PENDING' || status == 'PAID';

  bool get canRetryPayment =>
      status == 'PENDING' && paymentUrl != null && paymentUrl!.isNotEmpty;
}

class BookingMember {
  final String id;
  final String fullName;
  final String? identityNumber;
  final String? dateOfBirth;
  final String? attendanceStatus;
  final String memberType;

  const BookingMember({
    this.id = '',
    this.fullName = '',
    this.identityNumber,
    this.dateOfBirth,
    this.attendanceStatus,
    this.memberType = 'ADULT',
  });

  factory BookingMember.fromJson(Map<String, dynamic> json) => BookingMember(
    id: json['id'] as String? ?? '',
    fullName: json['fullName'] as String? ?? '',
    identityNumber: json['identityNumber'] as String?,
    dateOfBirth: json['dateOfBirth'] as String?,
    attendanceStatus: json['attendanceStatus'] as String?,
    memberType: json['memberType'] as String? ?? 'ADULT',
  );
}
