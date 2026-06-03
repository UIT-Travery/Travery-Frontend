enum RecepGuestType { child, adult }

class RecepGuest {
  final String name;
  final String dateOfBirth;
  final RecepGuestType type;
  final String? identityNumber;

  const RecepGuest({
    required this.name,
    required this.dateOfBirth,
    required this.type,
    this.identityNumber,
  });
}
