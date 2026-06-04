import 'package:travery_frontend/data/models/hotel/hotel_booking_data.dart';
import 'package:travery_frontend/data/models/hotel/hotel_detail_data.dart';
import 'package:travery_frontend/data/models/hotel/hotel_list_data.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// Abstract service interface for hotel operations.
abstract class HotelService {
  /// Search hotels with optional filters.
  Future<Result<HotelSearchResult>> searchHotels({
    String? keyword,
    String? cityProvince,
    DateTime? startDate,
    DateTime? endDate,
    int? adults,
    int? children,
    int? roomCount,
    int? minRating,
    double? minPrice,
    double? maxPrice,
    List<String>? amenityIds,
    List<String>? availableHotelIds,
    int page = 0,
    int size = 20,
    String? sortBy,
    String? sortDir,
  });

  /// Get hotel detail by ID.
  Future<Result<HotelDetailData>> getHotelById(String hotelId);

  /// Get my bookings (user's booking history)
  /// GET /api/v1/hotel-bookings/me
  Future<Result<HotelBookingListResult>> getMyBookings({
    String? status,
    int page = 0,
    int size = 20,
  });

  /// Get booking detail by ID
  /// GET /api/v1/hotel-bookings/{bookingId}
  Future<Result<HotelBookingData>> getBookingDetail(String bookingId);

  /// Cancel a booking
  /// POST /api/v1/hotel-bookings/{bookingId}/cancel
  Future<Result<HotelCancelResponseData>> cancelBooking({
    required String bookingId,
    required String reason,
    required String bankName,
    required String accountNumber,
    required String accountHolderName,
  });

  /// Get add-on bill for a booking
  /// GET /api/v1/hotel-bookings/{bookingId}/add-on-bill
  Future<Result<HotelAddOnBillData>> getAddOnBill(String bookingId);

  /// Get available add-on services for a booking
  /// GET /api/v1/hotel-bookings/{bookingId}/available-services
  Future<Result<List<HotelAddOnServiceData>>> getAvailableServices(
    String bookingId,
  );

  /// Create add-on order
  /// POST /api/v1/hotel-bookings/{bookingId}/add-on-orders
  Future<Result<HotelAddOnOrderData>> createAddOnOrder({
    required String bookingId,
    required String serviceId,
    required int quantity,
    required DateTime scheduledTime,
  });

  /// Cancel add-on order
  /// DELETE /api/v1/hotel-bookings/add-on-orders/{orderId}
  Future<Result<bool>> cancelAddOnOrder(String orderId);

  /// Create a new hotel booking
  /// POST /api/v1/hotel-bookings
  Future<Result<HotelCreateBookingResponse>> createBooking({
    required List<Map<String, dynamic>> rooms,
    required String startDate,
    required String endDate,
    required List<Map<String, dynamic>> members,
    required String contactName,
    required String contactPhone,
    String? specialRequests,
    required String ipAddress,
  });
}

/// Result wrapper for hotel search including pagination info.
class HotelSearchResult {
  HotelSearchResult({
    required this.hotels,
    required this.totalElements,
    required this.totalPages,
    required this.currentPage,
    required this.pageSize,
  });

  final List<HotelListData> hotels;
  final int totalElements;
  final int totalPages;
  final int currentPage;
  final int pageSize;

  bool get hasMore => currentPage < totalPages - 1;
}

/// Result wrapper for my bookings list including pagination info.
class HotelBookingListResult {
  HotelBookingListResult({
    required this.bookings,
    required this.totalElements,
    required this.totalPages,
    required this.currentPage,
    required this.pageSize,
  });

  final List<HotelBookingData> bookings;
  final int totalElements;
  final int totalPages;
  final int currentPage;
  final int pageSize;

  bool get hasMore => currentPage < totalPages - 1;
}

/// Response from create booking API
class HotelCreateBookingResponse {
  HotelCreateBookingResponse({
    required this.bookingId,
    required this.status,
    required this.totalPrice,
    this.paymentDeadline,
    this.transactionId,
    this.paymentUrl,
  });

  final String bookingId;
  final String status;
  final double totalPrice;
  final DateTime? paymentDeadline;
  final String? transactionId;
  final String? paymentUrl;

  factory HotelCreateBookingResponse.fromJson(Map<String, dynamic> json) {
    final payment = json['payment'] as Map<String, dynamic>?;
    return HotelCreateBookingResponse(
      bookingId: json['id'] as String? ?? '',
      status: json['status'] as String? ?? 'PENDING',
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0.0,
      paymentDeadline: json['paymentDeadline'] != null
          ? DateTime.parse(json['paymentDeadline'] as String)
          : null,
      transactionId: payment?['transactionId'] as String?,
      paymentUrl: payment?['paymentUrl'] as String?,
    );
  }
}
