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

  Future<Result<List<BusinessHotel>>> getAllHotels();

  Future<Result<BusinessHotel>> getHotel({required String id});

  Future<Result<void>> createHotel({
    required String id,
    required String name,
    required String address,
    required String cityProvince,
    required double starRating,
    required String status,
  });

  Future<Result<void>> updateHotel({
    required String id,
    required String name,
    required String address,
    required int starRating,
    required String cityProvince,
    required String status,
  });

  Future<Result<void>> deleteHotel({required String id});

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
}
