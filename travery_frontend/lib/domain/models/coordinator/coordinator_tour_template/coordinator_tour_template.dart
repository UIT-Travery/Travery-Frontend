import 'package:travery_frontend/domain/models/coordinator/coordinator_template_initerary/coordinator_template_initerary.dart';

class CoordinatorTourTemplate {
  final String id;
  final String name;
  final String imageUrl;
  final String thumbnailUrl;
  final List<String> images;
  final String description;
  final String adultPrice;
  final String childPrice;
  final String startTime;
  final String endTime;
  final int minTotalPerson;
  final int maxTotalPerson;
  final String startLocation;
  final String destination;
  final List<CoordinatorTemplateItinerary> itineraries;

  const CoordinatorTourTemplate({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.thumbnailUrl,
    required this.images,
    required this.description,
    required this.adultPrice,
    required this.childPrice,
    required this.startTime,
    required this.endTime,
    required this.minTotalPerson,
    required this.maxTotalPerson,
    required this.startLocation,
    required this.destination,
    required this.itineraries,
  });
}
