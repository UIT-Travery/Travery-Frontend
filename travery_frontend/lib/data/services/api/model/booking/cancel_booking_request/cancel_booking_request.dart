class CancelBookingRequest {
  final String reason;

  const CancelBookingRequest({this.reason = ''});

  Map<String, dynamic> toJson() => {'reason': reason};
}
