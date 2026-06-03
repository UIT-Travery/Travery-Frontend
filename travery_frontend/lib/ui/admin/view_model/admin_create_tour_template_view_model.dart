import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class AdminCreateTourTemplateViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  AdminCreateTourTemplateViewModel({required AdminRepository adminRepository})
    : _adminRepository = adminRepository {
    createTemplate = Command1<void, Map<String, dynamic>>(_createTemplate);
    createTemplate.addListener(_onCreateChanged);
  }

  late final Command1<void, Map<String, dynamic>> createTemplate;

  Future<Result<void>> _createTemplate(Map<String, dynamic> data) async {
    return _adminRepository.createTourTemplate(
      name: data['name'] as String,
      description: data['description'] as String,
      destinationId: data['destinationId'] as String,
      hotelId: data['hotelId'] as String?,
      pickupLocation: data['pickupLocation'] as String,
      pricePerAdult: (data['pricePerAdult'] as num).toDouble(),
      pricePerChild: (data['pricePerChild'] as num).toDouble(),
      refundPolicyId: data['refundPolicyId'] as String?,
      isCustom: data['isCustom'] as bool? ?? false,
      itineraries: data['itineraries'] as List<Map<String, dynamic>>,
    );
  }

  void _onCreateChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    createTemplate.removeListener(_onCreateChanged);
    createTemplate.dispose();
    super.dispose();
  }
}
