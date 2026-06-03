import 'dart:convert';
import 'dart:io';

import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/data/models/hotel/hotel_detail_data.dart';
import 'package:travery_frontend/data/models/hotel/hotel_list_data.dart';
import 'package:travery_frontend/data/services/hotel/hotel_service.dart';
import 'package:travery_frontend/data/services/token_refresh_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class HotelServiceImpl implements HotelService {
  HotelServiceImpl({required TokenRefreshService tokenRefreshService})
    : _tokenRefreshService = tokenRefreshService;

  final TokenRefreshService _tokenRefreshService;

  Future<void> _setBearerAuth(HttpClientRequest request) async {
    final result = await _tokenRefreshService.getValidAccessToken();
    if (result is Ok) {
      final token = (result as Ok<String>).value;
      request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $token');
    }
  }

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

  @override
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
  }) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final queryParams = <String, String>{
        'page': page.toString(),
        'size': size.toString(),
      };

      if (keyword != null && keyword.isNotEmpty) {
        queryParams['keyword'] = keyword;
      }
      if (cityProvince != null && cityProvince.isNotEmpty) {
        queryParams['cityProvince'] = cityProvince;
      }
      if (startDate != null) {
        queryParams['startDate'] = startDate.toIso8601String().split('T').first;
      }
      if (endDate != null) {
        queryParams['endDate'] = endDate.toIso8601String().split('T').first;
      }
      if (adults != null) {
        queryParams['adults'] = adults.toString();
      }
      if (children != null) {
        queryParams['children'] = children.toString();
      }
      if (roomCount != null) {
        queryParams['roomCount'] = roomCount.toString();
      }
      if (minRating != null) {
        queryParams['minRating'] = minRating.toString();
      }
      if (minPrice != null) {
        queryParams['minPrice'] = minPrice.toString();
      }
      if (maxPrice != null) {
        queryParams['maxPrice'] = maxPrice.toString();
      }
      if (amenityIds != null && amenityIds.isNotEmpty) {
        queryParams['amenityIds'] = amenityIds.join(',');
      }
      if (availableHotelIds != null && availableHotelIds.isNotEmpty) {
        queryParams['availableHotelIds'] = availableHotelIds.join(',');
      }
      if (sortBy != null && sortBy.isNotEmpty && sortDir != null) {
        queryParams['sort'] = '$sortBy,$sortDir';
      }

      final request = await client.getUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/hotels', queryParams),
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(request);

      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>? ?? {};

        final content = data['content'] as List<dynamic>? ?? [];
        final hotels = content
            .map((e) => HotelListData.fromJson(e as Map<String, dynamic>))
            .toList();

        return Result.ok(
          HotelSearchResult(
            hotels: hotels,
            totalElements: data['totalElements'] as int? ?? 0,
            totalPages: data['totalPages'] as int? ?? 0,
            currentPage: data['number'] as int? ?? 0,
            pageSize: data['size'] as int? ?? size,
          ),
        );
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

  @override
  Future<Result<HotelDetailData>> getHotelById(String hotelId) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.getUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/hotels/$hotelId'),
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(request);

      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>? ?? {};

        return Result.ok(HotelDetailData.fromJson(data));
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
