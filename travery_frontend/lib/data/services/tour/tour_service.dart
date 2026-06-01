import 'package:travery_frontend/data/models/tour/tour_detail_page_data.dart';
import 'package:travery_frontend/data/models/tour/tour_featured_response.dart';
import 'package:travery_frontend/data/models/tour/tour_search_response.dart';
import 'package:travery_frontend/data/seed_models/tour_instance/tour_instance.dart';
import 'package:travery_frontend/data/services/api/model/booking/create_tour_booking_request/create_tour_booking_request.dart';
import 'package:travery_frontend/data/services/api/model/booking/create_tour_booking_response/create_tour_booking_response.dart';
import 'package:travery_frontend/data/services/api/model/booking/create_payment_response/create_payment_response.dart';
import 'package:travery_frontend/utils/core_result.dart';

abstract class TourService {
  Future<Result<TourDetailPageData?>> getTourById(String tourId);
  Future<Result<List<TourInstance>>> getTourInstances(String tourId);
  Future<Result<TourSearchPageData>> searchTours({
    String? keyword,
    double? minPrice,
    double? maxPrice,
    int? minRating,
    DateTime? startDate,
    String? destinationId,
    String? sortBy,
    String? sortDir,
    int page = 0,
    int size = 20,
    int? minDays,
  });

  Future<Result<List<TourFeaturedItem>>> getFeaturedTours();

  Future<Result<TourBookingData>> createTourBooking({
    required String instanceId,
    required CreateTourBookingRequest request,
  });

  Future<Result<TourBookingData>> getBookingDetail(String bookingId);

  Future<Result<PaymentResponseData>> createPayment(String bookingId);
}
