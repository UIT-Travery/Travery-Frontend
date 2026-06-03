import 'package:travery_frontend/data/seed_models/booking_detail/booking_detail_model.dart';
import 'package:travery_frontend/data/services/api/model/booking/cancel_booking_request/cancel_booking_request.dart';
import 'package:travery_frontend/data/services/api/model/booking/cancel_booking_response/cancel_booking_response.dart';
import 'package:travery_frontend/data/services/api/model/booking/create_payment_response/create_payment_response.dart';
import 'package:travery_frontend/data/services/api/model/booking/user_booking_list_response/user_booking_list_response.dart';
import 'package:travery_frontend/utils/core_result.dart';

abstract class BookingService {
  Future<Result<BookingDetailModel?>> getBookingDetail(String bookingId);
  Future<Result<UserBookingPageData>> getMyBookings({
    String? status,
    int page = 0,
    int size = 20,
  });
  Future<Result<CancelData>> cancelBooking({
    required String bookingId,
    required CancelBookingRequest request,
  });
  Future<Result<PaymentResponseData>> createPayment(String bookingId);
}
