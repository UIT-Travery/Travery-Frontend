import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/data/models/hotel/hotel_booking_data.dart';
import 'package:travery_frontend/data/models/hotel/hotel_detail_data.dart';
import 'package:travery_frontend/data/models/hotel/hotel_list_data.dart';
import 'package:travery_frontend/data/models/review/review_data.dart';
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
  Future<Result<List<HotelAmenityData>>> getAmenities() async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.getUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/amenities'),
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
        final data = jsonMap['data'] as List<dynamic>? ?? [];
        final amenities = data
            .map((e) => HotelAmenityData.fromJson(e as Map<String, dynamic>))
            .toList();

        return Result.ok(amenities);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải danh sách tiện ích',
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

        final pageData = data['page'] as Map<String, dynamic>? ?? data;

        return Result.ok(
          HotelSearchResult(
            hotels: hotels,
            totalElements: pageData['totalElements'] as int? ?? 0,
            totalPages: pageData['totalPages'] as int? ?? 0,
            currentPage: pageData['number'] as int? ?? page,
            pageSize: pageData['size'] as int? ?? size,
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

  @override
  Future<Result<ReviewPageData>> getHotelReviews(
    String hotelId, {
    int page = 0,
    int size = 10,
  }) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.getUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/hotels/$hotelId/reviews', {
          'page': page.toString(),
          'size': size.toString(),
        }),
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

        return Result.ok(ReviewPageData.fromJson(data));
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải đánh giá khách sạn',
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
  Future<Result<bool>> createReview({
    required String bookingId,
    required int rating,
    required String comment,
  }) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.postUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/hotel-bookings/$bookingId/reviews',
        ),
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        'application/json; charset=utf-8',
      );
      await _setBearerAuth(request);
      request.write(jsonEncode({'rating': rating, 'comment': comment}));

      final response = await request.close();

      if (response.statusCode == 200 || response.statusCode == 201) {
        await response.drain<void>();
        return const Result.ok(true);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể gửi đánh giá khách sạn',
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
  Future<Result<HotelBookingListResult>> getMyBookings({
    String? status,
    int page = 0,
    int size = 20,
  }) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final queryParams = <String, String>{
        'page': page.toString(),
        'size': size.toString(),
      };

      if (status != null && status.isNotEmpty && status != 'Tất cả') {
        queryParams['status'] = status;
      }

      final request = await client.getUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/hotel-bookings/me', queryParams),
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
        final bookings = content
            .map((e) => HotelBookingData.fromJson(e as Map<String, dynamic>))
            .toList();

        return Result.ok(
          HotelBookingListResult(
            bookings: bookings,
            totalElements: data['totalElements'] as int? ?? 0,
            totalPages: data['totalPages'] as int? ?? 0,
            currentPage: data['number'] as int? ?? 0,
            pageSize: data['size'] as int? ?? size,
          ),
        );
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải danh sách đặt phòng',
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
  Future<Result<HotelBookingData>> getBookingDetail(String bookingId) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.getUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/hotel-bookings/$bookingId'),
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

        return Result.ok(HotelBookingData.fromJson(data));
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải chi tiết đặt phòng',
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
  Future<Result<HotelCancelResponseData>> cancelBooking({
    required String bookingId,
    required String reason,
    required String bankName,
    required String accountNumber,
    required String accountHolderName,
  }) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.postUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/hotel-bookings/$bookingId/cancel',
        ),
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(request);

      final body = jsonEncode({
        'reason': reason,
        'bankName': bankName,
        'accountNumber': accountNumber,
        'accountHolderName': accountHolderName,
      });
      request.write(body);

      final response = await request.close();
      debugPrint('CancelBooking Response Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        debugPrint('CancelBooking Response Body: $stringData');
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final httpStatus = jsonMap['httpStatus'];
        final message = jsonMap['message'];
        debugPrint('CancelBooking httpStatus: $httpStatus, message: $message');
        final data = jsonMap['data'] as Map<String, dynamic>? ?? {};

        return Result.ok(HotelCancelResponseData.fromJson(data));
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể hủy đặt phòng',
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
  Future<Result<HotelAddOnBillData>> getAddOnBill(String bookingId) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.getUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/hotel-bookings/$bookingId/add-on-bill',
        ),
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

        return Result.ok(HotelAddOnBillData.fromJson(data));
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải hóa đơn dịch vụ',
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
  Future<Result<List<HotelAddOnServiceData>>> getAvailableServices(
    String bookingId,
  ) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.getUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/hotel-bookings/$bookingId/available-services',
        ),
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(request);

      final response = await request.close();
      debugPrint(
        'GetAvailableServices Response Status: ${response.statusCode}',
      );

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        debugPrint('GetAvailableServices Response Body: $stringData');
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as List<dynamic>? ?? [];

        final services = data
            .map(
              (e) => HotelAddOnServiceData.fromJson(e as Map<String, dynamic>),
            )
            .toList();

        return Result.ok(services);
      } else {
        final stringData = await response.transform(utf8.decoder).join();
        debugPrint('GetAvailableServices Error Body: $stringData');
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải danh sách dịch vụ',
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
  Future<Result<HotelAddOnOrderData>> createAddOnOrder({
    required String bookingId,
    required String serviceId,
    required int quantity,
    required DateTime scheduledTime,
  }) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.postUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/hotel-bookings/$bookingId/add-on-orders',
        ),
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        'application/json; charset=utf-8',
      );
      await _setBearerAuth(request);

      final body = jsonEncode({
        'serviceId': serviceId,
        'quantity': quantity,
        'scheduledTime': scheduledTime.toUtc().toIso8601String(),
      });
      debugPrint('CreateAddOnOrder Request Body: $body');
      request.write(body);

      final response = await request.close();
      debugPrint('CreateAddOnOrder Response Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        debugPrint('CreateAddOnOrder Response Body: $stringData');
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>? ?? {};

        return Result.ok(HotelAddOnOrderData.fromJson(data));
      } else {
        final stringData = await response.transform(utf8.decoder).join();
        debugPrint('CreateAddOnOrder Error Body: $stringData');
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể đặt dịch vụ (HTTP ${response.statusCode})',
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
  Future<Result<bool>> cancelAddOnOrder(String orderId) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.deleteUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/hotel-bookings/add-on-orders/$orderId',
        ),
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(request);

      final response = await request.close();
      debugPrint('CancelAddOnOrder Response Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        debugPrint('CancelAddOnOrder Success');
        return Result.ok(true);
      } else {
        final stringData = await response.transform(utf8.decoder).join();
        debugPrint('CancelAddOnOrder Error Body: $stringData');
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể hủy dịch vụ (HTTP ${response.statusCode})',
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
  Future<Result<HotelCreateBookingResponse>> createBooking({
    required List<Map<String, dynamic>> rooms,
    required String startDate,
    required String endDate,
    required List<Map<String, dynamic>> members,
    required String contactName,
    required String contactPhone,
    String? specialRequests,
    required String ipAddress,
  }) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.postUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/hotel-bookings'),
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        'application/json; charset=utf-8',
      );
      await _setBearerAuth(request);

      final body = jsonEncode({
        'rooms': rooms,
        'startDate': startDate,
        'endDate': endDate,
        'members': members,
        'contactName': contactName,
        'contactPhone': contactPhone,
        if (specialRequests != null && specialRequests.isNotEmpty)
          'specialRequests': specialRequests,
        'ipAddress': ipAddress,
      });
      debugPrint('CreateBooking Request Body: $body');
      request.write(body);

      final response = await request.close();

      debugPrint('CreateBooking Response Status: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();
        debugPrint('CreateBooking Response Body: $stringData');
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>? ?? {};

        return Result.ok(HotelCreateBookingResponse.fromJson(data));
      } else {
        final stringData = await response.transform(utf8.decoder).join();
        debugPrint('CreateBooking Error Body: $stringData');
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tạo đặt phòng (HTTP ${response.statusCode})',
        );
        debugPrint('CreateBooking Error Message: $errorMsg');
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }
}
