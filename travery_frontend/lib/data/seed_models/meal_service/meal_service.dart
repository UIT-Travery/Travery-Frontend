import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_service.freezed.dart';
part 'meal_service.g.dart';

@freezed
abstract class MealService with _$MealService {
  const factory MealService({
    String? id,

    @JsonKey(name: 'hotel_id') required String hotelId,

    required String name,

    required MealType mealType,

    String? description,

    required double price,

    @JsonKey(name: 'is_available') required bool isAvailable,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _MealService;

  factory MealService.fromJson(Map<String, dynamic> json) =>
      _$MealServiceFromJson(json);
}

@JsonEnum()
enum MealType { breakfast, lunch, dinner }
