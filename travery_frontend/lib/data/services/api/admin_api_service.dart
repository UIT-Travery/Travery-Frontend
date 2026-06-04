import 'dart:convert';
import 'dart:io';

import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// HTTP service covering all available admin-facing API endpoints.
///
/// Pattern mirrors [CoordinatorApiService]: each method takes an [accessToken]
/// to satisfy the `Authorization: Bearer <token>` requirement.
class AdminApiService {
  AdminApiService({String? host, HttpClient Function()? clientFactory})
    : _host = host ?? AppConfig.baseUrl,
      _clientFactory = clientFactory ?? HttpClient.new;

  final String _host;
  final HttpClient Function() _clientFactory;

  // ── Helpers ────────────────────────────────────────────────────────────────

  Future<String> _extractErrorMessage(
    HttpClientResponse response,
    String defaultMessage,
  ) async {
    try {
      final stringData = await response.transform(utf8.decoder).join();
      final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
      return jsonMap['message'] as String? ?? defaultMessage;
    } catch (_) {
      return defaultMessage;
    }
  }

  HttpClientRequest _addAuth(HttpClientRequest request, String accessToken) {
    request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $accessToken');
    return request;
  }

  // ── Staff / Account ────────────────────────────────────────────────────────

  /// POST /api/v1/auth/create-staff
  ///
  /// Creates a new staff account (GUIDE, COORDINATOR, or RECEPTIONIST).
  /// [role] must be one of: GUIDE, COORDINATOR, RECEPTIONIST (uppercase).
  /// [department] optional; e.g. "TOUR", "HOTEL".
  /// [guideLicense] optional – required when role is GUIDE.
  /// [hotelId] optional – required when role is RECEPTIONIST.
  Future<Result<void>> createStaff({
    required String accessToken,
    required String email,
    required String password,
    required String fullName,
    required String role,
    String? department,
    String? guideLicense,
    String? hotelId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/auth/create-staff');
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;

      final bodyMap = <String, dynamic>{
        'email': email,
        'password': password,
        'fullName': fullName,
        'role': role,
      };
      if (department != null) bodyMap['department'] = department;
      if (guideLicense != null) bodyMap['guideLicense'] = guideLicense;
      if (hotelId != null) bodyMap['hotelId'] = hotelId;

      final body = jsonEncode(bodyMap);
      request.contentLength = utf8.encode(body).length;
      request.write(body);
      final response = await request.close();

      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Result.ok(null);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tạo tài khoản nhân viên',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  // ── Tours ──────────────────────────────────────────────────────────────────

  /// GET /api/v1/tours — paginated tour list.
  Future<Result<List<Map<String, dynamic>>>> getTours({
    required String accessToken,
    String? keyword,
    int page = 0,
    int size = 20,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final queryParams = <String, String>{
        'page': '$page',
        'size': '$size',
      };
      if (keyword != null && keyword.isNotEmpty) {
        queryParams['keyword'] = keyword;
      }

      final uri = Uri.https(_host, '/api/v1/tours', queryParams);
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>;
        final content = data['content'] as List<dynamic>? ?? [];
        return Result.ok(
          content.map((e) => e as Map<String, dynamic>).toList(),
        );
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải danh sách tour',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// GET /api/v1/tours/{id} — tour detail.
  Future<Result<Map<String, dynamic>>> getTourById({
    required String accessToken,
    required String id,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/tours/$id');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải thông tin tour',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  // ── Tours/Templates —————————————————————————————————————————————

  /// GET /api/v1/tours/templates — list all tour templates.
  Future<Result<List<Map<String, dynamic>>>> getTourTemplates({
    required String accessToken,
    int page = 0,
    int size = 50,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/tours/templates', {
        'page': '$page',
        'size': '$size',
      });
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final rawData = jsonMap['data'] as List<dynamic>? ?? [];
        return Result.ok(
          rawData.map((e) => e as Map<String, dynamic>).toList(),
        );
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải danh sách lộ trình',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// POST /api/v1/tours/templates — create a new tour template.
  Future<Result<Map<String, dynamic>>> createTourTemplate({
    required String accessToken,
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
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/tours/templates');
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;

      final bodyMap = <String, dynamic>{
        'name': name,
        'description': description,
        'destinationId': destinationId,
        'pickupLocation': pickupLocation,
        'pricePerAdult': pricePerAdult,
        'pricePerChild': pricePerChild,
        'isCustom': isCustom,
        'itineraries': itineraries,
      };
      if (hotelId != null) bodyMap['hotelId'] = hotelId;
      if (refundPolicyId != null) bodyMap['refundPolicyId'] = refundPolicyId;

      final body = jsonEncode(bodyMap);
      request.contentLength = utf8.encode(body).length;
      request.write(body);
      final response = await request.close();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>? ?? {};
        return Result.ok(data);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tạo lộ trình',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  // ── Account Deletion ────────────────────────────────────────────────────────

  /// DELETE /api/v1/auth/staff/{id}
  Future<Result<void>> deleteAccount({
    required String accessToken,
    required String id,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/auth/staff/$id');
      final request = await client.deleteUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200 || response.statusCode == 204) {
        return const Result.ok(null);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể xóa tài khoản',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  // ── Admin User Controller ───────────────────────────────────────────────────

  /// GET /api/v1/admin/users — list users with optional role/status filters.
  Future<Result<Map<String, dynamic>>> getUsers({
    required String accessToken,
    String? role,
    String? status,
    int page = 0,
    int size = 20,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final queryParams = <String, String>{
        'page': '$page',
        'size': '$size',
      };
      if (role != null && role.isNotEmpty) queryParams['role'] = role;
      if (status != null && status.isNotEmpty) queryParams['status'] = status;

      final uri = Uri.https(_host, '/api/v1/admin/users', queryParams);
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(
          (jsonMap['data'] as Map<String, dynamic>?) ?? {},
        );
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải danh sách người dùng',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// GET /api/v1/admin/users/{id} — user detail.
  Future<Result<Map<String, dynamic>>> getUserById({
    required String accessToken,
    required String id,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/admin/users/$id');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(
          (jsonMap['data'] as Map<String, dynamic>?) ?? {},
        );
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải thông tin người dùng',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// DELETE /api/v1/admin/users/{id} — delete user.
  Future<Result<void>> deleteUser({
    required String accessToken,
    required String id,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/admin/users/$id');
      final request = await client.deleteUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200 || response.statusCode == 204) {
        return const Result.ok(null);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể xóa người dùng',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// PATCH /api/v1/admin/users/{id}/ban — ban a user.
  Future<Result<Map<String, dynamic>>> banUser({
    required String accessToken,
    required String id,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/admin/users/$id/ban');
      final request = await client.patchUrl(uri);
      _addAuth(request, accessToken);
      request.contentLength = 0;
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(
          (jsonMap['data'] as Map<String, dynamic>?) ?? {},
        );
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể cấm người dùng',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// PATCH /api/v1/admin/users/{id}/unban — unban a user.
  Future<Result<Map<String, dynamic>>> unbanUser({
    required String accessToken,
    required String id,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/admin/users/$id/unban');
      final request = await client.patchUrl(uri);
      _addAuth(request, accessToken);
      request.contentLength = 0;
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(
          (jsonMap['data'] as Map<String, dynamic>?) ?? {},
        );
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể bỏ cấm người dùng',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// PATCH /api/v1/admin/users/receptionists/{id} — update receptionist profile.
  Future<Result<Map<String, dynamic>>> updateReceptionistProfile({
    required String accessToken,
    required String id,
    String? fullName,
    String? phoneNumber,
    String? shiftType,
    String? hotelId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/admin/users/receptionists/$id');
      final request = await client.patchUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;

      final bodyMap = <String, dynamic>{};
      if (fullName != null) bodyMap['fullName'] = fullName;
      if (phoneNumber != null) bodyMap['phoneNumber'] = phoneNumber;
      if (shiftType != null) bodyMap['shiftType'] = shiftType;
      if (hotelId != null) bodyMap['hotelId'] = hotelId;

      final body = jsonEncode(bodyMap);
      request.contentLength = utf8.encode(body).length;
      request.write(body);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(
          (jsonMap['data'] as Map<String, dynamic>?) ?? {},
        );
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể cập nhật thông tin lễ tân',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// PATCH /api/v1/admin/users/guides/{id} — update guide profile.
  Future<Result<Map<String, dynamic>>> updateGuideProfile({
    required String accessToken,
    required String id,
    String? fullName,
    String? phoneNumber,
    String? guideLicense,
    int? yearsExperience,
    List<String>? languages,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/admin/users/guides/$id');
      final request = await client.patchUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;

      final bodyMap = <String, dynamic>{};
      if (fullName != null) bodyMap['fullName'] = fullName;
      if (phoneNumber != null) bodyMap['phoneNumber'] = phoneNumber;
      if (guideLicense != null) bodyMap['guideLicense'] = guideLicense;
      if (yearsExperience != null) bodyMap['yearsExperience'] = yearsExperience;
      if (languages != null) bodyMap['languages'] = languages;

      final body = jsonEncode(bodyMap);
      request.contentLength = utf8.encode(body).length;
      request.write(body);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(
          (jsonMap['data'] as Map<String, dynamic>?) ?? {},
        );
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể cập nhật thông tin hướng dẫn viên',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// PATCH /api/v1/admin/users/coordinators/{id} — update coordinator profile.
  Future<Result<Map<String, dynamic>>> updateCoordinatorProfile({
    required String accessToken,
    required String id,
    String? fullName,
    String? phoneNumber,
    String? department,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/admin/users/coordinators/$id');
      final request = await client.patchUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;

      final bodyMap = <String, dynamic>{};
      if (fullName != null) bodyMap['fullName'] = fullName;
      if (phoneNumber != null) bodyMap['phoneNumber'] = phoneNumber;
      if (department != null) bodyMap['department'] = department;

      final body = jsonEncode(bodyMap);
      request.contentLength = utf8.encode(body).length;
      request.write(body);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(
          (jsonMap['data'] as Map<String, dynamic>?) ?? {},
        );
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể cập nhật thông tin điều phối viên',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// PUT /api/v1/admin/users/{id}/avatar — update user avatar (multipart).
  Future<Result<Map<String, dynamic>>> updateUserAvatar({
    required String accessToken,
    required String id,
    required String filePath,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final file = File(filePath);
      if (!file.existsSync()) {
        return Result.error(Exception('File not found: $filePath'));
      }

      final boundary = 'TraveryBoundary${DateTime.now().millisecondsSinceEpoch}';
      final uri = Uri.https(_host, '/api/v1/admin/users/$id/avatar');
      final request = await client.putUrl(uri);
      _addAuth(request, accessToken);
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        'multipart/form-data; boundary=$boundary',
      );

      final fileBytes = await file.readAsBytes();
      final fileName = file.uri.pathSegments.last;
      final body = StringBuffer()
        ..write('--$boundary\r\n')
        ..write('Content-Disposition: form-data; name="file"; filename="$fileName"\r\n')
        ..write('Content-Type: application/octet-stream\r\n\r\n');
      final bodyBytes = [
        ...utf8.encode(body.toString()),
        ...fileBytes,
        ...utf8.encode('\r\n--$boundary--\r\n'),
      ];
      request.contentLength = bodyBytes.length;
      request.add(bodyBytes);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(
          (jsonMap['data'] as Map<String, dynamic>?) ?? {},
        );
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể cập nhật ảnh đại diện',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }
  // ── Seat Layouts ──────────────────────────────────────────────────────────

  Future<Result<dynamic>> getSeatLayouts({
    required String accessToken,
    String? coachType,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final queryParams = <String, String>{};
      if (coachType != null && coachType.isNotEmpty) {
        queryParams['coachType'] = coachType;
      }
      final uri = Uri.https(_host, '/api/v1/admin/seat-layouts', queryParams);
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data']);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải danh sách sơ đồ ghế',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<Map<String, dynamic>>> createSeatLayout({
    required String accessToken,
    required Map<String, dynamic> bodyMap,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/admin/seat-layouts');
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;

      final body = jsonEncode(bodyMap);
      request.contentLength = utf8.encode(body).length;
      request.write(body);
      final response = await request.close();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tạo sơ đồ ghế',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<Map<String, dynamic>>> getSeatLayoutDetail({
    required String accessToken,
    required String id,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/admin/seat-layouts/$id');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải chi tiết sơ đồ ghế',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  // ── Coaches ───────────────────────────────────────────────────────────────

  Future<Result<List<dynamic>>> getCoaches({
    required String accessToken,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/admin/coaches');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as List<dynamic>? ?? []);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải danh sách phương tiện',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<Map<String, dynamic>>> createCoach({
    required String accessToken,
    required Map<String, dynamic> bodyMap,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/admin/coaches');
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;

      final body = jsonEncode(bodyMap);
      request.contentLength = utf8.encode(body).length;
      request.write(body);
      final response = await request.close();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể thêm phương tiện',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<Map<String, dynamic>>> updateCoach({
    required String accessToken,
    required String id,
    required Map<String, dynamic> bodyMap,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/admin/coaches/$id');
      final request = await client.putUrl(uri); // Assuming PUT is used
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;

      final body = jsonEncode(bodyMap);
      request.contentLength = utf8.encode(body).length;
      request.write(body);
      final response = await request.close();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể cập nhật phương tiện',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<Map<String, dynamic>>> getCoachDetail({
    required String accessToken,
    required String id,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/admin/coaches/$id');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải chi tiết phương tiện',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<void>> deleteCoach({
    required String accessToken,
    required String id,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/admin/coaches/$id');
      final request = await client.deleteUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200 || response.statusCode == 204) {
        return const Result.ok(null);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể xóa phương tiện',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  // ── Admin Hotel Controller ────────────────────────────────────────────────

  /// GET /api/v1/admin/hotels?page=&size=
  Future<Result<Map<String, dynamic>>> adminGetAllHotels({
    required String accessToken,
    int page = 0,
    int size = 20,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/hotels', {
        'page': '$page',
        'size': '$size',
      });
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể tải danh sách khách sạn');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// POST /api/v1/admin/hotels
  Future<Result<Map<String, dynamic>>> adminCreateHotel({
    required String accessToken,
    required Map<String, dynamic> body,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/hotels');
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;
      final encoded = jsonEncode(body);
      request.contentLength = utf8.encode(encoded).length;
      request.write(encoded);
      final response = await request.close();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể tạo khách sạn');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// GET /api/v1/hotels/{hotelId}
  Future<Result<Map<String, dynamic>>> adminGetHotelById({
    required String accessToken,
    required String hotelId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/hotels/$hotelId');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể tải thông tin khách sạn');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// PATCH /api/v1/admin/hotels/{hotelId}
  Future<Result<Map<String, dynamic>>> adminUpdateHotel({
    required String accessToken,
    required String hotelId,
    required Map<String, dynamic> body,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/hotels/$hotelId');
      final request = await client.patchUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;
      final encoded = jsonEncode(body);
      request.contentLength = utf8.encode(encoded).length;
      request.write(encoded);
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể cập nhật khách sạn');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// POST /api/v1/admin/hotels/{hotelId}/images  (multipart)
  Future<Result<List<dynamic>>> adminUploadHotelImages({
    required String accessToken,
    required String hotelId,
    required List<String> filePaths,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final boundary = 'TraveryBoundary${DateTime.now().millisecondsSinceEpoch}';
      final uri = Uri.https(_host, '/api/v1/admin/hotels/$hotelId/images');
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      request.headers.set(HttpHeaders.contentTypeHeader, 'multipart/form-data; boundary=$boundary');

      final bodyBytes = <int>[];
      for (final path in filePaths) {
        final file = File(path);
        if (!file.existsSync()) continue;
        final fileBytes = await file.readAsBytes();
        final fileName = file.uri.pathSegments.last;
        bodyBytes.addAll(utf8.encode('--$boundary\r\nContent-Disposition: form-data; name="files"; filename="$fileName"\r\nContent-Type: application/octet-stream\r\n\r\n'));
        bodyBytes.addAll(fileBytes);
        bodyBytes.addAll(utf8.encode('\r\n'));
      }
      bodyBytes.addAll(utf8.encode('--$boundary--\r\n'));
      request.contentLength = bodyBytes.length;
      request.add(bodyBytes);
      final response = await request.close();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as List<dynamic>? ?? []);
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể tải ảnh khách sạn');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// DELETE /api/v1/admin/hotels/{hotelId}/images/{imageId}
  Future<Result<void>> adminDeleteHotelImage({
    required String accessToken,
    required String hotelId,
    required String imageId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/hotels/$hotelId/images/$imageId');
      final request = await client.deleteUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();
      if (response.statusCode == 200 || response.statusCode == 204) {
        return const Result.ok(null);
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể xóa ảnh khách sạn');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// PUT /api/v1/admin/hotels/{hotelId}/images/{imageId}/thumbnail
  Future<Result<void>> adminSetHotelThumbnail({
    required String accessToken,
    required String hotelId,
    required String imageId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/hotels/$hotelId/images/$imageId/thumbnail');
      final request = await client.putUrl(uri);
      _addAuth(request, accessToken);
      request.contentLength = 0;
      final response = await request.close();
      if (response.statusCode == 200) {
        return const Result.ok(null);
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể đặt ảnh thumbnail');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// GET /api/v1/admin/hotels/{hotelId}/services
  Future<Result<List<dynamic>>> adminGetHotelServices({
    required String accessToken,
    required String hotelId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/hotels/$hotelId/services');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as List<dynamic>? ?? []);
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể tải dịch vụ khách sạn');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// POST /api/v1/admin/hotels/{hotelId}/services
  Future<Result<Map<String, dynamic>>> adminCreateHotelService({
    required String accessToken,
    required String hotelId,
    required Map<String, dynamic> body,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/hotels/$hotelId/services');
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;
      final encoded = jsonEncode(body);
      request.contentLength = utf8.encode(encoded).length;
      request.write(encoded);
      final response = await request.close();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể tạo dịch vụ');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// GET /api/v1/admin/hotels/{hotelId}/room-types
  Future<Result<List<dynamic>>> adminGetRoomTypes({
    required String accessToken,
    required String hotelId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/hotels/$hotelId/room-types');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as List<dynamic>? ?? []);
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể tải loại phòng');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// POST /api/v1/admin/hotels/{hotelId}/room-types
  Future<Result<Map<String, dynamic>>> adminCreateRoomType({
    required String accessToken,
    required String hotelId,
    required Map<String, dynamic> body,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/hotels/$hotelId/room-types');
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;
      final encoded = jsonEncode(body);
      request.contentLength = utf8.encode(encoded).length;
      request.write(encoded);
      final response = await request.close();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể tạo loại phòng');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// PATCH /api/v1/admin/room-types/{roomTypeId}
  Future<Result<Map<String, dynamic>>> adminUpdateRoomType({
    required String accessToken,
    required String roomTypeId,
    required Map<String, dynamic> body,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/room-types/$roomTypeId');
      final request = await client.patchUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;
      final encoded = jsonEncode(body);
      request.contentLength = utf8.encode(encoded).length;
      request.write(encoded);
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể cập nhật loại phòng');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// DELETE /api/v1/admin/room-types/{roomTypeId}
  Future<Result<void>> adminDeleteRoomType({
    required String accessToken,
    required String roomTypeId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/room-types/$roomTypeId');
      final request = await client.deleteUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();
      if (response.statusCode == 200 || response.statusCode == 204) {
        return const Result.ok(null);
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể xóa loại phòng');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// POST /api/v1/admin/room-types/{roomTypeId}/images (multipart)
  Future<Result<List<dynamic>>> adminUploadRoomTypeImages({
    required String accessToken,
    required String roomTypeId,
    required List<String> filePaths,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final boundary = 'TraveryBoundary${DateTime.now().millisecondsSinceEpoch}';
      final uri = Uri.https(_host, '/api/v1/admin/room-types/$roomTypeId/images');
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      request.headers.set(HttpHeaders.contentTypeHeader, 'multipart/form-data; boundary=$boundary');

      final bodyBytes = <int>[];
      for (final filePath in filePaths) {
        final file = File(filePath);
        if (file.existsSync()) {
          final fileBytes = await file.readAsBytes();
          final fileName = file.uri.pathSegments.last;
          bodyBytes.addAll(utf8.encode('--$boundary\r\nContent-Disposition: form-data; name="files"; filename="$fileName"\r\nContent-Type: application/octet-stream\r\n\r\n'));
          bodyBytes.addAll(fileBytes);
          bodyBytes.addAll(utf8.encode('\r\n'));
        }
      }
      bodyBytes.addAll(utf8.encode('--$boundary--\r\n'));
      request.contentLength = bodyBytes.length;
      request.add(bodyBytes);
      final response = await request.close();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as List<dynamic>? ?? []);
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể tải ảnh lên');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// DELETE /api/v1/admin/room-types/{roomTypeId}/images/{imageId}
  Future<Result<void>> adminDeleteRoomTypeImage({
    required String accessToken,
    required String roomTypeId,
    required String imageId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/room-types/$roomTypeId/images/$imageId');
      final request = await client.deleteUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();
      if (response.statusCode == 200 || response.statusCode == 204) {
        return const Result.ok(null);
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể xóa ảnh');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// GET /api/v1/admin/hotels/{hotelId}/rooms
  Future<Result<List<dynamic>>> adminGetRooms({
    required String accessToken,
    required String hotelId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/hotels/$hotelId/rooms');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as List<dynamic>? ?? []);
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể tải danh sách phòng');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// POST /api/v1/admin/hotels/{hotelId}/rooms
  Future<Result<Map<String, dynamic>>> adminCreateRoom({
    required String accessToken,
    required String hotelId,
    required Map<String, dynamic> body,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/hotels/$hotelId/rooms');
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;
      final encoded = jsonEncode(body);
      request.contentLength = utf8.encode(encoded).length;
      request.write(encoded);
      final response = await request.close();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể tạo phòng');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// PATCH /api/v1/admin/rooms/{roomId}
  Future<Result<Map<String, dynamic>>> adminUpdateRoom({
    required String accessToken,
    required String roomId,
    required Map<String, dynamic> body,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/rooms/$roomId');
      final request = await client.patchUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;
      final encoded = jsonEncode(body);
      request.contentLength = utf8.encode(encoded).length;
      request.write(encoded);
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể cập nhật phòng');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// DELETE /api/v1/admin/rooms/{roomId}
  Future<Result<void>> adminDeleteRoom({
    required String accessToken,
    required String roomId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/rooms/$roomId');
      final request = await client.deleteUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();
      if (response.statusCode == 200 || response.statusCode == 204) {
        return const Result.ok(null);
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể xóa phòng');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  // ── Admin Amenity Controller ──────────────────────────────────────────────

  /// GET /api/v1/admin/amenities
  Future<Result<List<dynamic>>> adminGetAllAmenities({
    required String accessToken,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/amenities');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as List<dynamic>? ?? []);
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể tải cơ sở vật chất');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// POST /api/v1/admin/amenities  (multipart/form-data)
  /// [name], [type] are form fields; [iconImagePath] is optional file.
  Future<Result<Map<String, dynamic>>> adminCreateAmenity({
    required String accessToken,
    required String name,
    required String type,
    String? iconImagePath,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final boundary = 'TraveryBoundary${DateTime.now().millisecondsSinceEpoch}';
      final uri = Uri.https(_host, '/api/v1/admin/amenities');
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      request.headers.set(HttpHeaders.contentTypeHeader, 'multipart/form-data; boundary=$boundary');

      final bodyBytes = <int>[];
      bodyBytes.addAll(utf8.encode('--$boundary\r\nContent-Disposition: form-data; name="name"\r\n\r\n$name\r\n'));
      bodyBytes.addAll(utf8.encode('--$boundary\r\nContent-Disposition: form-data; name="type"\r\n\r\n$type\r\n'));
      if (iconImagePath != null) {
        final file = File(iconImagePath);
        if (file.existsSync()) {
          final fileBytes = await file.readAsBytes();
          final fileName = file.uri.pathSegments.last;
          bodyBytes.addAll(utf8.encode('--$boundary\r\nContent-Disposition: form-data; name="iconImage"; filename="$fileName"\r\nContent-Type: application/octet-stream\r\n\r\n'));
          bodyBytes.addAll(fileBytes);
          bodyBytes.addAll(utf8.encode('\r\n'));
        }
      }
      bodyBytes.addAll(utf8.encode('--$boundary--\r\n'));
      request.contentLength = bodyBytes.length;
      request.add(bodyBytes);
      final response = await request.close();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể tạo cơ sở vật chất');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// PATCH /api/v1/admin/amenities/{amenityId}  (multipart/form-data)
  Future<Result<Map<String, dynamic>>> adminUpdateAmenity({
    required String accessToken,
    required String amenityId,
    String? name,
    String? type,
    String? iconImagePath,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final boundary = 'TraveryBoundary${DateTime.now().millisecondsSinceEpoch}';
      final uri = Uri.https(_host, '/api/v1/admin/amenities/$amenityId');
      final request = await client.patchUrl(uri);
      _addAuth(request, accessToken);
      request.headers.set(HttpHeaders.contentTypeHeader, 'multipart/form-data; boundary=$boundary');

      final bodyBytes = <int>[];
      if (name != null) {
        bodyBytes.addAll(utf8.encode('--$boundary\r\nContent-Disposition: form-data; name="name"\r\n\r\n$name\r\n'));
      }
      if (type != null) {
        bodyBytes.addAll(utf8.encode('--$boundary\r\nContent-Disposition: form-data; name="type"\r\n\r\n$type\r\n'));
      }
      if (iconImagePath != null) {
        final file = File(iconImagePath);
        if (file.existsSync()) {
          final fileBytes = await file.readAsBytes();
          final fileName = file.uri.pathSegments.last;
          bodyBytes.addAll(utf8.encode('--$boundary\r\nContent-Disposition: form-data; name="iconImage"; filename="$fileName"\r\nContent-Type: application/octet-stream\r\n\r\n'));
          bodyBytes.addAll(fileBytes);
          bodyBytes.addAll(utf8.encode('\r\n'));
        }
      }
      bodyBytes.addAll(utf8.encode('--$boundary--\r\n'));
      request.contentLength = bodyBytes.length;
      request.add(bodyBytes);
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể cập nhật cơ sở vật chất');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// DELETE /api/v1/admin/amenities/{amenityId}
  Future<Result<void>> adminDeleteAmenity({
    required String accessToken,
    required String amenityId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/amenities/$amenityId');
      final request = await client.deleteUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();
      if (response.statusCode == 200 || response.statusCode == 204) {
        return const Result.ok(null);
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể xóa cơ sở vật chất');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  // ── Refund Policies ─────────────────────────────────────────────────────────

  /// GET /api/v1/admin/refund-policies
  Future<Result<Map<String, dynamic>>> adminGetAllRefundPolicies({
    required String accessToken,
    int page = 0,
    int size = 20,
    String? sort,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final queryParams = {
        'page': page.toString(),
        'size': size.toString(),
        if (sort != null) 'sort': sort,
      };
      final uri = Uri.https(_host, '/api/v1/admin/refund-policies', queryParams);
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể lấy danh sách chính sách hoàn tiền');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// GET /api/v1/admin/refund-policies/{id}
  Future<Result<Map<String, dynamic>>> adminGetRefundPolicyById({
    required String accessToken,
    required String id,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/refund-policies/$id');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể lấy chi tiết chính sách hoàn tiền');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// POST /api/v1/admin/refund-policies
  Future<Result<Map<String, dynamic>>> adminCreateRefundPolicy({
    required String accessToken,
    required Map<String, dynamic> body,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/refund-policies');
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(body));
      final response = await request.close();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể tạo chính sách hoàn tiền');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// PUT /api/v1/admin/refund-policies/{id}
  Future<Result<Map<String, dynamic>>> adminUpdateRefundPolicy({
    required String accessToken,
    required String id,
    required Map<String, dynamic> body,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/refund-policies/$id');
      final request = await client.putUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(body));
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as Map<String, dynamic>? ?? {});
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể cập nhật chính sách hoàn tiền');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  /// DELETE /api/v1/admin/refund-policies/{id}
  Future<Result<void>> adminDeleteRefundPolicy({
    required String accessToken,
    required String id,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/admin/refund-policies/$id');
      final request = await client.deleteUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200 || response.statusCode == 204) {
        return const Result.ok(null);
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể xóa chính sách hoàn tiền');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }

  // ── Destinations ────────────────────────────────────────────────────────────

  /// GET /api/v1/destinations/search
  Future<Result<List<dynamic>>> searchDestinations({
    required String accessToken,
    required String keyword,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);
    try {
      final uri = Uri.https(_host, '/api/v1/destinations/search', {'keyword': keyword});
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(jsonMap['data'] as List<dynamic>? ?? []);
      } else {
        final msg = await _extractErrorMessage(response, 'Không thể tìm kiếm thành phố');
        return Result.error(HttpException(msg));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }
}
