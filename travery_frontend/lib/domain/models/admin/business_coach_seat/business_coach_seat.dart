enum CoachSeatTier { lower, upper }

enum CoachSeatPosition { front, middle, back }

class BusinessCoachSeat {
  final String? id;
  final String? coachId;
  final String price;
  final CoachSeatTier tier;
  final CoachSeatPosition position;
  final String seatName;
  final int rowNumber;
  final int columnNumber;

  BusinessCoachSeat({
    this.id,
    this.coachId,
    required this.price,
    required this.tier,
    required this.position,
    required this.seatName,
    required this.rowNumber,
    required this.columnNumber,
  });
}
