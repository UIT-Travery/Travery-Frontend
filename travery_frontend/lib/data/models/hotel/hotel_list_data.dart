class HotelListData {
  HotelListData({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.rating,
    required this.priceFrom,
  });

  final String id;
  final String name;
  final String imageUrl;
  final String address;
  final double rating;
  final double priceFrom;

  factory HotelListData.fromJson(Map<String, dynamic> json) {
    return HotelListData(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      address: json['address'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      priceFrom: (json['priceFrom'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
