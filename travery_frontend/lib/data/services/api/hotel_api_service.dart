import 'dart:convert';
import 'dart:io';

import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// API service for hotel-related endpoints.
///
/// Base URL: [AppConfig.baseUrl]
/// Endpoints:
///   - GET /api/v1/hotels — search hotels with filters
///   - GET /api/v1/hotels/{id} — get hotel detail
class HotelApiService {
  HotelApiService({String? host, HttpClient Function()? clientFactory})
    : _host = host ?? AppConfig.baseUrl,
      _clientFactory = clientFactory ?? HttpClient.new;

  final String _host;
  final HttpClient Function() _clientFactory;

  Future<String> _extractErrorMessage(
    HttpClientResponse response,
    String defaultMessage,
  ) async {
    try {
      final stringData = await response.transform(utf8.decoder).join();
      final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
      return jsonMap['message'] as String? ?? defaultMessage;
    } catch (_) {
      return defaultMessage;
    }
  }

  HttpClientRequest _addAuth(HttpClientRequest request, String accessToken) {
    request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $accessToken');
    return request;
  }

  // ── Hotel Search ───────────────────────────────────────────────────────────

  /// GET /api/v1/hotels
  ///
  /// Search hotels with optional filters.
  ///
  /// Parameters:
  /// - [accessToken] - Required authentication token
  /// - [keyword] - Search keyword
  /// - [cityProvince] - Filter by city/province name
  /// - [startDate] - Check-in date (yyyy-MM-dd)
  /// - [endDate] - Check-out date (yyyy-MM-dd)
  /// - [adults] - Number of adults
  /// - [children] - Number of children
  /// - [roomCount] - Number of rooms needed
  /// - [minRating] - Minimum star rating (1-5)
  /// - [minPrice] - Minimum price per night
  /// - [maxPrice] - Maximum price per night
  /// - [amenityIds] - Filter by amenity IDs
  /// - [availableHotelIds] - Filter to only include specific hotel IDs
  /// - [page] - Page number (0-indexed)
  /// - [size] - Page size
  /// - [sort] - Sort criteria (e.g., "price,asc")
  ///
  /// Returns paginated list of hotels.
  Future<Result<Map<String, dynamic>>> searchHotels({
    required String accessToken,
    String? keyword,
    String? cityProvince,
    String? startDate,
    String? endDate,
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
    List<String>? sort,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final queryParams = <String, String>{'page': '$page', 'size': '$size'};

      if (keyword != null && keyword.isNotEmpty) {
        queryParams['keyword'] = keyword;
      }
      if (cityProvince != null && cityProvince.isNotEmpty) {
        queryParams['cityProvince'] = cityProvince;
      }
      if (startDate != null && startDate.isNotEmpty) {
        queryParams['startDate'] = startDate;
      }
      if (endDate != null && endDate.isNotEmpty) {
        queryParams['endDate'] = endDate;
      }
      if (adults != null) {
        queryParams['adults'] = '$adults';
      }
      if (children != null) {
        queryParams['children'] = '$children';
      }
      if (roomCount != null) {
        queryParams['roomCount'] = '$roomCount';
      }
      if (minRating != null) {
        queryParams['minRating'] = '$minRating';
      }
      if (minPrice != null) {
        queryParams['minPrice'] = '$minPrice';
      }
      if (maxPrice != null) {
        queryParams['maxPrice'] = '$maxPrice';
      }
      if (amenityIds != null && amenityIds.isNotEmpty) {
        queryParams['amenityIds'] = amenityIds.join(',');
      }
      if (availableHotelIds != null && availableHotelIds.isNotEmpty) {
        queryParams['availableHotelIds'] = availableHotelIds.join(',');
      }
      if (sort != null && sort.isNotEmpty) {
        queryParams['sort'] = sort.join(',');
      }

      final uri = Uri.https(_host, '/api/v1/hotels', queryParams);
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok((jsonMap['data'] as Map<String, dynamic>?) ?? {});
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải danh sách khách sạn',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  // ── Hotel Detail ───────────────────────────────────────────────────────────

  /// GET /api/v1/hotels/{id}
  ///
  /// Get detailed information about a specific hotel.
  ///
  /// Parameters:
  /// - [accessToken] - Required authentication token
  /// - [hotelId] - The hotel UUID
  ///
  /// Returns hotel detail including amenities, room types, and images.
  Future<Result<Map<String, dynamic>>> getHotelById({
    required String accessToken,
    required String hotelId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/hotels/$hotelId');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok((jsonMap['data'] as Map<String, dynamic>?) ?? {});
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải thông tin khách sạn',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }
}
