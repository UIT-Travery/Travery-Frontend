import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/domain/models/admin/business_hotel/business_hotel.dart';
import 'package:travery_frontend/data/services/api/model/hotel/room_type_response.dart';
import 'package:travery_frontend/data/services/api/model/hotel/hotel_image_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class ImageManagementViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;
  String _currentHotelId = '';

  ImageManagementViewModel({required AdminRepository adminRepository})
      : _adminRepository = adminRepository {
    loadData = Command1<void, String>(_loadData);
    uploadHotelImages = Command1<void, List<String>>(_uploadHotelImages);
    setHotelThumbnail = Command1<void, String>(_setHotelThumbnail);
    deleteHotelImage = Command1<void, String>(_deleteHotelImage);
    uploadRoomTypeImage = Command1<void, ({String roomTypeId, String filePath})>(_uploadRoomTypeImage);
    deleteRoomTypeImage = Command1<void, ({String roomTypeId, String imageId})>(_deleteRoomTypeImage);
  }

  late final Command1<void, String> loadData;
  late final Command1<void, List<String>> uploadHotelImages;
  late final Command1<void, String> setHotelThumbnail;
  late final Command1<void, String> deleteHotelImage;
  late final Command1<void, ({String roomTypeId, String filePath})> uploadRoomTypeImage;
  late final Command1<void, ({String roomTypeId, String imageId})> deleteRoomTypeImage;

  List<HotelImageResponse> hotelImages = [];
  List<RoomTypeResponse> roomTypes = [];

  Future<Result<void>> _loadData(String hotelId) async {
    _currentHotelId = hotelId;
    final hotelResult = await _adminRepository.getHotel(id: hotelId);
    if (hotelResult is Error<BusinessHotel>) {
      return Result.error(hotelResult.error);
    }
    final hotel = (hotelResult as Ok<BusinessHotel>).value;
    hotelImages = hotel.images
        .map((e) => HotelImageResponse.fromJson(e as Map<String, dynamic>))
        .toList();

    final rtResult = await _adminRepository.getHotelRoomTypes(hotelId: hotelId);
    if (rtResult is Error<List<dynamic>>) {
      return Result.error(rtResult.error);
    }
    roomTypes = (rtResult as Ok<List<dynamic>>).value
        .map((e) => RoomTypeResponse.fromJson(e as Map<String, dynamic>))
        .toList();

    notifyListeners();
    return const Result.ok(null);
  }

  Future<Result<void>> _uploadHotelImages(List<String> filePaths) async {
    final result = await _adminRepository.uploadHotelImages(
        hotelId: _currentHotelId, filePaths: filePaths);
    if (result is Ok) {
      await loadData.execute(_currentHotelId);
      return const Result.ok(null);
    }
    return Result.error((result as Error<List<dynamic>>).error);
  }

  Future<Result<void>> _setHotelThumbnail(String imageId) async {
    final result = await _adminRepository.setHotelThumbnail(
        hotelId: _currentHotelId, imageId: imageId);
    if (result is Ok) {
      await loadData.execute(_currentHotelId);
      return const Result.ok(null);
    }
    return Result.error((result as Error<void>).error);
  }

  Future<Result<void>> _deleteHotelImage(String imageId) async {
    final result = await _adminRepository.deleteHotelImage(
        hotelId: _currentHotelId, imageId: imageId);
    if (result is Ok) {
      await loadData.execute(_currentHotelId);
      return const Result.ok(null);
    }
    return Result.error((result as Error<void>).error);
  }

  Future<Result<void>> _uploadRoomTypeImage(
      ({String roomTypeId, String filePath}) payload) async {
    final result = await _adminRepository.uploadRoomTypeImages(
        roomTypeId: payload.roomTypeId, filePaths: [payload.filePath]);
    if (result is Ok) {
      await loadData.execute(_currentHotelId);
      return const Result.ok(null);
    }
    return Result.error((result as Error<List<dynamic>>).error);
  }

  Future<Result<void>> _deleteRoomTypeImage(
      ({String roomTypeId, String imageId}) payload) async {
    final result = await _adminRepository.deleteRoomTypeImage(
        roomTypeId: payload.roomTypeId, imageId: payload.imageId);
    if (result is Ok) {
      await loadData.execute(_currentHotelId);
      return const Result.ok(null);
    }
    return Result.error((result as Error<void>).error);
  }
}
