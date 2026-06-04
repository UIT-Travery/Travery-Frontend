class SeatLayoutItemResponse {
  SeatLayoutItemResponse({
    required this.id,
    required this.seatName,
    required this.tier,
    required this.position,
    this.rowNumber,
    this.columnNumber,
  });

  final String id;
  final String seatName;
  final String tier;
  final String position;
  final int? rowNumber;
  final int? columnNumber;

  factory SeatLayoutItemResponse.fromJson(Map<String, dynamic> json) {
    return SeatLayoutItemResponse(
      id: json['id'] as String? ?? '',
      seatName: json['seatName'] as String? ?? '',
      tier: json['tier'] as String? ?? '',
      position: json['position'] as String? ?? '',
      rowNumber: json['rowNumber'] as int?,
      columnNumber: json['columnNumber'] as int?,
    );
  }
}
