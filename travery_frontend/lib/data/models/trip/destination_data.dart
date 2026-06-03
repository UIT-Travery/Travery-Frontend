class DestinationData {
  const DestinationData({
    required this.id,
    required this.name,
    required this.code,
    required this.stations,
  });

  final String id;
  final String name;
  final String code;
  final List<StationData> stations;

  factory DestinationData.fromJson(Map<String, dynamic> json) {
    return DestinationData(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      code: json['code'] as String? ?? '',
      stations:
          (json['stations'] as List<dynamic>?)
              ?.map((e) => StationData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class StationData {
  const StationData({
    required this.id,
    required this.name,
    required this.address,
    required this.destinationId,
    required this.destinationName,
  });

  final String id;
  final String name;
  final String address;
  final String destinationId;
  final String destinationName;

  factory StationData.fromJson(Map<String, dynamic> json) {
    return StationData(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      address: json['address'] as String? ?? '',
      destinationId: json['destinationId'] as String? ?? '',
      destinationName: json['destinationName'] as String? ?? '',
    );
  }
}
