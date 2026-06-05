import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_reponse.freezed.dart';
part 'refresh_reponse.g.dart';

@freezed
abstract class RefreshResponse with _$RefreshResponse {
  const factory RefreshResponse({
    required String accessToken,
    required String refreshToken,
  }) = _RefreshResponse;

  factory RefreshResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseFromJson(json);
}
