import 'seat_layout_item_request.dart';

class CreateSeatLayoutRequest {
  CreateSeatLayoutRequest({
    required this.name,
    required this.coachType,
    required this.items,
  });

  final String name;
  final String coachType; // "SEAT", "BED", "LIMOUSINE"
  final List<SeatLayoutItemRequest> items;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'coachType': coachType,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}
