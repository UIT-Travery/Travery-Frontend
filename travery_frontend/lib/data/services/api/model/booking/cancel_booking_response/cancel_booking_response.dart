class CancelData {
  final String bookingId;
  final String bookingStatus;
  final double refundAmount;
  final double refundPercentage;
  final String refundStatus;
  final String refundMessage;

  const CancelData({
    this.bookingId = '',
    this.bookingStatus = '',
    this.refundAmount = 0,
    this.refundPercentage = 0,
    this.refundStatus = '',
    this.refundMessage = '',
  });

  factory CancelData.fromJson(Map<String, dynamic> json) => CancelData(
    bookingId: json['bookingId'] as String? ?? '',
    bookingStatus: json['bookingStatus'] as String? ?? '',
    refundAmount: (json['refundAmount'] as num?)?.toDouble() ?? 0,
    refundPercentage: (json['refundPercentage'] as num?)?.toDouble() ?? 0,
    refundStatus: json['refundStatus'] as String? ?? '',
    refundMessage: json['refundMessage'] as String? ?? '',
  );
}
