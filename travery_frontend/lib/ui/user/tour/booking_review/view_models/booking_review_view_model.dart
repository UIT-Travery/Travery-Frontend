import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/api/profile_service.dart';
import 'package:travery_frontend/data/services/api/model/booking/create_tour_booking_request/create_tour_booking_request.dart';
import 'package:travery_frontend/data/services/api/model/booking/create_tour_booking_response/create_tour_booking_response.dart';
import 'package:travery_frontend/data/services/tour/tour_service.dart';
import 'package:travery_frontend/data/services/token_refresh_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class BookingReviewViewModel extends ChangeNotifier {
  BookingReviewViewModel({
    required TourService tourService,
    required TokenRefreshService tokenRefreshService,
    ProfileService? profileService,
  }) : _tourService = tourService,
       _tokenRefreshService = tokenRefreshService,
       _profileService = profileService ?? ProfileService() {
    _loadProfile();
  }

  final TourService _tourService;
  final TokenRefreshService _tokenRefreshService;
  final ProfileService _profileService;

  String? _userName;
  String? _userPhone;
  String? _userEmail;
  String? get userName => _userName;
  String? get userPhone => _userPhone;
  String? get userEmail => _userEmail;

  bool _isLoadingProfile = false;
  bool get isLoadingProfile => _isLoadingProfile;

  Future<void> _loadProfile() async {
    _isLoadingProfile = true;
    notifyListeners();

    final tokenResult = await _tokenRefreshService.getValidAccessToken();
    final token = switch (tokenResult) {
      Ok(value: final t) => t,
      Error() => null,
    };
    if (token == null) {
      _isLoadingProfile = false;
      notifyListeners();
      return;
    }

    final result = await _profileService.getProfile(accessToken: token);
    switch (result) {
      case Ok(value: final profile):
        _userName = profile.fullName;
        _userPhone = profile.phoneNumber;
        _userEmail = profile.email;
      case Error():
        break;
    }

    _isLoadingProfile = false;
    notifyListeners();
  }

  bool _isCreatingBooking = false;
  bool get isCreatingBooking => _isCreatingBooking;

  String? _error;
  String? get error => _error;

  TourBookingData? _bookingData;
  TourBookingData? get bookingData => _bookingData;

  bool _termsAccepted = false;
  bool get termsAccepted => _termsAccepted;

  void setTermsAccepted(bool value) {
    _termsAccepted = value;
    notifyListeners();
  }

  /// Converts date from DD/MM/YYYY to YYYY-MM-DD (ISO 8601) format.
  String _toIsoDate(String dateStr) {
    if (dateStr.isEmpty) return '';
    // dateStr is in DD/MM/YYYY format from the date picker
    final parts = dateStr.split('/');
    if (parts.length != 3) return dateStr;
    final day = parts[0];
    final month = parts[1];
    final year = parts[2];
    return '$year-$month-$day';
  }

  Future<bool> createBooking({
    required String instanceId,
    required List<Map<String, dynamic>> members,
    required String specialRequests,
  }) async {
    _isCreatingBooking = true;
    _error = null;
    notifyListeners();

    final request = _buildRequest(members, specialRequests);

    final result = await _tourService.createTourBooking(
      instanceId: instanceId,
      request: request,
    );

    switch (result) {
      case Ok(value: final data):
        _bookingData = data;
        _isCreatingBooking = false;
        notifyListeners();
        return true;
      case Error(error: final e):
        _error = _friendlyError(e.toString());
        _isCreatingBooking = false;
        notifyListeners();
        return false;
    }
  }

  String _friendlyError(String raw) {
    final lower = raw.toLowerCase();

    if (lower.contains('member type mismatch') ||
        lower.contains('declared adult') && lower.contains('indicates child') ||
        lower.contains('declared child') && lower.contains('indicates adult') ||
        lower.contains('adult') &&
            lower.contains('child') &&
            (lower.contains('declared') || lower.contains('date of birth'))) {
      return 'Người lớn phải từ 12 tuổi trở lên, trẻ em phải từ 11 tuổi trở xuống.';
    }
    if (lower.contains('slot') ||
        lower.contains('full') ||
        lower.contains('capacity')) {
      return 'Tour đã hết chỗ trống. Vui lòng chọn ngày khác.';
    }
    if (lower.contains('member') || lower.contains('khách')) {
      return 'Thông tin khách không hợp lệ. Vui lòng kiểm tra lại.';
    }
    if (lower.contains('auth') ||
        lower.contains('token') ||
        lower.contains('unauthorized')) {
      return 'Phiên đăng nhập hết hạn. Vui lòng đăng nhập lại.';
    }
    if (lower.contains('network') ||
        lower.contains('connection') ||
        lower.contains('socket')) {
      return 'Không có kết nối mạng. Vui lòng kiểm tra internet.';
    }
    if (lower.contains('timeout')) {
      return 'Yêu cầu bị giới hạn thời gian. Vui lòng thử lại.';
    }
    if (lower.contains('instance') ||
        lower.contains('not found') ||
        lower.contains('không tìm thấy')) {
      return 'Tour không tồn tại hoặc đã kết thúc.';
    }
    if (lower.contains('already') ||
        lower.contains('duplicate') ||
        lower.contains('đã tồn tại')) {
      return 'Bạn đã đặt tour này rồi.';
    }
    if (lower.contains('closed') ||
        lower.contains('booking') && lower.contains('close')) {
      return 'Đặt tour đã bị đóng. Vui lòng chọn tour khác.';
    }

    // Strip generic prefixes like "Exception:" or "Error:"
    var msg = raw.replaceAll(
      RegExp(r'^(Exception|Error|ErrorCode)?[:\s]*', caseSensitive: false),
      '',
    );
    if (msg.length > 100) msg = 'Có lỗi xảy ra. Vui lòng thử lại.';
    return msg.isEmpty ? 'Có lỗi xảy ra. Vui lòng thử lại.' : msg;
  }

  CreateTourBookingRequest _buildRequest(
    List<Map<String, dynamic>> members,
    String specialRequests,
  ) {
    final bookingMembers = members.map((m) {
      final rawDob = m['dateOfBirth'] as String? ?? '';
      return BookingMemberRequest(
        fullName: m['fullName'] as String? ?? '',
        identityNumber: m['identityNumber'] as String? ?? '',
        dateOfBirth: _toIsoDate(rawDob),
        memberType: m['memberType'] as String? ?? 'ADULT',
      );
    }).toList();

    return CreateTourBookingRequest(
      members: bookingMembers,
      specialRequests: specialRequests,
    );
  }
}
