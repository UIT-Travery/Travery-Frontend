import 'seat_layout_item_response.dart';

class SeatLayoutResponse {
  SeatLayoutResponse({
    required this.id,
    required this.name,
    required this.coachType,
    required this.totalSeats,
    required this.items,
  });

  final String id;
  final String name;
  final String coachType;
  final int totalSeats;
  final List<SeatLayoutItemResponse> items;

  factory SeatLayoutResponse.fromJson(Map<String, dynamic> json) {
    return SeatLayoutResponse(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      coachType: json['coachType'] as String? ?? '',
      totalSeats: json['totalSeats'] as int? ?? 0,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => SeatLayoutItemResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
