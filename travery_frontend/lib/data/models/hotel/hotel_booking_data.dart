class HotelBookingData {
  HotelBookingData({
    required this.id,
    required this.hotelName,
    required this.hotelAddress,
    required this.hotelImageUrl,
    required this.roomName,
    required this.roomCount,
    required this.checkInDate,
    required this.checkOutDate,
    required this.pricePerNight,
    required this.totalPrice,
    required this.status,
    required this.contactName,
    required this.contactPhone,
    required this.contactEmail,
    required this.guests,
    required this.services,
    required this.paymentDeadline,
  });

  final String id;
  final String hotelName;
  final String hotelAddress;
  final String hotelImageUrl;
  final String roomName;
  final int roomCount;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final double pricePerNight;
  final double totalPrice;
  final String status;
  final String contactName;
  final String contactPhone;
  final String contactEmail;
  final List<HotelGuestData> guests;
  final List<HotelServiceData> services;
  final DateTime? paymentDeadline;

  factory HotelBookingData.fromJson(Map<String, dynamic> json) {
    return HotelBookingData(
      id: json['id'] as String? ?? '',
      hotelName: json['hotelName'] as String? ?? '',
      hotelAddress: json['hotelAddress'] as String? ?? '',
      hotelImageUrl: json['hotelImageUrl'] as String? ?? '',
      roomName: json['roomName'] as String? ?? '',
      roomCount: json['roomCount'] as int? ?? 1,
      checkInDate: json['checkInDate'] != null
          ? DateTime.parse(json['checkInDate'] as String)
          : DateTime.now(),
      checkOutDate: json['checkOutDate'] != null
          ? DateTime.parse(json['checkOutDate'] as String)
          : DateTime.now(),
      pricePerNight: (json['pricePerNight'] as num?)?.toDouble() ?? 0.0,
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] as String? ?? 'PENDING',
      contactName: json['contactName'] as String? ?? '',
      contactPhone: json['contactPhone'] as String? ?? '',
      contactEmail: json['contactEmail'] as String? ?? '',
      guests:
          (json['guests'] as List<dynamic>?)
              ?.map((e) => HotelGuestData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      services:
          (json['services'] as List<dynamic>?)
              ?.map((e) => HotelServiceData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      paymentDeadline: json['paymentDeadline'] != null
          ? DateTime.parse(json['paymentDeadline'] as String)
          : null,
    );
  }
}

class HotelGuestData {
  HotelGuestData({
    required this.name,
    required this.idNumber,
    required this.dateOfBirth,
  });

  final String name;
  final String idNumber;
  final String dateOfBirth;

  factory HotelGuestData.fromJson(Map<String, dynamic> json) {
    return HotelGuestData(
      name: json['name'] as String? ?? '',
      idNumber: json['idNumber'] as String? ?? '',
      dateOfBirth: json['dateOfBirth'] as String? ?? '',
    );
  }
}

class HotelServiceData {
  HotelServiceData({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });

  final String id;
  final String name;
  final double price;
  final int quantity;

  double get total => price * quantity;

  factory HotelServiceData.fromJson(Map<String, dynamic> json) {
    return HotelServiceData(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      quantity: json['quantity'] as int? ?? 1,
    );
  }
}
