import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/seed_models/room/room.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'package:travery_frontend/domain/models/admin/business_account/business_account.dart';
import 'package:travery_frontend/domain/models/admin/business_coach/business_coach.dart';
import 'package:travery_frontend/domain/models/admin/business_dashboard/business_dashboard.dart';
import 'package:travery_frontend/domain/models/admin/business_hotel/business_hotel.dart';
import 'package:travery_frontend/domain/models/admin/business_tour/business_tour.dart';
import 'package:travery_frontend/domain/models/admin/tour_summary/tour_summary.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour_template/coordinator_tour_template.dart';

abstract class AdminRepository extends ChangeNotifier {
  // ── Dashboard ──────────────────────────────────────────────────────────────

  Future<Result<BusinessDashboard>> getDashboardStats();

  Future<Result<List<double>>> getRevenueByMonth({
    required int month,
    required int year,
  });

  // ── Accounts ───────────────────────────────────────────────────────────────

  Future<Result<List<BusinessAccount>>> getAllAccounts();

  Future<Result<BusinessAccount>> getAccount({required String id});

  Future<Result<void>> createAccount({
    required String name,
    required String email,
    required String password,
    required String role,
    required bool isActive,
    String? guideLicense,
    String? hotelId,
  });

  Future<Result<void>> updateAccount({
    required String id,
    required String name,
    required String email,
    required String employeeId,
    required String role,
    required bool isActive,
  });

  Future<Result<void>> deleteAccount({required String id});

  /// GET /api/v1/admin/users — paginated list of users.
  /// Returns raw page map so callers can build their own pagination UI.
  Future<Result<Map<String, dynamic>>> getUsers({
    String? role,
    String? status,
    int page = 0,
    int size = 20,
  });

  Future<Result<BusinessAccount>> getUserById({required String id});

  Future<Result<BusinessAccount>> banUser({required String id});

  Future<Result<BusinessAccount>> unbanUser({required String id});

  Future<Result<BusinessAccount>> updateReceptionistProfile({
    required String id,
    String? fullName,
    String? phoneNumber,
    String? shiftType,
    String? hotelId,
  });

  Future<Result<BusinessAccount>> updateGuideProfile({
    required String id,
    String? fullName,
    String? phoneNumber,
    String? guideLicense,
    int? yearsExperience,
    List<String>? languages,
  });

  Future<Result<BusinessAccount>> updateCoordinatorProfile({
    required String id,
    String? fullName,
    String? phoneNumber,
    String? department,
  });

  Future<Result<BusinessAccount>> updateUserAvatar({
    required String id,
    required String filePath,
  });

  // ── Seat Layouts ──────────────────────────────────────────────────────────

  Future<Result<String>> createSeatLayout({
    required String name,
    required String coachType,
    required List<dynamic> items, // dynamic to accept BusinessCoachSeat or Map
  });

  // ── Vehicles ───────────────────────────────────────────────────────────────

  Future<Result<List<BusinessCoach>>> getAllVehicles();

  Future<Result<BusinessCoach>> getVehicle({required String id});

  Future<Result<void>> createVehicle({
    required String registrationNumber,
    required String type,
    required String seatLayoutId,
    required int seatCount,
  });

  Future<Result<void>> updateVehicle({
    required String id,
    required String registrationNumber,
    required String type,
    required String seatLayoutId,
    required int seatCount,
  });

  Future<Result<void>> deleteVehicle({required String id});

  // ── Hotels ────────────────────────────────────────────────────────────────

  Future<Result<List<BusinessHotel>>> getAllHotels({
    int page = 0,
    int size = 20,
  });

  Future<Result<BusinessHotel>> getHotel({required String id});

  Future<Result<String>> createHotel({
    required String name,
    String? description,
    required String address,
    required String cityProvince,
    required String checkInTime,
    required String checkOutTime,
    List<String> amenityIds,
    required String refundPolicyId,
  });

  Future<Result<void>> updateHotel({
    required String hotelId,
    String? name,
    String? description,
    String? address,
    String? cityProvince,
    String? checkInTime,
    String? checkOutTime,
    List<String>? amenityIds,
    String? refundPolicyId,
  });

  Future<Result<void>> deleteHotel({required String id});

  Future<Result<List<dynamic>>> uploadHotelImages({
    required String hotelId,
    required List<String> filePaths,
  });

  Future<Result<void>> deleteHotelImage({
    required String hotelId,
    required String imageId,
  });

  Future<Result<void>> setHotelThumbnail({
    required String hotelId,
    required String imageId,
  });

  Future<Result<List<dynamic>>> getHotelServices({required String hotelId});

  Future<Result<void>> createHotelService({
    required String hotelId,
    required String name,
    required String category,
    required double price,
    required String unit,
    String? description,
  });

  Future<Result<List<dynamic>>> getHotelRoomTypes({required String hotelId});

  Future<Result<void>> createHotelRoomType({
    required String hotelId,
    required String name,
    String? description,
    int? capacityAdults,
    int? capacityChildren,
    required double basePrice,
    required String bedType,
    int? area,
  });

  Future<Result<List<dynamic>>> getHotelRooms({required String hotelId});

  Future<Result<void>> createHotelRoom({
    required String hotelId,
    required String roomNumber,
    required int floor,
    required String roomTypeId,
  });

  // ── Amenities ─────────────────────────────────────────────────────────────

  Future<Result<List<dynamic>>> getAllAmenities();

  Future<Result<void>> createAmenity({
    required String name,
    required String type,
    String? iconImagePath,
  });

  Future<Result<void>> updateAmenity({
    required String amenityId,
    String? name,
    String? type,
    String? iconImagePath,
  });

  Future<Result<void>> deleteAmenity({required String amenityId});

  // ── Rooms ──────────────────────────────────────────────────────────────────

  Future<Result<List<Room>>> getAllRooms({required String hotelId});

  Future<Result<Room>> getRoom({required String id});

  Future<Result<void>> createRoom({
    required String hotelId,
    required String roomName,
    required String roomType,
    required double pricePerNight,
    required int capacity,
    required int maxAdults,
    required int maxChildren,
    required String status,
  });

  Future<Result<void>> updateRoom({
    required String id,
    required String roomNumber,
    required String roomType,
    required double pricePerNight,
    required int capacity,
    required int maxAdults,
    required int maxChildren,
    required String status,
  });

  Future<Result<void>> deleteRoom({required String id});

  // ── Tours ──────────────────────────────────────────────────────────────────

  Future<Result<List<BusinessTour>>> getAllTours();

  Future<Result<BusinessTour>> getTour({required String id});

  Future<Result<TourSummary>> getTourSummaryStats();

  // ── Tour Templates ─────────────────────────────────────────────

  Future<Result<List<CoordinatorTourTemplate>>> getTourTemplates();

  Future<Result<void>> createTourTemplate({
    required String name,
    required String description,
    required String destinationId,
    String? hotelId,
    required String pickupLocation,
    required double pricePerAdult,
    required double pricePerChild,
    String? refundPolicyId,
    required bool isCustom,
    required List<Map<String, dynamic>> itineraries,
  });

  // ── Refund Policies ─────────────────────────────────────────────────────────

  Future<Result<List<dynamic>>> getAllRefundPolicies({
    int page = 0,
    int size = 20,
    String? sort,
  });

  Future<Result<dynamic>> getRefundPolicyById({required String id});

  Future<Result<void>> createRefundPolicy({
    required String name,
    required String serviceType,
    required List<Map<String, dynamic>> rules,
  });

  Future<Result<void>> updateRefundPolicy({
    required String id,
    required String name,
    required String serviceType,
    required List<Map<String, dynamic>> rules,
  });

  Future<Result<void>> deleteRefundPolicy({required String id});
}
