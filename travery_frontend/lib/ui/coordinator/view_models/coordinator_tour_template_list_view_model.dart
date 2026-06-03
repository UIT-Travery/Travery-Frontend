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
    loadTours.addListener(_onToursLoaded);
    deleteTemplate.addListener(_onDeleteTemplate);
  }

  late final Command0<List<CoordinatorTourTemplate>> loadTemplates;

  /// Loads paginated tour list via GET /api/v1/tours (tour-controller).
  late final Command0<List<TourSummaryResponse>> loadTours;

  /// Deletes a template via DELETE /api/v1/tours/templates/{id} (tour-controller).
  late final Command1<void, String> deleteTemplate;

  final ValueNotifier<String> searchQuery = ValueNotifier('');
  final ValueNotifier<List<TourSummaryResponse>> filteredTours =
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

  void _onToursLoaded() {
    if (loadTours.completed) {
      _applyFilters();
    } else if (loadTours.error) {
      filteredTours.value = [];
    }
  }

  void _onDeleteTemplate() {
    if (deleteTemplate.completed) {
      // Refresh the list after successful deletion
      loadTours.execute();
    }
    notifyListeners();
  }

  void _applyFilters() {
    if (!loadTours.completed) return;

    final allTours =
        (loadTours.result as Ok<List<TourSummaryResponse>>).value;
    final query = searchQuery.value.trim().toLowerCase();

    if (query.isEmpty) {
      filteredTours.value = List.from(allTours);
    } else {
      filteredTours.value =
          allTours.where((tour) {
            final nameMatches = tour.name.toLowerCase().contains(query);
            final destMatches =
                tour.destinationName.toLowerCase().contains(query);
            return nameMatches || destMatches;
          }).toList();
    }
  }

  @override
  void dispose() {
    searchQuery.dispose();
    filteredTours.dispose();
    loadTours.removeListener(_onToursLoaded);
    deleteTemplate.removeListener(_onDeleteTemplate);
    loadTemplates.dispose();
    loadTours.dispose();
    deleteTemplate.dispose();
    super.dispose();
  }
}

