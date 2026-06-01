import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/data/services/api/model/profile/profile_response/profile_response.dart';
import 'package:travery_frontend/data/services/api/model/profile/update_admin_profile_request/update_admin_profile_request.dart';
import 'package:travery_frontend/data/services/api/model/profile/update_tourist_profile_request/update_tourist_profile_request.dart';
import 'package:travery_frontend/utils/core_result.dart';

class ProfileService {
  ProfileService({String? host, HttpClient Function()? clientFactory})
    : _host = host ?? AppConfig.baseUrl,
      _clientFactory = clientFactory ?? HttpClient.new;

  final String _host;
  final HttpClient Function() _clientFactory;

  Future<Result<ProfileData>> getProfile({required String accessToken}) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.getUrl(
        Uri.https(_host, '/api/v1/profile/me'),
      );
      request.headers.set(
        HttpHeaders.authorizationHeader,
        'Bearer $accessToken',
      );

      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>;
        return Result.ok(ProfileData.fromJson(data));
      } else {
        return Result.error(
          HttpException('Failed to get profile: ${response.statusCode}'),
        );
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<ProfileData>> updateAdminProfile({
    required String accessToken,
    required UpdateAdminProfileRequest req,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.patchUrl(
        Uri.https(_host, '/api/v1/profile/admin/me'),
      );
      request.headers.set(
        HttpHeaders.authorizationHeader,
        'Bearer $accessToken',
      );
      request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');

      request.write(jsonEncode(req.toJson()));

      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>;
        return Result.ok(ProfileData.fromJson(data));
      } else {
        return Result.error(
          HttpException('Failed to update admin profile: ${response.statusCode}'),
        );
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<ProfileData>> updateTouristProfile({
    required String accessToken,
    required UpdateTouristProfileRequest req,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.patchUrl(
        Uri.https(_host, '/api/v1/profile/tourist/me'),
      );
      request.headers.set(
        HttpHeaders.authorizationHeader,
        'Bearer $accessToken',
      );
      request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');

      request.write(jsonEncode(req.toJson()));

      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>;
        return Result.ok(ProfileData.fromJson(data));
      } else {
        return Result.error(
          HttpException('Failed to update tourist profile: ${response.statusCode}'),
        );
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<ProfileData>> updateAvatar({
    required String accessToken,
    required String filePath,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final file = File(filePath);
      if (!await file.exists()) {
        return Result.error(Exception('File not found at $filePath'));
      }

      final fileName = file.path.split(Platform.pathSeparator).last;
      final fileLength = await file.length();
      final boundary = '----Boundary\${DateTime.now().millisecondsSinceEpoch}';

      final request = await client.putUrl(
        Uri.https(_host, '/api/v1/profile/avatar'),
      );

      request.headers.set(
        HttpHeaders.authorizationHeader,
        'Bearer $accessToken',
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        'multipart/form-data; boundary=$boundary',
      );

      // Write form-data
      request.write('--$boundary\r\n');
      request.write(
        'Content-Disposition: form-data; name="file"; filename="$fileName"\r\n',
      );
      request.write('Content-Type: application/octet-stream\r\n\r\n');
      await request.addStream(file.openRead());
      request.write('\r\n--$boundary--\r\n');

      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>;
        return Result.ok(ProfileData.fromJson(data));
      } else {
        final err = await response.transform(utf8.decoder).join();
        return Result.error(
          HttpException(
            'Failed to update avatar: ${response.statusCode} - $err',
          ),
        );
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }
}
