class HotelAddonData {
  HotelAddonData({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.unit,
  });

  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final String unit;

  factory HotelAddonData.fromJson(Map<String, dynamic> json) {
    return HotelAddonData(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      imageUrl: json['imageUrl'] as String? ?? '',
      category: json['category'] as String? ?? 'all',
      unit: json['unit'] as String? ?? '',
    );
  }
}
