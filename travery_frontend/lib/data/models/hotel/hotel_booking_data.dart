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
    this.paymentMethod,
    this.paymentStatus,
    this.transactionId,
    this.gatewayTransactionId,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.guestCount,
    this.items,
    this.members,
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
  // API response fields
  final String? paymentMethod;
  final String? paymentStatus;
  final String? transactionId;
  final String? gatewayTransactionId;
  final String? startDate;
  final String? endDate;
  final DateTime? createdAt;
  final int? guestCount;
  final List<HotelBookingItemData>? items;
  final List<HotelMemberData>? members;

  factory HotelBookingData.fromJson(Map<String, dynamic> json) {
    // Handle both my-bookings list response and detail response
    final startDateStr = json['startDate'] as String?;
    final endDateStr = json['endDate'] as String?;
    final createdAtStr = json['createdAt'] as String?;

    // Parse members for detail view
    List<HotelMemberData>? members;
    final membersList = json['members'] as List<dynamic>?;
    if (membersList != null) {
      members = membersList
          .map((m) => HotelMemberData.fromJson(m as Map<String, dynamic>))
          .toList();
    }

    // Parse items for detail view
    List<HotelBookingItemData>? items;
    final itemsList = json['items'] as List<dynamic>?;
    if (itemsList != null) {
      items = itemsList
          .map((i) => HotelBookingItemData.fromJson(i as Map<String, dynamic>))
          .toList();
    }

    return HotelBookingData(
      id: json['id'] as String? ?? '',
      hotelName: json['hotelName'] as String? ?? '',
      hotelAddress:
          json['hotelAddress'] as String? ?? json['address'] as String? ?? '',
      hotelImageUrl: json['hotelImageUrl'] as String? ?? '',
      roomName: json['roomName'] as String? ?? '',
      roomCount: json['roomCount'] as int? ?? 1,
      checkInDate: json['checkInDate'] != null
          ? DateTime.parse(json['checkInDate'] as String)
          : (startDateStr != null
                ? DateTime.parse(startDateStr)
                : DateTime.now()),
      checkOutDate: json['checkOutDate'] != null
          ? DateTime.parse(json['checkOutDate'] as String)
          : (endDateStr != null ? DateTime.parse(endDateStr) : DateTime.now()),
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
      paymentMethod: json['paymentMethod'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
      transactionId: json['transactionId'] as String?,
      gatewayTransactionId: json['gatewayTransactionId'] as String?,
      startDate: startDateStr,
      endDate: endDateStr,
      createdAt: createdAtStr != null ? DateTime.parse(createdAtStr) : null,
      guestCount: json['guestCount'] as int?,
      items: items,
      members: members,
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

/// Member data for booking (used in API response)
class HotelMemberData {
  HotelMemberData({
    required this.fullName,
    required this.identityNumber,
    required this.dateOfBirth,
    required this.memberType,
  });

  final String fullName;
  final String identityNumber;
  final String dateOfBirth;
  final String memberType;

  factory HotelMemberData.fromJson(Map<String, dynamic> json) {
    return HotelMemberData(
      fullName: json['fullName'] as String? ?? '',
      identityNumber: json['identityNumber'] as String? ?? '',
      dateOfBirth: json['dateOfBirth'] as String? ?? '',
      memberType: json['memberType'] as String? ?? 'ADULT',
    );
  }
}

/// Booking item data for detail view (room items)
class HotelBookingItemData {
  HotelBookingItemData({
    required this.roomTypeId,
    required this.roomTypeName,
    required this.quantity,
    required this.priceAtNight,
    this.numberOfNights,
    this.subtotal,
  });

  final String roomTypeId;
  final String roomTypeName;
  final int quantity;
  final double priceAtNight;
  final int? numberOfNights;
  final double? subtotal;

  factory HotelBookingItemData.fromJson(Map<String, dynamic> json) {
    return HotelBookingItemData(
      roomTypeId: json['roomTypeId'] as String? ?? '',
      roomTypeName: json['roomTypeName'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 1,
      priceAtNight:
          (json['priceAtBooking'] as num?)?.toDouble() ??
          (json['pricePerNight'] as num?)?.toDouble() ??
          0.0,
      numberOfNights: json['numberOfNights'] as int?,
      subtotal: (json['subtotal'] as num?)?.toDouble(),
    );
  }
}

/// Cancel booking response data
class HotelCancelResponseData {
  HotelCancelResponseData({
    required this.bookingId,
    required this.bookingStatus,
    required this.refundAmount,
    required this.refundPercentage,
    required this.refundStatus,
    this.refundMessage,
  });

  final String bookingId;
  final String bookingStatus;
  final double refundAmount;
  final double refundPercentage;
  final String refundStatus;
  final String? refundMessage;

  factory HotelCancelResponseData.fromJson(Map<String, dynamic> json) {
    return HotelCancelResponseData(
      bookingId: json['bookingId'] as String? ?? '',
      bookingStatus: json['bookingStatus'] as String? ?? '',
      refundAmount: (json['refundAmount'] as num?)?.toDouble() ?? 0.0,
      refundPercentage: (json['refundPercentage'] as num?)?.toDouble() ?? 0.0,
      refundStatus: json['refundStatus'] as String? ?? '',
      refundMessage: json['refundMessage'] as String?,
    );
  }
}

/// Add-on bill data
class HotelAddOnBillData {
  HotelAddOnBillData({
    required this.hotelBookingId,
    required this.addOnOrders,
    required this.totalAddOnCharges,
  });

  final String hotelBookingId;
  final List<HotelAddOnOrderData> addOnOrders;
  final double totalAddOnCharges;

  factory HotelAddOnBillData.fromJson(Map<String, dynamic> json) {
    final ordersList = json['addOnOrders'] as List<dynamic>? ?? [];
    return HotelAddOnBillData(
      hotelBookingId: json['hotelBookingId'] as String? ?? '',
      addOnOrders: ordersList
          .map((o) => HotelAddOnOrderData.fromJson(o as Map<String, dynamic>))
          .toList(),
      totalAddOnCharges: (json['totalAddOnCharges'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

/// Add-on order item
class HotelAddOnOrderData {
  HotelAddOnOrderData({
    required this.addOnName,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
  });

  final String addOnName;
  final int quantity;
  final double unitPrice;
  final double totalPrice;

  factory HotelAddOnOrderData.fromJson(Map<String, dynamic> json) {
    return HotelAddOnOrderData(
      addOnName: json['addOnName'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 1,
      unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0.0,
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
