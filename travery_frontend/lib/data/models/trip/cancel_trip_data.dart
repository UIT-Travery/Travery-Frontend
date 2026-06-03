class CancelTripData {
  const CancelTripData({
    required this.bookingId,
    required this.bookingStatus,
    required this.refundAmount,
    required this.refundPercentage,
    required this.refundStatus,
    required this.refundMessage,
  });

  final String bookingId;
  final String bookingStatus;
  final double refundAmount;
  final double refundPercentage;
  final String refundStatus;
  final String refundMessage;

  factory CancelTripData.fromJson(Map<String, dynamic> json) {
    return CancelTripData(
      bookingId: json['bookingId'] as String? ?? '',
      bookingStatus: json['bookingStatus'] as String? ?? 'CANCELLED',
      refundAmount: (json['refundAmount'] as num?)?.toDouble() ?? 0.0,
      refundPercentage: (json['refundPercentage'] as num?)?.toDouble() ?? 0.0,
      refundStatus: json['refundStatus'] as String? ?? 'PENDING',
      refundMessage: json['refundMessage'] as String? ?? '',
    );
  }
}
