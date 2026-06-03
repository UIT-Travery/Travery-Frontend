import 'package:travery_frontend/data/models/trip/trip_search_item.dart';
import 'package:travery_frontend/data/models/trip/trip_seat_data.dart';
import 'package:travery_frontend/data/models/trip/trip_booking_data.dart';
import 'package:travery_frontend/data/models/trip/cancel_trip_data.dart';
import 'package:travery_frontend/data/models/trip/destination_data.dart';
import 'package:travery_frontend/data/services/api/model/trip/search_trip_request/search_trip_request.dart';
import 'package:travery_frontend/data/services/api/model/trip/create_trip_booking_request/create_trip_booking_request.dart';
import 'package:travery_frontend/utils/core_result.dart';

abstract class TripService {
  Future<Result<List<TripSearchItem>>> searchTrips(SearchTripRequest request);

  Future<Result<TripSeatData>> getTripSeats(String tripId);

  Future<Result<TripBookingData>> createTripBooking(
    CreateTripBookingRequest request,
  );

  Future<Result<TripBookingData>> getTripBookingDetail(String bookingId);

  Future<Result<CancelTripData>> cancelTripBooking(
    String bookingId, {
    String? reason,
  });

  Future<Result<TripPaymentData>> createTripPayment(String bookingId);

  Future<Result<List<StationData>>> getStations();

  Future<Result<List<DestinationData>>> searchDestinations(String keyword);
}
