enum GuideStatus { available, unavailable }

class CoordinatorGuide {
  final String id;
  final String name;
  final String email;
  final String imageUrl;
  final String? phoneNumber;
  final int yearsExperience;
  final List<String> languages;
  final GuideStatus status;

  const CoordinatorGuide({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    this.phoneNumber,
    required this.yearsExperience,
    required this.languages,
    required this.status,
  });
}
