class SeatLayoutItemRequest {
  SeatLayoutItemRequest({
    required this.seatName,
    required this.tier,
    required this.position,
    this.rowNumber,
    this.columnNumber,
  });

  final String seatName;
  final String tier; // "UPPER", "LOWER"
  final String position; // "FRONT", "MIDDLE", "BACK"
  final int? rowNumber;
  final int? columnNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'seatName': seatName,
      'tier': tier,
      'position': position,
    };
    if (rowNumber != null) map['rowNumber'] = rowNumber;
    if (columnNumber != null) map['columnNumber'] = columnNumber;
    return map;
  }
}
