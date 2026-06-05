import 'package:freezed_annotation/freezed_annotation.dart';

part 'laundry_service.freezed.dart';
part 'laundry_service.g.dart';

@freezed
abstract class LaundryService with _$LaundryService {
  const factory LaundryService({
    String? id,

    @JsonKey(name: 'hotel_id') required String hotelId,

    required String name,

    String? description,

    required LaundryServiceType serviceType,

    @JsonKey(name: 'price_per_kg') required double pricePerKg,

    @JsonKey(name: 'is_available') required bool isAvailable,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _LaundryService;

  factory LaundryService.fromJson(Map<String, dynamic> json) =>
      _$LaundryServiceFromJson(json);
}

@JsonEnum()
enum LaundryServiceType { washDry, steamPress }
