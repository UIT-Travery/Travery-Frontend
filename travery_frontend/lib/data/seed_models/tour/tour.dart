import 'package:freezed_annotation/freezed_annotation.dart';

import '../tour_image/tour_image.dart';
import '../tour_instance/tour_instance.dart';

part 'tour.freezed.dart';
part 'tour.g.dart';

@freezed
abstract class Tour with _$Tour {
  const factory Tour({
    String? id,

    required String name,

    String? description,

    @JsonKey(name: 'pricePerAdult') required double pricePerAdult,

    @JsonKey(name: 'pricePerChild') required double pricePerChild,

    @JsonKey(name: 'averageRating') @Default(0.0) double averageRating,

    @JsonKey(name: 'ratingCount') @Default(0) int ratingCount,

    @JsonKey(name: 'startLocation') @Default('') String startLocation,

    @JsonKey(name: 'durationDays') @Default(0) int durationDays,

    /// RELATIONS
    List<TourImage>? images,
    List<TourInstance>? instances,
  }) = _Tour;

  factory Tour.fromJson(Map<String, dynamic> json) => _$TourFromJson(json);
}
