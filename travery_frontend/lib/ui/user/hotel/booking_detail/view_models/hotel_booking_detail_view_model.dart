import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/hotel/hotel_booking_data.dart';
import 'package:travery_frontend/data/services/hotel/hotel_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class HotelBookingDetailViewModel extends ChangeNotifier {
  HotelBookingDetailViewModel({required HotelService hotelService})
    : _hotelService = hotelService;

  final HotelService _hotelService;

  HotelBookingData? _booking;
  HotelBookingData? get booking => _booking;

  HotelAddOnBillData? _addOnBill;
  HotelAddOnBillData? get addOnBill => _addOnBill;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingAddOnBill = false;
  bool get isLoadingAddOnBill => _isLoadingAddOnBill;

  String? _error;
  String? get error => _error;

  bool _isCancelling = false;
  bool get isCancelling => _isCancelling;

  bool _isSubmittingReview = false;
  bool get isSubmittingReview => _isSubmittingReview;
  final Set<String> _reviewedBookingIds = {};

  bool get canCreateReview {
    final booking = _booking;
    if (booking == null) return false;
    return booking.status.toUpperCase() == 'CHECKED_OUT' &&
        !booking.hasReview &&
        !_reviewedBookingIds.contains(booking.id);
  }

  double get serviceTotal {
    return _booking?.services.fold<double>(0, (sum, s) => sum + s.total) ?? 0;
  }

  double get grandTotal {
    return (_booking?.totalPrice ?? 0) + serviceTotal;
  }

  Future<void> loadBooking(
    String bookingId, {
    HotelBookingData? bookingData,
  }) async {
    debugPrint(
      '[ViewModel.loadBooking] bookingId=$bookingId, bookingData=${bookingData != null}',
    );
    _isLoading = true;
    _error = null;
    notifyListeners();

    if (bookingData != null) {
      debugPrint('[ViewModel.loadBooking] Using passed bookingData');
      _booking = bookingData;
      debugPrint(
        '[ViewModel.loadBooking] _booking.hotelName=${_booking?.hotelName}, items=${_booking?.items?.length}',
      );
    }

    await _fetchBookingDetail(bookingId);
    await _fetchAddOnBill(bookingId);
  }

  Future<void> loadBookings(String bookingId) => loadBooking(bookingId);

  Future<void> _fetchBookingDetail(String bookingId) async {
    try {
      final result = await _hotelService.getBookingDetail(bookingId);

      if (result is Ok) {
        final okResult = result as Ok<HotelBookingData>;
        _booking = okResult.value;
        debugPrint(
          '[ViewModel._fetchBookingDetail] Success - hotelName=${_booking?.hotelName}, items=${_booking?.items?.length}, members=${_booking?.members?.length}',
        );
      } else {
        _error = 'Không thể tải chi tiết đặt phòng';
        debugPrint('[ViewModel._fetchBookingDetail] Error: $_error');
      }
    } catch (e) {
      _error = e.toString();
      debugPrint('[ViewModel._fetchBookingDetail] Exception: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _fetchAddOnBill(String bookingId) async {
    _isLoadingAddOnBill = true;
    notifyListeners();

    try {
      final result = await _hotelService.getAddOnBill(bookingId);
      if (result is Ok) {
        _addOnBill = (result as Ok<HotelAddOnBillData>).value;
        debugPrint(
          '[ViewModel._fetchAddOnBill] Success - orders=${_addOnBill?.addOnOrders.length}',
        );
      } else {
        debugPrint('[ViewModel._fetchAddOnBill] Error');
      }
    } catch (e) {
      debugPrint('[ViewModel._fetchAddOnBill] Exception: $e');
    } finally {
      _isLoadingAddOnBill = false;
      notifyListeners();
    }
  }

  Future<HotelCancelResponseData?> cancelBooking({
    required String bookingId,
    required String reason,
    required String bankName,
    required String accountNumber,
    required String accountHolderName,
  }) async {
    _isCancelling = true;
    _error = null;
    notifyListeners();

    try {
      debugPrint('CancelBooking: Calling API with bookingId=$bookingId');
      final result = await _hotelService.cancelBooking(
        bookingId: bookingId,
        reason: reason,
        bankName: bankName,
        accountNumber: accountNumber,
        accountHolderName: accountHolderName,
      );

      debugPrint('CancelBooking: API result type = ${result.runtimeType}');

      if (result is Ok<HotelCancelResponseData>) {
        final cancelResponse = result.value;
        debugPrint(
          'CancelBooking: Success - bookingStatus=${cancelResponse.bookingStatus}, refundAmount=${cancelResponse.refundAmount}',
        );

        if (_booking != null) {
          _booking = HotelBookingData(
            id: _booking!.id,
            hotelName: _booking!.hotelName,
            hotelAddress: _booking!.hotelAddress,
            hotelImageUrl: _booking!.hotelImageUrl,
            roomName: _booking!.roomName,
            roomCount: _booking!.roomCount,
            checkInDate: _booking!.checkInDate,
            checkOutDate: _booking!.checkOutDate,
            pricePerNight: _booking!.pricePerNight,
            totalPrice: _booking!.totalPrice,
            status: cancelResponse.bookingStatus,
            contactName: _booking!.contactName,
            contactPhone: _booking!.contactPhone,
            contactEmail: _booking!.contactEmail,
            guests: _booking!.guests,
            services: _booking!.services,
            paymentDeadline: _booking!.paymentDeadline,
            paymentMethod: _booking!.paymentMethod,
            paymentStatus: _booking!.paymentStatus,
            transactionId: _booking!.transactionId,
            gatewayTransactionId: _booking!.gatewayTransactionId,
            startDate: _booking!.startDate,
            endDate: _booking!.endDate,
            createdAt: _booking!.createdAt,
            guestCount: _booking!.guestCount,
            items: _booking!.items,
            members: _booking!.members,
            hasReview: _booking!.hasReview,
          );
        }
        notifyListeners();
        return cancelResponse;
      } else {
        debugPrint('CancelBooking: Error - ${result.toString()}');
        _error = result.toString();
        return null;
      }
    } catch (e) {
      _error = e.toString();
      debugPrint('CancelBooking: Exception - $e');
      return null;
    } finally {
      _isCancelling = false;
      notifyListeners();
    }
  }

  Future<String?> createReview({
    required int rating,
    required String comment,
  }) async {
    final booking = _booking;
    if (booking == null) return 'Không tìm thấy thông tin đặt phòng';

    _isSubmittingReview = true;
    _error = null;
    notifyListeners();

    final result = await _hotelService.createReview(
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
        final message = _cleanError(e);
        _error = message;
        _isSubmittingReview = false;
        notifyListeners();
        return message;
    }
  }

  String _cleanError(Object error) {
    final message = error.toString();
    if (message.startsWith('HttpException: ')) {
      return message.substring('HttpException: '.length);
    }
    return message;
  }
}
