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

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  bool _isCancelling = false;
  bool get isCancelling => _isCancelling;

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
    _isLoading = true;
    _error = null;
    notifyListeners();

    if (bookingData != null) {
      _booking = bookingData;
      _isLoading = false;
      notifyListeners();
      return;
    }

    await _fetchBookingDetail(bookingId);
  }

  Future<void> _fetchBookingDetail(String bookingId) async {
    try {
      final result = await _hotelService.getBookingDetail(bookingId);

      if (result is Ok) {
        final okResult = result as Ok<HotelBookingData>;
        _booking = okResult.value;
      } else {
        _error = 'Không thể tải chi tiết đặt phòng';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
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
          );
        }
        notifyListeners();
        return cancelResponse;
      } else {
        // Error case
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
}
