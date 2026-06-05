import 'package:freezed_annotation/freezed_annotation.dart';

part 'spa_service.freezed.dart';
part 'spa_service.g.dart';

@freezed
abstract class SpaService with _$SpaService {
  const factory SpaService({
    String? id,

    @JsonKey(name: 'hotel_id') required String hotelId,

    required String name,

    String? description,

    required SpaServiceType serviceType,

    @JsonKey(name: 'duration_minutes') required int durationMinutes,

    required double price,

    @JsonKey(name: 'is_available') required bool isAvailable,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _SpaService;

  factory SpaService.fromJson(Map<String, dynamic> json) =>
      _$SpaServiceFromJson(json);
}

@JsonEnum()
enum SpaServiceType { massage, xonghoi, tamtien }
