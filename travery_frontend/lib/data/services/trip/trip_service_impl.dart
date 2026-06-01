import 'dart:convert';
import 'dart:io';

import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/data/models/trip/trip_search_item.dart';
import 'package:travery_frontend/data/models/trip/trip_seat_data.dart';
import 'package:travery_frontend/data/models/trip/trip_booking_data.dart';
import 'package:travery_frontend/data/models/trip/cancel_trip_data.dart';
import 'package:travery_frontend/data/models/trip/destination_data.dart';
import 'package:travery_frontend/data/services/api/model/trip/search_trip_request/search_trip_request.dart';
import 'package:travery_frontend/data/services/api/model/trip/create_trip_booking_request/create_trip_booking_request.dart';
import 'package:travery_frontend/data/services/security_storage_service.dart';
import 'package:travery_frontend/data/services/trip/trip_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class TripServiceImpl implements TripService {
  TripServiceImpl({required SecurityStorageService securityStorageService})
    : _securityStorageService = securityStorageService;

  final SecurityStorageService _securityStorageService;

  Future<void> _setBearerAuth(HttpClientRequest request) async {
    final token = await _securityStorageService.getAccessToken();
    if (token != null) {
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
  Future<Result<List<TripSearchItem>>> searchTrips(
    SearchTripRequest request,
  ) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final requestObj = await client.postUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/coach-trips/search'),
      );
      requestObj.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(requestObj);
      requestObj.write(jsonEncode(request.toJson()));

      final response = await requestObj.close();

      if (response.statusCode == 200) {
        try {
          final stringData = await response.transform(utf8.decoder).join();
          final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
          final data = jsonMap['data'] as List<dynamic>?;
          if (data == null) return Result.ok([]);
          final items = data
              .map((e) => TripSearchItem.fromJson(e as Map<String, dynamic>))
              .toList();
          return Result.ok(items);
        } on Exception catch (error) {
          return Result.error(error);
        }
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Tìm kiếm chuyến xe thất bại',
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
  Future<Result<TripSeatData>> getTripSeats(String tripId) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.getUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/coach-trips/$tripId/seats'),
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(request);

      final response = await request.close();

      if (response.statusCode == 200) {
        try {
          final stringData = await response.transform(utf8.decoder).join();
          final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
          final data = jsonMap['data'] as Map<String, dynamic>?;
          if (data == null)
            return Result.error(const HttpException('Không có dữ liệu ghế'));
          return Result.ok(TripSeatData.fromJson(data));
        } on Exception catch (error) {
          return Result.error(error);
        }
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lấy thông tin ghế thất bại',
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
  Future<Result<TripBookingData>> createTripBooking(
    CreateTripBookingRequest request,
  ) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final requestObj = await client.postUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/coach-bookings'),
      );
      requestObj.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(requestObj);
      requestObj.write(jsonEncode(request.toJson()));

      final response = await requestObj.close();

      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          final stringData = await response.transform(utf8.decoder).join();
          final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
          final data = jsonMap['data'] as Map<String, dynamic>?;
          if (data == null)
            return Result.error(
              const HttpException('Không có dữ liệu booking'),
            );
          return Result.ok(TripBookingData.fromJson(data));
        } on Exception catch (error) {
          return Result.error(error);
        }
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Đặt vé thất bại',
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
  Future<Result<TripBookingData>> getTripBookingDetail(String bookingId) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.getUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/coach-bookings/$bookingId'),
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(request);

      final response = await request.close();

      if (response.statusCode == 200) {
        try {
          final stringData = await response.transform(utf8.decoder).join();
          final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
          final data = jsonMap['data'] as Map<String, dynamic>?;
          if (data == null)
            return Result.error(
              const HttpException('Không có dữ liệu booking'),
            );
          return Result.ok(TripBookingData.fromJson(data));
        } on Exception catch (error) {
          return Result.error(error);
        }
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lấy chi tiết booking thất bại',
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
  Future<Result<CancelTripData>> cancelTripBooking(
    String bookingId, {
    String? reason,
  }) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final requestObj = await client.postUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/coach-bookings/$bookingId/cancel',
        ),
      );
      requestObj.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(requestObj);
      final body = reason != null ? jsonEncode({'reason': reason}) : '{}';
      requestObj.write(body);

      final response = await requestObj.close();

      if (response.statusCode == 200) {
        try {
          final stringData = await response.transform(utf8.decoder).join();
          final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
          final data = jsonMap['data'] as Map<String, dynamic>?;
          if (data == null)
            return Result.error(const HttpException('Không có dữ liệu hủy'));
          return Result.ok(CancelTripData.fromJson(data));
        } on Exception catch (error) {
          return Result.error(error);
        }
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Hủy booking thất bại',
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
  Future<Result<TripPaymentData>> createTripPayment(String bookingId) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final requestObj = await client.postUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/coach-bookings/$bookingId/payment',
        ),
      );
      requestObj.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(requestObj);

      final response = await requestObj.close();

      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          final stringData = await response.transform(utf8.decoder).join();
          final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
          final data = jsonMap['data'] as Map<String, dynamic>?;
          if (data == null)
            return Result.error(
              const HttpException('Không có dữ liệu thanh toán'),
            );
          return Result.ok(TripPaymentData.fromJson(data));
        } on Exception catch (error) {
          return Result.error(error);
        }
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Tạo thanh toán thất bại',
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
  Future<Result<List<StationData>>> getStations() async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.getUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/stations'),
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(request);

      final response = await request.close();

      if (response.statusCode == 200) {
        try {
          final stringData = await response.transform(utf8.decoder).join();
          final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
          final data = jsonMap['data'] as List<dynamic>?;
          if (data == null) return Result.ok([]);
          final stations = data
              .map((e) => StationData.fromJson(e as Map<String, dynamic>))
              .toList();
          return Result.ok(stations);
        } on Exception catch (error) {
          return Result.error(error);
        }
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lấy danh sách trạm thất bại',
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
  Future<Result<List<DestinationData>>> searchDestinations(
    String keyword,
  ) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.getUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/destinations/search', {
          'keyword': keyword,
        }),
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(request);

      final response = await request.close();

      if (response.statusCode == 200) {
        try {
          final stringData = await response.transform(utf8.decoder).join();
          final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
          final data = jsonMap['data'] as List<dynamic>?;
          if (data == null) return Result.ok([]);
          final destinations = data
              .map((e) => DestinationData.fromJson(e as Map<String, dynamic>))
              .toList();
          return Result.ok(destinations);
        } on Exception catch (error) {
          return Result.error(error);
        }
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Tìm kiếm điểm đến thất bại',
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
