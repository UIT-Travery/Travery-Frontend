import 'dart:convert';
import 'dart:io';

import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/data/seed_models/booking_detail/booking_detail_model.dart';
import 'package:travery_frontend/data/services/api/model/booking/cancel_booking_request/cancel_booking_request.dart';
import 'package:travery_frontend/data/services/api/model/booking/cancel_booking_response/cancel_booking_response.dart';
import 'package:travery_frontend/data/services/api/model/booking/create_payment_response/create_payment_response.dart';
import 'package:travery_frontend/data/services/api/model/booking/user_booking_list_response/user_booking_list_response.dart';
import 'package:travery_frontend/data/services/booking/booking_service.dart';
import 'package:travery_frontend/data/services/token_refresh_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class UserBookingRepository extends BookingService {
  UserBookingRepository({required TokenRefreshService tokenRefreshService})
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
  Future<Result<BookingDetailModel?>> getBookingDetail(String bookingId) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.getUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/bookings/$bookingId'),
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
        final data = jsonMap['data'] as Map<String, dynamic>?;
        if (data == null) return const Result.ok(null);

        final members =
            (data['members'] as List<dynamic>?)
                ?.map((m) => BookingMember.fromJson(m as Map<String, dynamic>))
                .toList() ??
            [];

        return Result.ok(
          BookingDetailModel(
            id: data['id'] as String? ?? '',
            status: data['status'] as String? ?? '',
            totalPrice: (data['totalPrice'] as num?)?.toDouble() ?? 0,
            pricePerAdultAtBooking: (data['pricePerAdultAtBooking'] as num?)
                ?.toDouble(),
            pricePerChildAtBooking: (data['pricePerChildAtBooking'] as num?)
                ?.toDouble(),
            paymentDeadline: data['paymentDeadline'] as String?,
            specialRequests: data['specialRequests'] as String?,
            createdAt: data['createdAt'] as String?,
            tourName: data['tourName'] as String? ?? '',
            startDate: data['startDate'] as String?,
            endDate: data['endDate'] as String?,
            members: members,
            paymentMethod: data['paymentMethod'] as String?,
            paymentStatus: data['paymentStatus'] as String?,
            transactionId: data['transactionId'] as String?,
            paymentUrl:
                (data['payment'] as Map<String, dynamic>?)?['paymentUrl']
                    as String?,
            paymentAmount:
                ((data['payment'] as Map<String, dynamic>?)?['amount'] as num?)
                    ?.toDouble(),
            paymentExpiresAt:
                (data['payment'] as Map<String, dynamic>?)?['expiresAt']
                    as String?,
          ),
        );
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
  Future<Result<UserBookingPageData>> getMyBookings({
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
      if (status != null && status.isNotEmpty) {
        queryParams['status'] = status;
      }

      final request = await client.getUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/bookings/me', queryParams),
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
        final data = jsonMap['data'] as Map<String, dynamic>?;
        if (data == null) return Result.ok(const UserBookingPageData());
        return Result.ok(UserBookingPageData.fromJson(data));
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lấy danh sách booking thất bại',
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
  Future<Result<CancelData>> cancelBooking({
    required String bookingId,
    required CancelBookingRequest request,
  }) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final requestObj = await client.postUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/bookings/$bookingId/cancel'),
      );
      requestObj.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(requestObj);
      requestObj.write(jsonEncode(request));

      final response = await requestObj.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final dataMap = jsonMap['data'] as Map<String, dynamic>? ?? {};
        return Result.ok(
          CancelData(
            bookingId: dataMap['bookingId'] as String? ?? '',
            bookingStatus: dataMap['bookingStatus'] as String? ?? '',
            refundAmount: (dataMap['refundAmount'] as num?)?.toDouble() ?? 0,
            refundPercentage:
                (dataMap['refundPercentage'] as num?)?.toDouble() ?? 0,
            refundStatus: dataMap['refundStatus'] as String? ?? '',
            refundMessage: dataMap['refundMessage'] as String? ?? '',
          ),
        );
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
  Future<Result<PaymentResponseData>> createPayment(String bookingId) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final requestObj = await client.postUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/bookings/$bookingId/payments'),
      );
      requestObj.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(requestObj);

      final response = await requestObj.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>?;
        return Result.ok(PaymentResponseData.fromJson(data ?? {}));
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
}
