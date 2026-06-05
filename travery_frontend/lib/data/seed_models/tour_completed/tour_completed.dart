enum TourCompletedStatus { completed, cancelled }

enum StepStatus { pending, inProgress, completed }

class CompletedStep {
  final String id;
  final String time;
  final String title;
  final String location;
  final StepStatus status;
  final bool isLast;

  const CompletedStep({
    required this.id,
    required this.time,
    required this.title,
    required this.location,
    required this.status,
    this.isLast = false,
  });

  bool get isCompleted => status == StepStatus.completed;
}

class TourIncident {
  final String id;
  final String description;
  final DateTime reportedAt;
  final String? resolvedAt;
  final String? resolution;

  const TourIncident({
    required this.id,
    required this.description,
    required this.reportedAt,
    this.resolvedAt,
    this.resolution,
  });

  bool get isResolved => resolvedAt != null;
}

class TourCompletedDetail {
  final String id;
  final String missionId;
  final String tripCode;
  final String title;
  final DateTime date;
  final TourCompletedStatus status;
  final int totalPassengers;
  final int presentPassengers;
  final int absentPassengers;
  final List<CompletedStep> completedSteps;
  final List<TourIncident> incidents;

  const TourCompletedDetail({
    required this.id,
    required this.missionId,
    required this.tripCode,
    required this.title,
    required this.date,
    required this.status,
    required this.totalPassengers,
    required this.presentPassengers,
    required this.absentPassengers,
    required this.completedSteps,
    required this.incidents,
  });

  bool get hasNoIncidents => incidents.isEmpty;
  double get attendanceRate =>
      totalPassengers > 0 ? presentPassengers / totalPassengers : 0;

  String get formattedDate {
    return 'Ngày ${date.day} tháng ${date.month}, ${date.year}';
  }
}

class TourCompletedSummary {
  final String id;
  final String missionId;
  final String tripCode;
  final String title;
  final DateTime date;
  final TourCompletedStatus status;
  final int totalPassengers;
  final int presentPassengers;
  final int absentPassengers;

  const TourCompletedSummary({
    required this.id,
    required this.missionId,
    required this.tripCode,
    required this.title,
    required this.date,
    required this.status,
    required this.totalPassengers,
    required this.presentPassengers,
    required this.absentPassengers,
  });

  String get formattedDate {
    return 'Ngày ${date.day} tháng ${date.month}, ${date.year}';
  }
}
