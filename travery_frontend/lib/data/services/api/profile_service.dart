import 'dart:convert';
import 'dart:io';
import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/data/services/api/model/profile/profile_response/profile_response.dart';
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

  Future<Result<ProfileData>> updateTouristProfile({
    required String accessToken,
    required String? fullName,
    required String? phoneNumber,
    required String? passportNumber,
    required String? dateOfBirth,
    required String? gender,
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
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );

      final body = <String, dynamic>{};
      if (fullName != null) body['fullName'] = fullName;
      if (phoneNumber != null) body['phoneNumber'] = phoneNumber;
      if (passportNumber != null) body['passportNumber'] = passportNumber;
      if (dateOfBirth != null) body['dateOfBirth'] = dateOfBirth;
      if (gender != null) body['gender'] = gender;

      request.write(jsonEncode(body));

      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>;
        return Result.ok(ProfileData.fromJson(data));
      } else {
        return Result.error(
          HttpException('Failed to update profile: ${response.statusCode}'),
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
    required String? fullName,
    required String? phoneNumber,
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
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );

      final body = <String, dynamic>{};
      if (fullName != null) body['fullName'] = fullName;
      if (phoneNumber != null) body['phoneNumber'] = phoneNumber;

      request.write(jsonEncode(body));

      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>;
        return Result.ok(ProfileData.fromJson(data));
      } else {
        return Result.error(
          HttpException('Failed to update profile: ${response.statusCode}'),
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
      final request = await client.putUrl(
        Uri.https(_host, '/api/v1/profile/avatar'),
      );
      request.headers.set(
        HttpHeaders.authorizationHeader,
        'Bearer $accessToken',
      );

      final file = File(filePath);
      final bytes = await file.readAsBytes();
      final boundary =
          '----FormBoundary${DateTime.now().millisecondsSinceEpoch}';
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        'multipart/form-data; boundary=$boundary',
      );

      final multipartBody = StringBuffer();
      multipartBody.writeln('--$boundary');
      multipartBody.writeln(
        'Content-Disposition: form-data; name="file"; filename="${file.path.split('/').last}"',
      );
      multipartBody.writeln('Content-Type: image/jpeg');
      multipartBody.writeln();
      multipartBody.write(String.fromCharCodes(bytes));
      multipartBody.writeln();
      multipartBody.writeln('--$boundary--');

      request.add(utf8.encode(multipartBody.toString()));

      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>;
        return Result.ok(ProfileData.fromJson(data));
      } else {
        return Result.error(
          HttpException('Failed to update avatar: ${response.statusCode}'),
        );
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<void>> changePassword({
    required String accessToken,
    required String currentPassword,
    required String newPassword,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.postUrl(
        Uri.https(_host, '/api/v1/auth/change-password'),
      );
      request.headers.set(
        HttpHeaders.authorizationHeader,
        'Bearer $accessToken',
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );

      final body = {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      };

      request.write(jsonEncode(body));

      final response = await request.close();

      if (response.statusCode == 200) {
        return const Result.ok(null);
      } else {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final message =
            jsonMap['message'] as String? ?? 'Failed to change password';
        return Result.error(HttpException(message));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<void>> deleteAccount({required String accessToken}) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.postUrl(
        Uri.https(_host, '/api/v1/auth/account-deletion'),
      );
      request.headers.set(
        HttpHeaders.authorizationHeader,
        'Bearer $accessToken',
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );

      request.write('{}');

      final response = await request.close();

      if (response.statusCode == 200) {
        return const Result.ok(null);
      } else {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final message =
            jsonMap['message'] as String? ?? 'Failed to delete account';
        return Result.error(HttpException(message));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }
}
