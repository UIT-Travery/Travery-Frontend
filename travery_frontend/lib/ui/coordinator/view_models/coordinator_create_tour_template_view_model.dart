import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CoordinatorCreateTourTemplateViewModel extends ChangeNotifier {
  final CoordinatorRepository _coordinatorRepository;

  CoordinatorCreateTourTemplateViewModel({
    required CoordinatorRepository coordinatorRepository,
  }) : _coordinatorRepository = coordinatorRepository {
    createTemplate = Command1<void, Map<String, dynamic>>(_createTemplate);
    createTemplate.addListener(_onCreateTemplateChanged);
  }

  late final Command1<void, Map<String, dynamic>> createTemplate;

  Future<Result<void>> _createTemplate(Map<String, dynamic> data) async {
    final tourImageBytes = <List<int>>[];
    final tourImageNames = <String>[];

    if (data['thumbnailImage'] != null) {
      final file = data['thumbnailImage'] as File;
      tourImageBytes.add(file.readAsBytesSync());
      tourImageNames.add(file.path.split(RegExp(r'[/\\]')).last);
    }
    
    if (data['otherImages'] != null) {
      final files = data['otherImages'] as List<File>;
      for (final file in files) {
        tourImageBytes.add(file.readAsBytesSync());
        tourImageNames.add(file.path.split(RegExp(r'[/\\]')).last);
      }
    }

    final rawItineraries = data['itineraries'] as List<Map<String, dynamic>>;
    final itineraries = <Map<String, dynamic>>[];
    final itineraryImageBytes = <List<int>>[];
    final itineraryImageNames = <String>[];

    for (int i = 0; i < rawItineraries.length; i++) {
      final item = rawItineraries[i];
      itineraries.add({
        'dayNumber': item['dayNumber'],
        'title': item['title'],
        'description': item['description'],
      });
      
      if (item['imageFile'] != null) {
        final file = item['imageFile'] as File;
        itineraryImageBytes.add(file.readAsBytesSync());
        itineraryImageNames.add(file.path.split(RegExp(r'[/\\]')).last);
      }
    }

    return _coordinatorRepository.createTourTemplate(
      name: data['name'] as String,
      description: data['description'] as String,
      destinationId: data['destinationId'] as String,
      hotelId: data['hotelId'] as String?,
      pickupLocation: data['pickupLocation'] as String,
      pricePerAdult: (data['pricePerAdult'] as num).toDouble(),
      pricePerChild: (data['pricePerChild'] as num).toDouble(),
      refundPolicyId: data['refundPolicyId'] as String?,
      requestedByUserId: data['requestedByUserId'] as String?,
      isCustom: data['isCustom'] as bool? ?? false,
      itineraries: itineraries,
      tourImageBytes: tourImageBytes.isNotEmpty ? tourImageBytes : null,
      tourImageNames: tourImageNames.isNotEmpty ? tourImageNames : null,
      itineraryImageBytes: itineraryImageBytes.isNotEmpty ? itineraryImageBytes : null,
      itineraryImageNames: itineraryImageNames.isNotEmpty ? itineraryImageNames : null,
    );
  }

  void _onCreateTemplateChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    createTemplate.removeListener(_onCreateTemplateChanged);
    createTemplate.dispose();
    super.dispose();
  }
}
