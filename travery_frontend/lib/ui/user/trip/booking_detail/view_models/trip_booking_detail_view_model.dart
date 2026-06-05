import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/trip/trip_booking_data.dart';
import 'package:travery_frontend/data/models/trip/cancel_trip_data.dart';
import 'package:travery_frontend/data/services/trip/trip_service.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'package:travery_frontend/utils/review_guards.dart';

class TripBookingDetailViewModel extends ChangeNotifier {
  TripBookingDetailViewModel({required TripService tripService})
    : _tripService = tripService;

  final TripService _tripService;

  TripBookingData? _bookingData;
  TripBookingData? get bookingData => _bookingData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  bool _isCancelling = false;
  bool get isCancelling => _isCancelling;

  bool _isSubmittingReview = false;
  bool get isSubmittingReview => _isSubmittingReview;
  final Set<String> _reviewedBookingIds = {};

  bool get canCreateReview {
    final booking = _bookingData;
    if (booking == null) return false;
    return booking.status.toUpperCase() == 'CHECKED_OUT' &&
        !booking.hasReview &&
        !_reviewedBookingIds.contains(booking.id);
  }

  CancelTripData? _cancelData;
  CancelTripData? get cancelData => _cancelData;

  Future<void> loadBooking(String bookingId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _tripService.getTripBookingDetail(bookingId);

    switch (result) {
      case Ok(value: final data):
        _bookingData = data;
      case Error(error: final e):
        _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> cancelBooking(
    String bookingId, {
    String? reason,
    String? bankName,
    String? accountNumber,
    String? accountHolderName,
  }) async {
    _isCancelling = true;
    _error = null;
    notifyListeners();

    final result = await _tripService.cancelTripBooking(
      bookingId,
      reason: reason,
      bankName: bankName,
      accountNumber: accountNumber,
      accountHolderName: accountHolderName,
    );

    switch (result) {
      case Ok(value: final data):
        _cancelData = data;
        _isCancelling = false;
        notifyListeners();
        return true;
      case Error(error: final e):
        final msg = e.toString();
        if (msg.startsWith('HttpException: ')) {
          _error = msg.substring('HttpException: '.length);
        } else {
          _error = msg;
        }
        _isCancelling = false;
        notifyListeners();
        return false;
    }
  }

  Future<String?> createReview({
    required int rating,
    required String comment,
  }) async {
    final booking = _bookingData;
    if (booking == null) return 'Không tìm thấy thông tin đặt xe';
    if (!canCreateReview) {
      return 'Bạn đã gửi đánh giá cho đơn này rồi. Cảm ơn bạn đã chia sẻ trải nghiệm.';
    }

    _isSubmittingReview = true;
    _error = null;
    notifyListeners();

    final result = await _tripService.createReview(
      bookingId: booking.id,
      rating: rating,
      content: comment,
    );

    switch (result) {
      case Ok():
        _reviewedBookingIds.add(booking.id);
        await loadBooking(booking.id);
        _isSubmittingReview = false;
        notifyListeners();
        return null;
      case Error(error: final e):
        if (isDuplicateReviewError(e)) {
          _reviewedBookingIds.add(booking.id);
        }
        final message = friendlyReviewError(e);
        _error = message;
        _isSubmittingReview = false;
        notifyListeners();
        return message;
    }
  }
}
