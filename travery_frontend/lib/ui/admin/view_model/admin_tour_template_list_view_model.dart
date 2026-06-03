import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour_template/coordinator_tour_template.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class AdminTourTemplateListViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  AdminTourTemplateListViewModel({required AdminRepository adminRepository})
    : _adminRepository = adminRepository {
    loadTemplates = Command0<List<CoordinatorTourTemplate>>(_loadTemplates);
    loadTemplates.addListener(_onTemplatesLoaded);
  }

  late final Command0<List<CoordinatorTourTemplate>> loadTemplates;
  final ValueNotifier<String> searchQuery = ValueNotifier('');
  final ValueNotifier<List<CoordinatorTourTemplate>> filteredTemplates =
      ValueNotifier([]);

  Future<Result<List<CoordinatorTourTemplate>>> _loadTemplates() async {
    final result = await _adminRepository.getTourTemplates();
    switch (result) {
      case Ok<List<CoordinatorTourTemplate>>():
        return Result.ok(result.value);
      case Error<List<CoordinatorTourTemplate>>():
        return Result.error(result.error);
    }
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
    final all =
        (loadTemplates.result as Ok<List<CoordinatorTourTemplate>>).value;
    final query = searchQuery.value.trim().toLowerCase();
    if (query.isEmpty) {
      filteredTemplates.value = List.from(all);
    } else {
      filteredTemplates.value =
          all.where((t) {
            return t.name.toLowerCase().contains(query) ||
                t.description.toLowerCase().contains(query);
          }).toList();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    searchQuery.removeListener(_applyFilters);
    searchQuery.dispose();
    filteredTemplates.dispose();
    loadTemplates.dispose();
    super.dispose();
  }
}
