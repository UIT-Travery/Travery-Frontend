import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/services/api/model/hotel/hotel_service_response.dart';
import 'package:travery_frontend/data/services/api/model/hotel/room_type_response.dart';
import 'package:travery_frontend/data/services/api/model/hotel/receptionist_room_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// ViewModel for hotel detail screen: loads services, room types and rooms.
class HotelDetailViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  HotelDetailViewModel({required AdminRepository adminRepository})
      : _adminRepository = adminRepository {
    loadServices = Command1<List<HotelServiceResponse>, String>(_loadServices);
    loadRoomTypes = Command1<List<RoomTypeResponse>, String>(_loadRoomTypes);
    loadRooms = Command1<List<ReceptionistRoomResponse>, String>(_loadRooms);
  }

  late final Command1<List<HotelServiceResponse>, String> loadServices;
  late final Command1<List<RoomTypeResponse>, String> loadRoomTypes;
  late final Command1<List<ReceptionistRoomResponse>, String> loadRooms;

  Future<Result<List<HotelServiceResponse>>> _loadServices(String hotelId) async {
    final result = await _adminRepository.getHotelServices(hotelId: hotelId);
    switch (result) {
      case Ok<List<dynamic>>():
        final list = result.value
            .map((e) => HotelServiceResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return Result.ok(list);
      case Error<List<dynamic>>():
        return Result.error(result.error);
    }
  }

  Future<Result<List<RoomTypeResponse>>> _loadRoomTypes(String hotelId) async {
    final result = await _adminRepository.getHotelRoomTypes(hotelId: hotelId);
    switch (result) {
      case Ok<List<dynamic>>():
        final list = result.value
            .map((e) => RoomTypeResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return Result.ok(list);
      case Error<List<dynamic>>():
        return Result.error(result.error);
    }
  }

  Future<Result<List<ReceptionistRoomResponse>>> _loadRooms(String hotelId) async {
    final result = await _adminRepository.getHotelRooms(hotelId: hotelId);
    switch (result) {
      case Ok<List<dynamic>>():
        final list = result.value
            .map((e) => ReceptionistRoomResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return Result.ok(list);
      case Error<List<dynamic>>():
        return Result.error(result.error);
    }
  }
}
