import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour_template/coordinator_tour_template.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CoordinatorTourTemplateListViewModel {
  final CoordinatorRepository _coordinatorRepository;

  CoordinatorTourTemplateListViewModel({
    required CoordinatorRepository coordinatorRepository,
  }) : _coordinatorRepository = coordinatorRepository {
    loadTemplates = Command0(_loadTemplates);
    searchQuery.addListener(_applyFilters);
    loadTemplates.addListener(_onTemplatesLoaded);
  }

  late final Command0<List<CoordinatorTourTemplate>> loadTemplates;
  final ValueNotifier<String> searchQuery = ValueNotifier('');
  final ValueNotifier<List<CoordinatorTourTemplate>> filteredTemplates =
      ValueNotifier([]);

  Future<Result<List<CoordinatorTourTemplate>>> _loadTemplates() async {
    return _coordinatorRepository.getTourTemplates();
  }

  void _onTemplatesLoaded() {
    if (loadTemplates.completed) {
      _applyFilters();
    } else {
      filteredTemplates.value = [];
    }
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

  void dispose() {
    searchQuery.dispose();
    filteredTemplates.dispose();
    loadTemplates.dispose();
  }
}
