class UserBookingListResponse {
  final UserBookingPageData data;

  const UserBookingListResponse({required this.data});

  factory UserBookingListResponse.fromJson(Map<String, dynamic> json) =>
      UserBookingListResponse(
        data: UserBookingPageData.fromJson(
          json['data'] as Map<String, dynamic>? ?? {},
        ),
      );
}

class UserBookingPageData {
  final int totalElements;
  final int totalPages;
  final int size;
  final List<UserBookingItem> content;
  final int number;
  final bool first;
  final bool last;
  final bool empty;

  const UserBookingPageData({
    this.totalElements = 0,
    this.totalPages = 0,
    this.size = 0,
    this.content = const [],
    this.number = 0,
    this.first = true,
    this.last = true,
    this.empty = true,
  });

  factory UserBookingPageData.fromJson(Map<String, dynamic> json) =>
      UserBookingPageData(
        totalElements: json['totalElements'] as int? ?? 0,
        totalPages: json['totalPages'] as int? ?? 0,
        size: json['size'] as int? ?? 0,
        content:
            (json['content'] as List<dynamic>?)
                ?.map(
                  (e) => UserBookingItem.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            [],
        number: json['number'] as int? ?? 0,
        first: json['first'] as bool? ?? true,
        last: json['last'] as bool? ?? true,
        empty: json['empty'] as bool? ?? true,
      );
}

class UserBookingItem {
  final String id;
  final String status;
  final double totalPrice;
  final String? paymentDeadline;
  final String tourName;
  final String startDate;
  final String endDate;
  final String createdAt;
  final String? thumbnailUrl;
  final String? destinationName;
  final int? durationDays;
  final double? pricePerAdultAtBooking;
  final double? pricePerChildAtBooking;
  final String? specialRequests;
  final String? paymentMethod;
  final String? paymentStatus;
  final String? transactionId;
  final List<UserBookingMember>? members;
  final int? memberCount;

  const UserBookingItem({
    this.id = '',
    this.status = '',
    this.totalPrice = 0,
    this.paymentDeadline,
    this.tourName = '',
    this.startDate = '',
    this.endDate = '',
    this.createdAt = '',
    this.thumbnailUrl,
    this.destinationName,
    this.durationDays,
    this.pricePerAdultAtBooking,
    this.pricePerChildAtBooking,
    this.specialRequests,
    this.paymentMethod,
    this.paymentStatus,
    this.transactionId,
    this.members,
    this.memberCount,
  });

  factory UserBookingItem.fromJson(Map<String, dynamic> json) =>
      UserBookingItem(
        id: json['id'] as String? ?? '',
        status: json['status'] as String? ?? '',
        totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0,
        paymentDeadline: json['paymentDeadline'] as String?,
        tourName: json['tourName'] as String? ?? '',
        startDate: json['startDate'] as String? ?? '',
        endDate: json['endDate'] as String? ?? '',
        createdAt: json['createdAt'] as String? ?? '',
        thumbnailUrl: json['thumbnailUrl'] as String?,
        destinationName: json['destinationName'] as String?,
        durationDays: json['durationDays'] as int?,
        pricePerAdultAtBooking: (json['pricePerAdultAtBooking'] as num?)
            ?.toDouble(),
        pricePerChildAtBooking: (json['pricePerChildAtBooking'] as num?)
            ?.toDouble(),
        specialRequests: json['specialRequests'] as String?,
        paymentMethod: json['paymentMethod'] as String?,
        paymentStatus: json['paymentStatus'] as String?,
        transactionId: json['transactionId'] as String?,
        members: (json['members'] as List<dynamic>?)
            ?.map((e) => UserBookingMember.fromJson(e as Map<String, dynamic>))
            .toList(),
        memberCount: json['memberCount'] as int?,
      );

  int get computedMemberCount => memberCount ?? members?.length ?? 0;

  bool get isTooSoon {
    if (startDate.isEmpty) return false;
    final start = DateTime.tryParse(startDate);
    if (start == null) return false;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final startDay = DateTime(start.year, start.month, start.day);
    return startDay.difference(today).inDays <= 5;
  }
}

class UserBookingMember {
  final String id;
  final String fullName;
  final String? identityNumber;
  final String? dateOfBirth;
  final String? attendanceStatus;
  final String memberType;

  const UserBookingMember({
    this.id = '',
    this.fullName = '',
    this.identityNumber,
    this.dateOfBirth,
    this.attendanceStatus,
    this.memberType = 'ADULT',
  });

  factory UserBookingMember.fromJson(Map<String, dynamic> json) =>
      UserBookingMember(
        id: json['id'] as String? ?? '',
        fullName: json['fullName'] as String? ?? '',
        identityNumber: json['identityNumber'] as String?,
        dateOfBirth: json['dateOfBirth'] as String?,
        attendanceStatus: json['attendanceStatus'] as String?,
        memberType: json['memberType'] as String? ?? 'ADULT',
      );
}
