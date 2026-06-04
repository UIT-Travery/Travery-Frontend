import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/seed_models/room/room.dart';
import 'package:travery_frontend/data/services/api/admin_api_service.dart';
import 'package:travery_frontend/data/services/api/model/coach_response.dart';
import 'package:travery_frontend/data/services/token_refresh_service.dart';
import 'package:travery_frontend/domain/models/admin/business_account/business_account.dart';
import 'package:travery_frontend/domain/models/admin/business_coach/business_coach.dart';
import 'package:travery_frontend/domain/models/admin/business_dashboard/business_dashboard.dart';
import 'package:travery_frontend/domain/models/admin/business_hotel/business_hotel.dart';
import 'package:travery_frontend/domain/models/admin/business_tour/business_tour.dart';
import 'package:travery_frontend/domain/models/admin/tour_summary/tour_summary.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour_template/coordinator_tour_template.dart';
import 'package:travery_frontend/domain/models/admin/business_coach_seat/business_coach_seat.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// Remote implementation of [AdminRepository] that calls the real backend API.
///
/// Methods backed by real endpoints delegate to [AdminApiService].
/// Methods whose endpoints are not yet available (hotel, vehicle, dashboard)
/// return a [Result.error] so the UI can handle them gracefully.
import 'dart:convert';
import 'dart:io';

class AdminRepositoryRemote extends AdminRepository {
  AdminRepositoryRemote({
    required AdminApiService adminApiService,
    required TokenRefreshService tokenRefreshService,
  }) : _adminApiService = adminApiService,
       _tokenRefreshService = tokenRefreshService;

  final AdminApiService _adminApiService;
  final TokenRefreshService _tokenRefreshService;

  // ── Helper ─────────────────────────────────────────────────────────────────

  Future<String?> _getAccessToken() async {
    final result = await _tokenRefreshService.getValidAccessToken();
    return result is Ok ? (result as Ok<String>).value : null;
  }

  static final _notImplemented = Exception('API endpoint not yet available');

  // ── Dashboard ──────────────────────────────────────────────────────────────

  @override
  Future<Result<BusinessDashboard>> getDashboardStats() async {
    return Result.error(_notImplemented);
  }

  @override
  Future<Result<List<double>>> getRevenueByMonth({
    required int month,
    required int year,
  }) async {
    return Result.error(_notImplemented);
  }

  // ── Accounts ───────────────────────────────────────────────────────────────

  @override
  Future<Result<void>> createAccount({
    required String name,
    required String email,
    required String password,
    required String role,
    required bool isActive,
    String? guideLicense,
    String? hotelId,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final apiRole = _mapRoleToApi(role);

    final result = await _adminApiService.createStaff(
      accessToken: token,
      email: email,
      password: password,
      fullName: name,
      role: apiRole,
      guideLicense: guideLicense,
      hotelId: hotelId,
    );

    switch (result) {
      case Ok<void>():
        notifyListeners();
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }

  String _mapRoleToApi(String role) {
    switch (role.toLowerCase()) {
      case 'coordinator':
        return 'COORDINATOR';
      case 'receptionist':
        return 'RECEPTIONIST';
      default:
        return 'GUIDE';
    }
  }

  @override
  Future<Result<List<BusinessAccount>>> getAllAccounts() async {
    return const Result.ok([]);
  }

  @override
  Future<Result<BusinessAccount>> getAccount({required String id}) async {
    return Result.error(_notImplemented);
  }

  @override
  Future<Result<void>> updateAccount({
    required String id,
    required String name,
    required String email,
    required String employeeId,
    required String role,
    required bool isActive,
  }) async {
    return Result.error(_notImplemented);
  }

  @override
  Future<Result<void>> deleteAccount({required String id}) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.deleteUser(
      accessToken: token,
      id: id,
    );
    switch (result) {
      case Ok<void>():
        notifyListeners();
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }

  // ── Helper: map raw user data to BusinessAccount ────────────────────────────

  BusinessAccount _mapUser(Map<String, dynamic> map) {
    return BusinessAccount(
      id: map['id'] as String? ?? '',
      name: map['fullName'] as String? ?? '',
      email: map['email'] as String? ?? '',
      role: BusinessAccount.roleFromApi(map['role'] as String?),
      status: BusinessAccount.statusFromApi(map['status'] as String?),
      avatarUrl: map['avatarUrl'] as String?,
      phoneNumber: map['phoneNumber'] as String?,
      createdAt: map['createdAt'] as String?,
    );
  }

  // ── Admin User Controller ──────────────────────────────────────────────────

  @override
  Future<Result<Map<String, dynamic>>> getUsers({
    String? role,
    String? status,
    int page = 0,
    int size = 20,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.getUsers(
      accessToken: token,
      role: role,
      status: status,
      page: page,
      size: size,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        return Result.ok(result.value);
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<BusinessAccount>> getUserById({required String id}) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.getUserById(
      accessToken: token,
      id: id,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        return Result.ok(_mapUser(result.value));
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<BusinessAccount>> banUser({required String id}) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.banUser(accessToken: token, id: id);
    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        return Result.ok(_mapUser(result.value));
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<BusinessAccount>> unbanUser({required String id}) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.unbanUser(accessToken: token, id: id);
    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        return Result.ok(_mapUser(result.value));
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<BusinessAccount>> updateReceptionistProfile({
    required String id,
    String? fullName,
    String? phoneNumber,
    String? shiftType,
    String? hotelId,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.updateReceptionistProfile(
      accessToken: token,
      id: id,
      fullName: fullName,
      phoneNumber: phoneNumber,
      shiftType: shiftType,
      hotelId: hotelId,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        return Result.ok(_mapUser(result.value));
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<BusinessAccount>> updateGuideProfile({
    required String id,
    String? fullName,
    String? phoneNumber,
    String? guideLicense,
    int? yearsExperience,
    List<String>? languages,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.updateGuideProfile(
      accessToken: token,
      id: id,
      fullName: fullName,
      phoneNumber: phoneNumber,
      guideLicense: guideLicense,
      yearsExperience: yearsExperience,
      languages: languages,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        return Result.ok(_mapUser(result.value));
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<BusinessAccount>> updateCoordinatorProfile({
    required String id,
    String? fullName,
    String? phoneNumber,
    String? department,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.updateCoordinatorProfile(
      accessToken: token,
      id: id,
      fullName: fullName,
      phoneNumber: phoneNumber,
      department: department,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        return Result.ok(_mapUser(result.value));
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<BusinessAccount>> updateUserAvatar({
    required String id,
    required String filePath,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.updateUserAvatar(
      accessToken: token,
      id: id,
      filePath: filePath,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        return Result.ok(_mapUser(result.value));
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  // ── Seat Layouts ──────────────────────────────────────────────────────────

  @override
  Future<Result<String>> createSeatLayout({
    required String name,
    required String coachType,
    required List<dynamic> items,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final serializedItems = items.map((e) {
      if (e is Map<String, dynamic>) return e;
      return {
        'seatName': (e as dynamic).seatName,
        'tier': ((e as dynamic).tier.toString().contains('upper'))
            ? 'UPPER'
            : 'LOWER',
        'position': ((e as dynamic).position.toString().contains('front'))
            ? 'FRONT'
            : ((e as dynamic).position.toString().contains('middle')
                  ? 'MIDDLE'
                  : 'BACK'),
        'rowNumber': (e as dynamic).rowNumber,
        'columnNumber': (e as dynamic).columnNumber,
      };
    }).toList();

    final requestMap = {
      'name': name,
      'coachType': coachType,
      'items': serializedItems,
    };

    final result = await _adminApiService.createSeatLayout(
      accessToken: token,
      bodyMap: requestMap,
    );

    switch (result) {
      case Ok<Map<String, dynamic>>():
        final id = result.value['id'] as String?;
        return Result.ok(id ?? '');
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  // ── Vehicles ───────────────────────────────────────────────────────────────

  @override
  Future<Result<List<BusinessCoach>>> getAllVehicles() async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.getCoaches(accessToken: token);

    switch (result) {
      case Ok<List<dynamic>>():
        final coaches = result.value.map((e) {
          final coach = CoachResponse.fromJson(e as Map<String, dynamic>);
          return BusinessCoach(
            id: coach.id,
            plateNumber: coach.licensePlate,
            coachType: coach.coachType,
            seatCount: coach.capacity,
            status: coach.status,
          );
        }).toList();
        return Result.ok(coaches);
      case Error<List<dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<BusinessCoach>> getVehicle({required String id}) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.getCoachDetail(
      accessToken: token,
      id: id,
    );

    switch (result) {
      case Ok<Map<String, dynamic>>():
        final map = result.value;
        final coach = CoachResponse.fromJson(map);

        List<BusinessCoachSeat>? seats;
        List<dynamic>? items;
        String? layoutId;

        if (map['seatLayout'] != null && map['seatLayout']['items'] != null) {
          items = map['seatLayout']['items'] as List<dynamic>;
        } else {
          try {
            File(
              'C:\\Users\\5560\\AppData\\Local\\Temp\\travery_log.txt',
            ).writeAsStringSync(jsonEncode(map));
          } catch (_) {}

          if (map['seatLayoutId'] != null) {
            layoutId = map['seatLayoutId'] as String;
          } else if (map['seatLayout'] != null &&
              map['seatLayout']['id'] != null) {
            layoutId = map['seatLayout']['id'] as String;
          }

          if (layoutId != null) {
            final layoutResult = await _adminApiService.getSeatLayoutDetail(
              accessToken: token,
              id: layoutId,
            );
            if (layoutResult is Ok<Map<String, dynamic>>) {
              final layoutMap = layoutResult.value;
              if (layoutMap['items'] != null) {
                items = layoutMap['items'] as List<dynamic>;
              }
            }
          } else {
            // Fallback: try to find the layout by seatLayoutName
            final layoutName = map['seatLayoutName'] as String?;
            if (layoutName != null && layoutName.isNotEmpty) {
              final layoutsResult = await _adminApiService.getSeatLayouts(
                accessToken: token,
              );
              if (layoutsResult is Ok<dynamic>) {
                final layoutsData = layoutsResult.value;
                List<dynamic>? allLayouts;
                if (layoutsData is List) {
                  allLayouts = layoutsData;
                } else if (layoutsData is Map &&
                    layoutsData['content'] != null) {
                  allLayouts = layoutsData['content'] as List<dynamic>;
                }

                if (allLayouts != null) {
                  final matchedLayout = allLayouts
                      .cast<Map<String, dynamic>>()
                      .firstWhere(
                        (l) =>
                            l['name'] == layoutName ||
                            l['seatLayoutName'] == layoutName,
                        orElse: () => <String, dynamic>{},
                      );

                  final matchedId = matchedLayout['id'] as String?;
                  if (matchedId != null) {
                    layoutId = matchedId;
                    final layoutDetailResult = await _adminApiService
                        .getSeatLayoutDetail(accessToken: token, id: matchedId);
                    if (layoutDetailResult is Ok<Map<String, dynamic>>) {
                      final layoutMap = layoutDetailResult.value;
                      if (layoutMap['items'] != null) {
                        items = layoutMap['items'] as List<dynamic>;
                      }
                    }
                  }
                }
              }
            }
          }
        }

        if (items != null) {
          seats = items.map((e) {
            final itemMap = e as Map<String, dynamic>;
            return BusinessCoachSeat(
              seatName: itemMap['seatName'] as String? ?? '',
              price: '0',
              tier: (itemMap['tier'] == 'UPPER')
                  ? CoachSeatTier.upper
                  : CoachSeatTier.lower,
              position: (itemMap['position'] == 'FRONT')
                  ? CoachSeatPosition.front
                  : (itemMap['position'] == 'MIDDLE')
                  ? CoachSeatPosition.middle
                  : CoachSeatPosition.back,
              rowNumber: itemMap['rowNumber'] as int? ?? 0,
              columnNumber: itemMap['columnNumber'] as int? ?? 0,
            );
          }).toList();
        }

        return Result.ok(
          BusinessCoach(
            id: coach.id,
            plateNumber: coach.licensePlate,
            coachType: coach.coachType,
            seatCount: coach.capacity,
            status: coach.status,
            seats: seats,
            seatLayoutId: layoutId,
          ),
        );
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> createVehicle({
    required String registrationNumber,
    required String type,
    required String seatLayoutId,
    required int seatCount,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final requestMap = {
      'coachType': type,
      'licensePlate': registrationNumber,
      'seatLayoutId': seatLayoutId,
      'capacity': seatCount,
    };

    final result = await _adminApiService.createCoach(
      accessToken: token,
      bodyMap: requestMap,
    );

    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        return const Result.ok(null);
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> updateVehicle({
    required String id,
    required String registrationNumber,
    required String type,
    required String seatLayoutId,
    required int seatCount,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.updateCoach(
      accessToken: token,
      id: id,
      bodyMap: {
        'licensePlate': registrationNumber,
        'coachType': type,
        'seatLayoutId': seatLayoutId,
        'capacity': seatCount,
      },
    );

    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        return const Result.ok(null);
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> deleteVehicle({required String id}) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.deleteCoach(
      accessToken: token,
      id: id,
    );

    switch (result) {
      case Ok<void>():
        notifyListeners();
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }

  // ── Hotels ─────────────────────────────────────────────────────────────────

  @override
  Future<Result<List<BusinessHotel>>> getAllHotels({
    int page = 0,
    int size = 20,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.adminGetAllHotels(
      accessToken: token,
      page: page,
      size: size,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        final content = result.value['content'] as List<dynamic>? ?? [];
        final hotels = content.map((e) {
          final map = e as Map<String, dynamic>;
          return BusinessHotel(
            id: map['id'] as String? ?? '',
            name: map['name'] as String? ?? '',
            address: map['address'] as String? ?? '',
            cityProvince: map['cityProvince'] as String? ?? '',
            starRating: (map['averageRating'] as num?)?.toDouble() ?? 0.0,
            imageUrl: map['thumbnailUrl'] as String?,
          );
        }).toList();
        return Result.ok(hotels);
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<BusinessHotel>> getHotel({required String id}) async {
    return Result.error(_notImplemented);
  }

  @override
  Future<Result<String>> createHotel({
    required String name,
    String? description,
    required String address,
    required String cityProvince,
    required String checkInTime,
    required String checkOutTime,
    List<String> amenityIds = const [],
    required String refundPolicyId,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final body = <String, dynamic>{
      'name': name,
      'address': address,
      'cityProvince': cityProvince,
      'checkInTime': checkInTime.length == 5 ? '$checkInTime:00' : checkInTime,
      'checkOutTime': checkOutTime.length == 5 ? '$checkOutTime:00' : checkOutTime,
      'amenityIds': amenityIds,
      'refundPolicyId': refundPolicyId,
      if (description != null) 'description': description,
    };

    final result = await _adminApiService.adminCreateHotel(
      accessToken: token,
      body: body,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        final id = result.value['id'] as String? ?? '';
        return Result.ok(id);
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
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
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final body = <String, dynamic>{};
    if (name != null) body['name'] = name;
    if (description != null) body['description'] = description;
    if (address != null) body['address'] = address;
    if (cityProvince != null) body['cityProvince'] = cityProvince;
    if (checkInTime != null) {
      body['checkInTime'] = checkInTime.length == 5 ? '$checkInTime:00' : checkInTime;
    }
    if (checkOutTime != null) {
      body['checkOutTime'] = checkOutTime.length == 5 ? '$checkOutTime:00' : checkOutTime;
    }
    if (amenityIds != null) body['amenityIds'] = amenityIds;
    if (refundPolicyId != null) body['refundPolicyId'] = refundPolicyId;

    final result = await _adminApiService.adminUpdateHotel(
      accessToken: token,
      hotelId: hotelId,
      body: body,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        return const Result.ok(null);
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> deleteHotel({required String id}) async {
    return Result.error(_notImplemented);
  }

  @override
  Future<Result<List<dynamic>>> uploadHotelImages({
    required String hotelId,
    required List<String> filePaths,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.adminUploadHotelImages(
      accessToken: token,
      hotelId: hotelId,
      filePaths: filePaths,
    );
    switch (result) {
      case Ok<List<dynamic>>():
        notifyListeners();
        return Result.ok(result.value);
      case Error<List<dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> deleteHotelImage({
    required String hotelId,
    required String imageId,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.adminDeleteHotelImage(
      accessToken: token,
      hotelId: hotelId,
      imageId: imageId,
    );
    switch (result) {
      case Ok<void>():
        notifyListeners();
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> setHotelThumbnail({
    required String hotelId,
    required String imageId,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.adminSetHotelThumbnail(
      accessToken: token,
      hotelId: hotelId,
      imageId: imageId,
    );
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<List<dynamic>>> getHotelServices({
    required String hotelId,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.adminGetHotelServices(
      accessToken: token,
      hotelId: hotelId,
    );
    switch (result) {
      case Ok<List<dynamic>>():
        return Result.ok(result.value);
      case Error<List<dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> createHotelService({
    required String hotelId,
    required String name,
    required String category,
    required double price,
    required String unit,
    String? description,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final body = <String, dynamic>{
      'name': name,
      'category': category,
      'price': price,
      'unit': unit,
      if (description != null) 'description': description,
    };

    final result = await _adminApiService.adminCreateHotelService(
      accessToken: token,
      hotelId: hotelId,
      body: body,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        return const Result.ok(null);
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<List<dynamic>>> getHotelRoomTypes({
    required String hotelId,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.adminGetRoomTypes(
      accessToken: token,
      hotelId: hotelId,
    );
    switch (result) {
      case Ok<List<dynamic>>():
        return Result.ok(result.value);
      case Error<List<dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<String>> createHotelRoomType({
    required String hotelId,
    required String name,
    String? description,
    int? capacityAdults,
    int? capacityChildren,
    required double basePrice,
    required String bedType,
    int? area,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final body = <String, dynamic>{
      'name': name,
      'basePrice': basePrice,
      'bedType': bedType,
      if (description != null) 'description': description,
      if (capacityAdults != null) 'capacityAdults': capacityAdults,
      if (capacityChildren != null) 'capacityChildren': capacityChildren,
      if (area != null) 'area': area,
    };

    final result = await _adminApiService.adminCreateRoomType(
      accessToken: token,
      hotelId: hotelId,
      body: body,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        final id = result.value['id'] as String? ?? '';
        return Result.ok(id);
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> updateHotelRoomType({
    required String roomTypeId,
    String? name,
    String? description,
    int? capacityAdults,
    int? capacityChildren,
    double? basePrice,
    String? bedType,
    int? area,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final body = <String, dynamic>{
      if (name != null) 'name': name,
      if (basePrice != null) 'basePrice': basePrice,
      if (bedType != null) 'bedType': bedType,
      if (description != null) 'description': description,
      if (capacityAdults != null) 'capacityAdults': capacityAdults,
      if (capacityChildren != null) 'capacityChildren': capacityChildren,
      if (area != null) 'area': area,
    };

    final result = await _adminApiService.adminUpdateRoomType(
      accessToken: token,
      roomTypeId: roomTypeId,
      body: body,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        return const Result.ok(null);
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> deleteHotelRoomType({required String roomTypeId}) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.adminDeleteRoomType(
      accessToken: token,
      roomTypeId: roomTypeId,
    );
    switch (result) {
      case Ok<void>():
        notifyListeners();
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<List<dynamic>>> getHotelRooms({required String hotelId}) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.adminGetRooms(
      accessToken: token,
      hotelId: hotelId,
    );
    switch (result) {
      case Ok<List<dynamic>>():
        return Result.ok(result.value);
      case Error<List<dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> createHotelRoom({
    required String hotelId,
    required String roomNumber,
    required int floor,
    required String roomTypeId,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final body = <String, dynamic>{
      'roomNumber': roomNumber,
      'floor': floor,
      'roomTypeId': roomTypeId,
    };

    final result = await _adminApiService.adminCreateRoom(
      accessToken: token,
      hotelId: hotelId,
      body: body,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        return const Result.ok(null);
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  // ── Amenities ──────────────────────────────────────────────────────────────

  @override
  Future<Result<List<dynamic>>> getAllAmenities() async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.adminGetAllAmenities(
      accessToken: token,
    );
    switch (result) {
      case Ok<List<dynamic>>():
        return Result.ok(result.value);
      case Error<List<dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> createAmenity({
    required String name,
    required String type,
    String? iconImagePath,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.adminCreateAmenity(
      accessToken: token,
      name: name,
      type: type,
      iconImagePath: iconImagePath,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        return const Result.ok(null);
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> updateAmenity({
    required String amenityId,
    String? name,
    String? type,
    String? iconImagePath,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.adminUpdateAmenity(
      accessToken: token,
      amenityId: amenityId,
      name: name,
      type: type,
      iconImagePath: iconImagePath,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        return const Result.ok(null);
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> deleteAmenity({required String amenityId}) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.adminDeleteAmenity(
      accessToken: token,
      amenityId: amenityId,
    );
    switch (result) {
      case Ok<void>():
        notifyListeners();
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }

  // ── Rooms ──────────────────────────────────────────────────────────────────

  @override
  Future<Result<List<Room>>> getAllRooms({required String hotelId}) async {
    return const Result.ok([]);
  }

  @override
  Future<Result<Room>> getRoom({required String id}) async {
    return Result.error(_notImplemented);
  }

  @override
  Future<Result<void>> createRoom({
    required String hotelId,
    required String roomName,
    required String roomType,
    required double pricePerNight,
    required int capacity,
    required int maxAdults,
    required int maxChildren,
    required String status,
  }) async {
    return Result.error(_notImplemented);
  }

  @override
  Future<Result<void>> updateRoom({
    required String id,
    required String roomNumber,
    required String roomType,
    required double pricePerNight,
    required int capacity,
    required int maxAdults,
    required int maxChildren,
    required String status,
  }) async {
    return Result.error(_notImplemented);
  }

  @override
  Future<Result<void>> deleteRoom({required String id}) async {
    return Result.error(_notImplemented);
  }

  // ── Tours ──────────────────────────────────────────────────────────────────

  @override
  Future<Result<List<BusinessTour>>> getAllTours() async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.getTours(accessToken: token);
    switch (result) {
      case Ok<List<Map<String, dynamic>>>():
        final tours = result.value.asMap().entries.map((entry) {
          final i = entry.key;
          final map = entry.value;
          return BusinessTour(
            id: map['id'] as String? ?? '',
            rank: i + 1,
            tourName: map['name'] as String? ?? '',
            category: map['destinationName'] as String? ?? '',
            trend: TourTrend.stable,
            imageUrl: map['thumbnailUrl'] as String?,
          );
        }).toList();
        notifyListeners();
        return Result.ok(tours);
      case Error<List<Map<String, dynamic>>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<BusinessTour>> getTour({required String id}) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.getTourById(
      accessToken: token,
      id: id,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        final map = result.value;
        return Result.ok(
          BusinessTour(
            id: map['id'] as String? ?? '',
            rank: 0,
            tourName: map['name'] as String? ?? '',
            category:
                (map['destination'] as Map<String, dynamic>?)?['name']
                    as String? ??
                '',
            trend: TourTrend.stable,
          ),
        );
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<TourSummary>> getTourSummaryStats() async {
    return Result.error(_notImplemented);
  }

  // ── Tour Templates ─────────────────────────────────────────────

  @override
  Future<Result<List<CoordinatorTourTemplate>>> getTourTemplates() async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.getTourTemplates(accessToken: token);
    switch (result) {
      case Ok<List<Map<String, dynamic>>>():
        final templates = result.value.map((map) {
          return CoordinatorTourTemplate(
            id: map['id'] as String? ?? '',
            name: map['name'] as String? ?? '',
            imageUrl: '',
            thumbnailUrl: '',
            images: [],
            description: map['description'] as String? ?? '',
            adultPrice: (map['pricePerAdult'] ?? 0).toString(),
            childPrice: (map['pricePerChild'] ?? 0).toString(),
            startTime: '',
            endTime: '',
            minTotalPerson: 0,
            maxTotalPerson: 0,
            startLocation: map['startLocation'] as String? ?? '',
            destination:
                (map['destination'] as Map<String, dynamic>?)?['name']
                    as String? ??
                '',
            itineraries: [],
          );
        }).toList();
        notifyListeners();
        return Result.ok(templates);
      case Error<List<Map<String, dynamic>>>():
        return Result.error(result.error);
    }
  }

  @override
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
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.createTourTemplate(
      accessToken: token,
      name: name,
      description: description,
      destinationId: destinationId,
      hotelId: hotelId,
      pickupLocation: pickupLocation,
      pricePerAdult: pricePerAdult,
      pricePerChild: pricePerChild,
      refundPolicyId: refundPolicyId,
      isCustom: isCustom,
      itineraries: itineraries,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        return const Result.ok(null);
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  // ── Refund Policies ─────────────────────────────────────────────────────────

  @override
  Future<Result<List<dynamic>>> getAllRefundPolicies({
    int page = 0,
    int size = 20,
    String? sort,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.adminGetAllRefundPolicies(
      accessToken: token,
      page: page,
      size: size,
      sort: sort,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        final content = result.value['content'] as List<dynamic>? ?? [];
        return Result.ok(content);
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<dynamic>> getRefundPolicyById({required String id}) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.adminGetRefundPolicyById(
      accessToken: token,
      id: id,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        return Result.ok(result.value);
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> createRefundPolicy({
    required String name,
    required String serviceType,
    required List<Map<String, dynamic>> rules,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final body = {'name': name, 'serviceType': serviceType, 'rules': rules};

    final result = await _adminApiService.adminCreateRefundPolicy(
      accessToken: token,
      body: body,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        return const Result.ok(null);
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> updateRefundPolicy({
    required String id,
    required String name,
    required String serviceType,
    required List<Map<String, dynamic>> rules,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final body = {'name': name, 'serviceType': serviceType, 'rules': rules};

    final result = await _adminApiService.adminUpdateRefundPolicy(
      accessToken: token,
      id: id,
      body: body,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        return const Result.ok(null);
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> deleteRefundPolicy({required String id}) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.adminDeleteRefundPolicy(
      accessToken: token,
      id: id,
    );
    switch (result) {
      case Ok<void>():
        notifyListeners();
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
