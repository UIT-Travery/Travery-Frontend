import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/api/model/booking/create_tour_booking_request/create_tour_booking_request.dart';
import 'package:travery_frontend/data/services/api/model/booking/create_tour_booking_response/create_tour_booking_response.dart';
import 'package:travery_frontend/data/services/tour/tour_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class MemberFormData {
  MemberFormData({
    required this.fullName,
    required this.identityNumber,
    required this.dateOfBirth,
    required this.memberType,
  });

  String fullName;
  String identityNumber;
  String dateOfBirth;
  String memberType;

  BookingMemberRequest toRequest() => BookingMemberRequest(
    fullName: fullName,
    identityNumber: identityNumber,
    dateOfBirth: _toIsoDate(dateOfBirth),
    memberType: memberType,
  );

  /// Converts date from DD/MM/YYYY to YYYY-MM-DD (ISO 8601) format.
  static String _toIsoDate(String dateStr) {
    if (dateStr.isEmpty) return '';
    final parts = dateStr.split('/');
    if (parts.length != 3) return dateStr;
    return '${parts[2]}-${parts[1]}-${parts[0]}';
  }
}

class BookingInputViewModel extends ChangeNotifier {
  BookingInputViewModel({required TourService tourService})
    : _tourService = tourService;

  final TourService _tourService;

  int _adultCount = 1;
  int get adultCount => _adultCount;

  int _childCount = 0;
  int get childCount => _childCount;

  String _specialRequests = '';
  String get specialRequests => _specialRequests;

  final List<MemberFormData> _members = [
    MemberFormData(
      fullName: '',
      identityNumber: '',
      dateOfBirth: '',
      memberType: 'ADULT',
    ),
  ];
  List<MemberFormData> get members => _members;

  bool _isSubmitting = false;
  bool get isSubmitting => _isSubmitting;

  String? _error;
  String? get error => _error;

  TourBookingData? _bookingData;
  TourBookingData? get bookingData => _bookingData;

  void setAdultCount(int count) {
    if (count < 1) return;
    _adultCount = count;
    _syncMembers();
    notifyListeners();
  }

  void setChildCount(int count) {
    if (count < 0) return;
    _childCount = count;
    _syncMembers();
    notifyListeners();
  }

  void setSpecialRequests(String value) {
    _specialRequests = value;
    notifyListeners();
  }

  void updateMember(int index, MemberFormData member) {
    if (index < 0 || index >= _members.length) return;
    _members[index] = member;
    notifyListeners();
  }

  void _syncMembers() {
    final total = _adultCount + _childCount;
    while (_members.length < total) {
      final isAdult = _members.length < _adultCount;
      _members.add(
        MemberFormData(
          fullName: '',
          identityNumber: '',
          dateOfBirth: '',
          memberType: isAdult ? 'ADULT' : 'CHILD',
        ),
      );
    }
    while (_members.length > total) {
      _members.removeLast();
    }
    for (int i = 0; i < _members.length; i++) {
      _members[i].memberType = i < _adultCount ? 'ADULT' : 'CHILD';
    }
  }

  Future<bool> submitBooking({required String instanceId}) async {
    _isSubmitting = true;
    _error = null;
    notifyListeners();

    final validMembers = _members
        .where((m) => m.fullName.trim().isNotEmpty)
        .map((m) => m.toRequest())
        .toList();

    if (validMembers.isEmpty) {
      _error = 'Vui lòng nhập thông tin ít nhất một hành khách';
      _isSubmitting = false;
      notifyListeners();
      return false;
    }

    final request = CreateTourBookingRequest(
      members: validMembers,
      specialRequests: _specialRequests,
    );

    final result = await _tourService.createTourBooking(
      instanceId: instanceId,
      request: request,
    );

    switch (result) {
      case Ok(value: final data):
        _bookingData = data;
        _isSubmitting = false;
        notifyListeners();
        return true;
      case Error(error: final e):
        _error = e.toString();
        _isSubmitting = false;
        notifyListeners();
        return false;
    }
  }

  bool validateMembers() {
    for (final member in _members) {
      if (member.fullName.trim().isEmpty) return false;
    }
    return true;
  }
}
