import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/services/api/model/hotel/hotel_image_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

typedef UploadImagesPayload = ({
  String hotelId,
  List<String> filePaths,
});

typedef DeleteImagePayload = ({
  String hotelId,
  String imageId,
});

typedef SetThumbnailPayload = ({
  String hotelId,
  String imageId,
});

class HotelImagesViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  HotelImagesViewModel({required AdminRepository adminRepository})
      : _adminRepository = adminRepository {
    uploadImages = Command1<List<HotelImageResponse>, UploadImagesPayload>(_uploadImages);
    deleteImage = Command1<void, DeleteImagePayload>(_deleteImage);
    setThumbnail = Command1<void, SetThumbnailPayload>(_setThumbnail);
  }

  late final Command1<List<HotelImageResponse>, UploadImagesPayload> uploadImages;
  late final Command1<void, DeleteImagePayload> deleteImage;
  late final Command1<void, SetThumbnailPayload> setThumbnail;

  Future<Result<List<HotelImageResponse>>> _uploadImages(UploadImagesPayload payload) async {
    final result = await _adminRepository.uploadHotelImages(
      hotelId: payload.hotelId,
      filePaths: payload.filePaths,
    );
    switch (result) {
      case Ok<List<dynamic>>():
        final list = result.value
            .map((e) => HotelImageResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return Result.ok(list);
      case Error<List<dynamic>>():
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _deleteImage(DeleteImagePayload payload) async {
    final result = await _adminRepository.deleteHotelImage(
      hotelId: payload.hotelId,
      imageId: payload.imageId,
    );
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _setThumbnail(SetThumbnailPayload payload) async {
    final result = await _adminRepository.setHotelThumbnail(
      hotelId: payload.hotelId,
      imageId: payload.imageId,
    );
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
