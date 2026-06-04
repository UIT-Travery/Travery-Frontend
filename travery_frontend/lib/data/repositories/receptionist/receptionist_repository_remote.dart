import 'package:travery_frontend/utils/core_result.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_dashboard_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/available_room_response.dart';
import 'package:travery_frontend/data/repositories/receptionist/receptionist_repository.dart';
import 'package:travery_frontend/data/services/api/receptionist_api_service.dart';
import 'package:travery_frontend/data/services/token_refresh_service.dart';

class ReceptionistRepositoryRemote extends ReceptionistRepository {
  final ReceptionistApiService _apiService;
  final TokenRefreshService _tokenRefreshService;

  ReceptionistRepositoryRemote({
    required ReceptionistApiService apiService,
    required TokenRefreshService tokenRefreshService,
  })  : _apiService = apiService,
        _tokenRefreshService = tokenRefreshService;

  Future<String?> _getAccessToken() async {
    final result = await _tokenRefreshService.getValidAccessToken();
    return result is Ok ? (result as Ok<String>).value : null;
  }

  @override
  Future<Result<RecepDashboardResponse>> getDashboard() async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    return _apiService.getDashboard(accessToken: token);
  }

  @override
  Future<Result<List<AvailableRoomResponse>>> getAvailableRooms(String roomTypeId) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    return _apiService.getAvailableRooms(
      accessToken: token,
      roomTypeId: roomTypeId,
    );
  }
}
