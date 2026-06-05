class HotelListData {
  HotelListData({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.rating,
    required this.priceFrom,
    this.destinationName,
    this.durationDays,
    this.cityProvince,
  });

  final String id;
  final String name;
  final String imageUrl;
  final String address;
  final double rating;
  final double priceFrom;
  final String? destinationName;
  final int? durationDays;
  final String? cityProvince;

  factory HotelListData.fromJson(Map<String, dynamic> json) {
    return HotelListData(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      imageUrl: json['thumbnailUrl'] as String? ?? '',
      address: json['address'] as String? ?? '',
      rating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
      priceFrom: (json['minPrice'] as num?)?.toDouble() ?? 0.0,
      destinationName: json['destinationName'] as String?,
      durationDays: json['durationDays'] as int?,
      cityProvince: json['cityProvince'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'thumbnailUrl': imageUrl,
      'address': address,
      'averageRating': rating,
      'minPrice': priceFrom,
      'destinationName': destinationName,
      'durationDays': durationDays,
      'cityProvince': cityProvince,
    };
  }
}
