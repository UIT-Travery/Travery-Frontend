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
    this.cityProvince,
    this.reviews = const [],
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
  final String? cityProvince;
  final List<HotelReviewData> reviews;

  factory HotelDetailData.fromJson(Map<String, dynamic> json) {
    // Parse images - get all image URLs
    final imagesList = json['images'] as List<dynamic>? ?? [];
    final imageUrls = imagesList
        .map((img) => img['url'] as String? ?? '')
        .where((url) => url.isNotEmpty)
        .toList();

    // Parse amenities - full HotelAmenityData objects
    final amenitiesList = json['amenities'] as List<dynamic>? ?? [];
    final amenityNames = amenitiesList
        .map((a) => a['name'] as String? ?? '')
        .where((name) => name.isNotEmpty)
        .toList();

    // Parse room types
    final roomTypesList = json['roomTypes'] as List<dynamic>? ?? [];
    final rooms = roomTypesList
        .map((r) => HotelRoomData.fromJson(r as Map<String, dynamic>))
        .toList();

    // Parse check-in/out times from nested object {hour, minute, second, nano}
    String checkInTime = '14:00';
    String checkOutTime = '12:00';

    final checkInJson = json['checkInTime'] as Map<String, dynamic>?;
    if (checkInJson != null) {
      final hour = checkInJson['hour'] as int? ?? 14;
      final minute = checkInJson['minute'] as int? ?? 0;
      checkInTime =
          '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
    }

    final checkOutJson = json['checkOutTime'] as Map<String, dynamic>?;
    if (checkOutJson != null) {
      final hour = checkOutJson['hour'] as int? ?? 12;
      final minute = checkOutJson['minute'] as int? ?? 0;
      checkOutTime =
          '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
    }

    return HotelDetailData(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      imageUrls: imageUrls,
      address: json['address'] as String? ?? '',
      rating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String? ?? '',
      checkInTime: checkInTime,
      checkOutTime: checkOutTime,
      amenities: amenityNames,
      rooms: rooms,
      cityProvince: json['cityProvince'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'images': imageUrls.map((url) => {'url': url}).toList(),
      'address': address,
      'averageRating': rating,
      'description': description,
      'checkInTime': checkInTime,
      'checkOutTime': checkOutTime,
      'amenities': amenities,
      'roomTypes': rooms.map((r) => r.toJson()).toList(),
      'cityProvince': cityProvince,
    };
  }
}

class HotelAmenityData {
  HotelAmenityData({
    required this.id,
    required this.name,
    this.iconUrl,
    this.type,
  });

  final String id;
  final String name;
  final String? iconUrl;
  final String? type;

  factory HotelAmenityData.fromJson(Map<String, dynamic> json) {
    return HotelAmenityData(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      iconUrl: json['iconUrl'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'iconUrl': iconUrl, 'type': type};
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
    this.description,
    this.capacityAdults,
    this.capacityChildren,
    this.bedType,
    this.amenities,
    this.images,
  });

  final String id;
  final String name;
  final double pricePerNight;
  final String imageUrl;
  final List<String> features;
  final bool isAvailable;
  final String? description;
  final int? capacityAdults;
  final int? capacityChildren;
  final String? bedType;
  final List<HotelAmenityData>? amenities;
  final List<String>? images;

  factory HotelRoomData.fromJson(Map<String, dynamic> json) {
    // Parse images - get all URLs
    final imagesList = json['images'] as List<dynamic>? ?? [];
    final images = imagesList
        .map((img) => img['url'] as String? ?? '')
        .where((url) => url.isNotEmpty)
        .toList();
    final imageUrl = images.isNotEmpty ? images.first : '';

    // Parse amenities - full HotelAmenityData objects
    final amenitiesList = json['amenities'] as List<dynamic>? ?? [];
    final amenityNames = amenitiesList
        .map((a) => a['name'] as String? ?? '')
        .where((name) => name.isNotEmpty)
        .toList();
    final amenities = amenitiesList
        .map((a) => HotelAmenityData.fromJson(a as Map<String, dynamic>))
        .toList();

    // Parse bedType for features display
    final bedType = json['bedType'] as String?;

    // Build features list
    final features = <String>[];
    if (bedType != null) {
      features.add(_formatBedType(bedType));
    }
    features.addAll(amenityNames);

    return HotelRoomData(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      pricePerNight: (json['basePrice'] as num?)?.toDouble() ?? 0.0,
      imageUrl: imageUrl,
      features: features,
      isAvailable: true,
      description: json['description'] as String?,
      capacityAdults: json['capacityAdults'] as int?,
      capacityChildren: json['capacityChildren'] as int?,
      bedType: bedType,
      amenities: amenities,
      images: images,
    );
  }

  static String _formatBedType(String? bedType) {
    switch (bedType?.toUpperCase()) {
      case 'SINGLE':
        return 'Giường đơn';
      case 'DOUBLE':
        return 'Giường đôi';
      case 'TWIN':
        return 'Giường twin';
      case 'QUEEN':
        return 'Giường queen';
      case 'KING':
        return 'Giường king';
      case 'SUITE':
        return 'Giường suite';
      default:
        return bedType ?? 'Giường standard';
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'basePrice': pricePerNight,
      'images': images?.map((url) => {'url': url}).toList() ?? [],
      'features': features,
      'isAvailable': isAvailable,
      'description': description,
      'capacityAdults': capacityAdults,
      'capacityChildren': capacityChildren,
      'bedType': bedType,
      'amenities': amenities?.map((a) => a.toJson()).toList(),
    };
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
      authorName:
          json['authorName'] as String? ??
          json['userName'] as String? ??
          'Khách hàng',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      date: json['date'] as String? ?? json['createdAt'] as String? ?? '',
      comment: json['comment'] as String? ?? json['content'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'authorName': authorName,
      'rating': rating,
      'date': date,
      'comment': comment,
    };
  }
}
