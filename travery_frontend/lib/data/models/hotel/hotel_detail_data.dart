class HotelDetailData {
  HotelDetailData({
    required this.id,
    required this.name,
    required this.imageUrls,
    required this.address,
    required this.rating,
    required this.description,
    required this.checkInTime,
    required this.checkOutTime,
    required this.amenities,
    required this.rooms,
    required this.reviews,
  });

  final String id;
  final String name;
  final List<String> imageUrls;
  final String address;
  final double rating;
  final String description;
  final String checkInTime;
  final String checkOutTime;
  final List<String> amenities;
  final List<HotelRoomData> rooms;
  final List<HotelReviewData> reviews;

  factory HotelDetailData.fromJson(Map<String, dynamic> json) {
    return HotelDetailData(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      imageUrls: (json['imageUrls'] as List<dynamic>?)?.cast<String>() ?? [],
      address: json['address'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String? ?? '',
      checkInTime: json['checkInTime'] as String? ?? '14:00',
      checkOutTime: json['checkOutTime'] as String? ?? '12:00',
      amenities: (json['amenities'] as List<dynamic>?)?.cast<String>() ?? [],
      rooms:
          (json['rooms'] as List<dynamic>?)
              ?.map((e) => HotelRoomData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      reviews:
          (json['reviews'] as List<dynamic>?)
              ?.map((e) => HotelReviewData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class HotelRoomData {
  HotelRoomData({
    required this.id,
    required this.name,
    required this.pricePerNight,
    required this.imageUrl,
    required this.features,
    required this.isAvailable,
  });

  final String id;
  final String name;
  final double pricePerNight;
  final String imageUrl;
  final List<String> features;
  final bool isAvailable;

  factory HotelRoomData.fromJson(Map<String, dynamic> json) {
    return HotelRoomData(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      pricePerNight: (json['pricePerNight'] as num?)?.toDouble() ?? 0.0,
      imageUrl: json['imageUrl'] as String? ?? '',
      features: (json['features'] as List<dynamic>?)?.cast<String>() ?? [],
      isAvailable: json['isAvailable'] as bool? ?? true,
    );
  }
}

class HotelReviewData {
  HotelReviewData({
    required this.authorName,
    required this.rating,
    required this.date,
    required this.comment,
  });

  final String authorName;
  final double rating;
  final String date;
  final String comment;

  factory HotelReviewData.fromJson(Map<String, dynamic> json) {
    return HotelReviewData(
      authorName: json['authorName'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      date: json['date'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
    );
  }
}
