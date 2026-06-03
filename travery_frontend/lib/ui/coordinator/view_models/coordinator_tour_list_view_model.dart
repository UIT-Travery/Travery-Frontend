import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour/coordinator_tour.dart';
import 'package:travery_frontend/data/repositories/profile/profile_repository.dart';
import 'package:travery_frontend/data/services/api/model/profile/profile_response/profile_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CoordinatorTourListViewModel extends ChangeNotifier {
  final CoordinatorRepository _coordinatorRepository;
  final ProfileRepository _profileRepository;

  CoordinatorTourListViewModel({
    required CoordinatorRepository coordinatorRepository,
    required ProfileRepository profileRepository,
  }) : _coordinatorRepository = coordinatorRepository,
       _profileRepository = profileRepository {
    loadTours = Command0(_loadTours);
    loadProfile = Command0(_loadProfile);
    searchQuery.addListener(_applyFilters);
    loadTours.addListener(_onToursLoaded);
  }

  late final Command0<List<CoordinatorTour>> loadTours;
  late final Command0<ProfileData> loadProfile;
  final ValueNotifier<String> searchQuery = ValueNotifier('');
  final ValueNotifier<List<CoordinatorTour>> filteredTours = ValueNotifier([]);

  Future<Result<List<CoordinatorTour>>> _loadTours() async {
    return await _coordinatorRepository.getAllTours();
  }

  Future<Result<ProfileData>> _loadProfile() async {
    return await _profileRepository.getMyProfile();
  }

  void _onToursLoaded() {
    if (loadTours.completed) {
      _applyFilters();
    } else {
      filteredTours.value = [];
    }
  }

  void _applyFilters() {
    if (!loadTours.completed) return;

    final allTours = (loadTours.result as Ok<List<CoordinatorTour>>).value;
    final query = searchQuery.value.trim().toLowerCase();

    if (query.isEmpty) {
      filteredTours.value = List.from(allTours);
    } else {
      filteredTours.value =
          allTours.where((tour) {
            final nameMatches =
                tour.tourName.toLowerCase().contains(query);
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
    loadTours.dispose();
    loadProfile.dispose();
    super.dispose();
  }
}
