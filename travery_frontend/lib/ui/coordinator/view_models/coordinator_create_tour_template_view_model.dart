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
      itineraries:
          (data['itineraries'] as List<Map<String, dynamic>>),
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
