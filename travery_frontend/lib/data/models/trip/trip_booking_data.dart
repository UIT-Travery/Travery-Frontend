class TripBookingData {
  const TripBookingData({
    required this.id,
    required this.tripId,
    required this.departureTime,
    required this.originDestination,
    required this.destinationDestination,
    required this.basePrice,
    required this.totalPrice,
    required this.paymentDeadline,
    required this.contactName,
    required this.contactPhone,
    required this.status,
    required this.bookedSeatNames,
    required this.payment,
    this.coachLicensePlate,
    this.estimatedArrivalTime,
    this.paymentMethod,
    this.paymentStatus,
    this.transactionId,
    this.gatewayTransactionId,
  });

  final String id;
  final String tripId;
  final DateTime departureTime;
  final String originDestination;
  final String destinationDestination;
  final double basePrice;
  final double totalPrice;
  final DateTime? paymentDeadline;
  final String contactName;
  final String contactPhone;
  final String status;
  final List<String> bookedSeatNames;
  final TripPaymentData? payment;
  final String? coachLicensePlate;
  final DateTime? estimatedArrivalTime;
  final String? paymentMethod;
  final String? paymentStatus;
  final String? transactionId;
  final String? gatewayTransactionId;

  factory TripBookingData.fromJson(Map<String, dynamic> json) {
    return TripBookingData(
      id: json['id'] as String? ?? '',
      tripId: json['tripId'] as String? ?? '',
      departureTime:
          DateTime.tryParse(json['departureTime'] as String? ?? '') ??
          DateTime.now(),
      originDestination: json['originDestination'] as String? ?? '',
      destinationDestination: json['destinationDestination'] as String? ?? '',
      basePrice: (json['basePrice'] as num?)?.toDouble() ?? 0.0,
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0.0,
      paymentDeadline: json['paymentDeadline'] == null
          ? null
          : DateTime.tryParse(json['paymentDeadline'] as String),
      contactName: json['contactName'] as String? ?? '',
      contactPhone: json['contactPhone'] as String? ?? '',
      status: json['status'] as String? ?? 'PENDING',
      bookedSeatNames:
          (json['bookedSeatNames'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      payment: json['payment'] == null
          ? null
          : TripPaymentData.fromJson(json['payment'] as Map<String, dynamic>),
      coachLicensePlate: json['coachLicensePlate'] as String?,
      estimatedArrivalTime: json['estimatedArrivalTime'] == null
          ? null
          : DateTime.tryParse(json['estimatedArrivalTime'] as String),
      paymentMethod: json['paymentMethod'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
      transactionId: json['transactionId'] as String?,
      gatewayTransactionId: json['gatewayTransactionId'] as String?,
    );
  }
}

class TripPaymentData {
  const TripPaymentData({
    required this.transactionId,
    required this.amount,
    required this.paymentUrl,
    required this.expiresAt,
  });

  final String transactionId;
  final double amount;
  final String paymentUrl;
  final DateTime? expiresAt;

  factory TripPaymentData.fromJson(Map<String, dynamic> json) {
    return TripPaymentData(
      transactionId: json['transactionId'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      paymentUrl: json['paymentUrl'] as String? ?? '',
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.tryParse(json['expiresAt'] as String),
    );
  }
}
