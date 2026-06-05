import 'package:travery_frontend/utils/core_result.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_dashboard_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/available_room_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_room_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_add_on_order_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/check_in_request.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/check_out_preview_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_booking_list_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_booking_detail_response.dart';
import 'package:travery_frontend/data/repositories/receptionist/receptionist_repository.dart';
import 'package:travery_frontend/data/services/api/receptionist_api_service.dart';
import 'package:travery_frontend/data/services/token_refresh_service.dart';

class ReceptionistRepositoryRemote extends ReceptionistRepository {
  final ReceptionistApiService _apiService;
  final TokenRefreshService _tokenRefreshService;

  ReceptionistRepositoryRemote({
    required ReceptionistApiService apiService,
    required TokenRefreshService tokenRefreshService,
  })  : _apiService = apiService,
        _tokenRefreshService = tokenRefreshService;

  Future<String?> _getAccessToken() async {
    final result = await _tokenRefreshService.getValidAccessToken();
    return result is Ok ? (result as Ok<String>).value : null;
  }

  @override
  Future<Result<RecepDashboardResponse>> getDashboard() async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    return _apiService.getDashboard(accessToken: token);
  }

  @override
  Future<Result<List<AvailableRoomResponse>>> getAvailableRooms(String roomTypeId) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    return _apiService.getAvailableRooms(
      accessToken: token,
      roomTypeId: roomTypeId,
    );
  }

  @override
  Future<Result<List<RecepRoomResponse>>> getRooms() async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    return _apiService.getRooms(
      accessToken: token,
    );
  }

  @override
  Future<Result<void>> updateRoomStatus(String roomId, String status) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    return _apiService.updateRoomStatus(
      accessToken: token,
      roomId: roomId,
      status: status,
    );
  }

  @override
  Future<Result<List<RecepAddOnOrderResponse>>> getAddOnOrders() async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    return _apiService.getAddOnOrders(accessToken: token);
  }

  @override
  Future<Result<void>> updateAddOnOrderStatus(String orderId, String status) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    return _apiService.updateAddOnOrderStatus(
      accessToken: token,
      orderId: orderId,
      status: status,
    );
  }

  @override
  Future<Result<void>> checkIn(String bookingId, CheckInRequest requestBody) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    return _apiService.checkIn(
      accessToken: token,
      bookingId: bookingId,
      requestBody: requestBody,
    );
  }

  @override
  Future<Result<CheckOutPreviewResponse>> checkOutPreview(String bookingId) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    return _apiService.checkOutPreview(
      accessToken: token,
      bookingId: bookingId,
    );
  }

  @override
  Future<Result<void>> confirmCheckOut(String bookingId) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    return _apiService.confirmCheckOut(
      accessToken: token,
      bookingId: bookingId,
    );
  }

  @override
  Future<Result<List<RecepBookingListResponse>>> getBookings({
    String? status,
    String? guestName,
    String? date,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    return _apiService.getBookings(
      accessToken: token,
      status: status,
      guestName: guestName,
      date: date,
    );
  }

  @override
  Future<Result<RecepBookingDetailResponse>> getBookingDetail(String bookingId) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    return _apiService.getBookingDetail(
      accessToken: token,
      bookingId: bookingId,
    );
  }
}
