import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/data/services/api/model/tour/tour_summart_response/tour_summary_response.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour_template/coordinator_tour_template.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CoordinatorTourTemplateListViewModel extends ChangeNotifier {
  final CoordinatorRepository _coordinatorRepository;

  CoordinatorTourTemplateListViewModel({
    required CoordinatorRepository coordinatorRepository,
  }) : _coordinatorRepository = coordinatorRepository {
    loadTemplates = Command0(_loadTemplates);
    loadTours = Command0(_loadTours);
    deleteTemplate = Command1<void, String>(_deleteTemplate);

    searchQuery.addListener(_applyFilters);
    loadTemplates.addListener(_onTemplatesLoaded);
    deleteTemplate.addListener(_onDeleteTemplate);
  }

  late final Command0<List<CoordinatorTourTemplate>> loadTemplates;

  /// Loads paginated tour list via GET /api/v1/tours (tour-controller).
  late final Command0<List<TourSummaryResponse>> loadTours;

  /// Deletes a template via DELETE /api/v1/tours/templates/{id} (tour-controller).
  late final Command1<void, String> deleteTemplate;

  final ValueNotifier<String> searchQuery = ValueNotifier('');
  final ValueNotifier<List<CoordinatorTourTemplate>> filteredTemplates =
      ValueNotifier([]);

  Future<Result<List<CoordinatorTourTemplate>>> _loadTemplates() async {
    return _coordinatorRepository.getTourTemplates();
  }

  Future<Result<List<TourSummaryResponse>>> _loadTours() async {
    return _coordinatorRepository.getTours();
  }

  Future<Result<void>> _deleteTemplate(String id) async {
    return _coordinatorRepository.deleteTemplate(id);
  }

  void _onTemplatesLoaded() {
    if (loadTemplates.completed) {
      _applyFilters();
    } else {
      filteredTemplates.value = [];
    }
  }

  void _onDeleteTemplate() {
    if (deleteTemplate.completed) {
      // Refresh the list after successful deletion
      loadTemplates.execute();
    }
    notifyListeners();
  }

  void _applyFilters() {
    if (!loadTemplates.completed) return;

    final allTemplates =
        (loadTemplates.result as Ok<List<CoordinatorTourTemplate>>).value;
    final query = searchQuery.value.trim().toLowerCase();

    if (query.isEmpty) {
      filteredTemplates.value = List.from(allTemplates);
    } else {
      filteredTemplates.value =
          allTemplates.where((template) {
            final nameMatches = template.name.toLowerCase().contains(query);
            final descMatches =
                template.description.toLowerCase().contains(query);
            return nameMatches || descMatches;
          }).toList();
    }
  }

  @override
  void dispose() {
    searchQuery.dispose();
    filteredTemplates.dispose();
    loadTemplates.removeListener(_onTemplatesLoaded);
    deleteTemplate.removeListener(_onDeleteTemplate);
    loadTemplates.dispose();
    loadTours.dispose();
    deleteTemplate.dispose();
    super.dispose();
  }
}

