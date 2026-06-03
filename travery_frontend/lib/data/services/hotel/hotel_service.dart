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
