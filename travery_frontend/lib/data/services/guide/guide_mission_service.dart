import 'package:travery_frontend/data/seed_models/tour_progress/tour_progress.dart';
import 'package:travery_frontend/data/seed_models/incident/incident.dart';
import 'package:travery_frontend/utils/core_result.dart';

abstract class GuideMissionService {
  /// GET /api/v1/staff/guide/instances/{id}
  Future<Result<GuideMissionDetail>> getMissionDetail(String instanceId);

  /// GET /api/v1/staff/guide/instances/{id}/passengers?query=
  Future<Result<List<GuidePassenger>>> getPassengers(
    String instanceId, {
    String query = '',
  });

  /// PATCH /api/v1/staff/guide/instances/{id}/attendance
  /// Body: { "attendances": [{ "memberId": "uuid", "status": "PRESENT" }] }
  /// Returns the full updated mission detail on success.
  Future<Result<GuideMissionDetail>> updateAttendance(
    String instanceId,
    List<Map<String, String>> attendances,
  );

  /// PATCH /api/v1/staff/guide/instances/{id}/progress
  Future<Result<void>> updateProgress(String instanceId, String status);

  /// POST /api/v1/staff/guide/instances/{id}/incidents
  Future<Result<Incident>> reportIncident(
    String instanceId,
    String title,
    String description,
    String severity,
  );

  /// GET /api/v1/staff/guide/instances/{id}/incidents
  Future<Result<List<Incident>>> getIncidents(String instanceId);

  Future<Result<CoachTripPage>> getCoachTrips({
    String? status,
    int page = 0,
    int size = 20,
    List<String> sort = const [],
  });

  Future<Result<CoachTripDetail>> getCoachTripDetail(String tripId);

  Future<Result<List<CoachTripBooking>>> getCoachTripBookings(String tripId);

  /// PUT /api/v1/guide/coach-trips/{id}/status
  /// Body: { "status": "OPEN|FULL|IN_PROGRESS|COMPLETED|CANCELLED" }
  Future<Result<CoachTripStatusResponse>> updateCoachTripStatus(
    String tripId,
    String status,
  );

  Future<Result<void>> checkInCoachPassenger(String tripId, String bookingId);

  /// PUT /api/v1/guide/coach-trips/{id}/bookings/{bookingId}/no-show
  Future<Result<void>> markPassengerNoShow(String tripId, String bookingId);
}

// ─── Response Models ────────────────────────────────────────────────────────────

class GuideMissionDetail {
  final String id;
  final String tourName;
  final String destinationName;
  final String pickupLocation;
  final DateTime startDate;
  final DateTime endDate;
  final String status;
  final String? coachId;
  final String? coachLicensePlate;
  final String? coachType;
  final String? driverId;
  final String? driverName;
  final String? driverPhone;
  final List<GuideBooking> bookings;
  final List<TourProgressStep> steps;

  const GuideMissionDetail({
    required this.id,
    required this.tourName,
    required this.destinationName,
    required this.pickupLocation,
    required this.startDate,
    required this.endDate,
    required this.status,
    this.coachId,
    this.coachLicensePlate,
    this.coachType,
    this.driverId,
    this.driverName,
    this.driverPhone,
    this.bookings = const [],
    this.steps = const [],
  });

  int get totalPassengers {
    return bookings.fold(0, (sum, b) => sum + b.members.length);
  }

  int get arrivedPassengers {
    return bookings.fold(
      0,
      (sum, b) => sum + b.members.where((m) => m.status == 'CHECKED_IN').length,
    );
  }

  bool get isOngoing =>
      status == 'IN_PROGRESS' || status == 'OPEN' || status == 'FULL';
  bool get isUpcoming => status == 'PLANNING' || status == 'PENDING';
  bool get isCompleted => status == 'COMPLETED';
}

class GuideBooking {
  final String id;
  final String customerName;
  final String customerPhone;
  final String? specialRequests;
  final String status;
  final double totalPrice;
  final DateTime? paymentDeadline;
  final List<GuideMember> members;

  const GuideBooking({
    required this.id,
    required this.customerName,
    required this.customerPhone,
    this.specialRequests,
    required this.status,
    required this.totalPrice,
    this.paymentDeadline,
    this.members = const [],
  });
}

class GuideMember {
  final String id;
  final String fullName;
  final String identityNumber;
  final DateTime dateOfBirth;
  final String status; // NOT_CHECKED | CHECKED_IN | NO_SHOW
  final String memberType; // ADULT | CHILD

  const GuideMember({
    required this.id,
    required this.fullName,
    required this.identityNumber,
    required this.dateOfBirth,
    required this.status,
    required this.memberType,
  });

  bool get isCheckedIn => status == 'CHECKED_IN';
  bool get isNoShow => status == 'NO_SHOW';
  bool get isAdult => memberType == 'ADULT';
}

class GuidePassenger {
  final String id;
  final String fullName;
  final String identityNumber;
  final DateTime dateOfBirth;
  final String attendanceStatus;
  final String memberType;

  const GuidePassenger({
    required this.id,
    required this.fullName,
    required this.identityNumber,
    required this.dateOfBirth,
    required this.attendanceStatus,
    required this.memberType,
  });

  bool get isArrived => attendanceStatus == 'CHECKED_IN';
  bool get isNoShow => attendanceStatus == 'NO_SHOW';
  bool get isAdult => memberType == 'ADULT';
}

class CoachTripStatusResponse {
  final String id;
  final DateTime? departureTime;
  final DateTime? arrivalTime;
  final String status;
  final String? routeId;
  final String? originDestinationName;
  final String? destinationDestinationName;
  final double? basePrice;
  final String? coachId;
  final String? coachLicensePlate;
  final String? coachType;
  final String? driverId;
  final String? driverName;
  final String? driverPhone;
  final int totalSeats;
  final int availableSeats;
  final int bookingsCount;
  final int passengersCount;

  const CoachTripStatusResponse({
    required this.id,
    this.departureTime,
    this.arrivalTime,
    required this.status,
    this.routeId,
    this.originDestinationName,
    this.destinationDestinationName,
    this.basePrice,
    this.coachId,
    this.coachLicensePlate,
    this.coachType,
    this.driverId,
    this.driverName,
    this.driverPhone,
    this.totalSeats = 0,
    this.availableSeats = 0,
    this.bookingsCount = 0,
    this.passengersCount = 0,
  });
}

class CoachTripPage {
  final List<CoachTripSummary> content;
  final int totalElements;
  final int totalPages;
  final int size;
  final int number;
  final int numberOfElements;
  final bool first;
  final bool last;
  final bool empty;

  const CoachTripPage({
    required this.content,
    this.totalElements = 0,
    this.totalPages = 0,
    this.size = 0,
    this.number = 0,
    this.numberOfElements = 0,
    this.first = true,
    this.last = true,
    this.empty = true,
  });
}

class CoachTripSummary {
  final String id;
  final String name;
  final String? destinationName;
  final DateTime? departureTime;
  final String status;
  final int availableSeats;
  final int totalSeats;
  final String? originDestinationName;
  final String? destinationDestinationName;
  final double? basePrice;
  final String? coachLicensePlate;
  final String? coachType;

  const CoachTripSummary({
    required this.id,
    required this.name,
    this.destinationName,
    this.departureTime,
    required this.status,
    this.availableSeats = 0,
    this.totalSeats = 0,
    this.originDestinationName,
    this.destinationDestinationName,
    this.basePrice,
    this.coachLicensePlate,
    this.coachType,
  });

  String get routeName {
    final origin = originDestinationName;
    final destination = destinationDestinationName ?? destinationName;
    if (origin != null &&
        origin.trim().isNotEmpty &&
        destination != null &&
        destination.trim().isNotEmpty) {
      return '$origin → $destination';
    }
    if (name.trim().isNotEmpty) return name;
    if (destination != null && destination.trim().isNotEmpty) {
      return destination;
    }
    return 'Chuyến xe';
  }
}

class CoachTripDetail {
  final String id;
  final DateTime? departureTime;
  final DateTime? arrivalTime;
  final String status;
  final String? routeId;
  final String? originDestinationName;
  final String? destinationDestinationName;
  final double? basePrice;
  final String? coachId;
  final String? coachLicensePlate;
  final String? coachType;
  final String? driverId;
  final String? driverName;
  final String? driverPhone;
  final String? guideId;
  final String? guideName;
  final String? guidePhone;
  final int totalSeats;
  final int availableSeats;
  final int bookingsCount;
  final int passengersCount;

  const CoachTripDetail({
    required this.id,
    this.departureTime,
    this.arrivalTime,
    required this.status,
    this.routeId,
    this.originDestinationName,
    this.destinationDestinationName,
    this.basePrice,
    this.coachId,
    this.coachLicensePlate,
    this.coachType,
    this.driverId,
    this.driverName,
    this.driverPhone,
    this.guideId,
    this.guideName,
    this.guidePhone,
    this.totalSeats = 0,
    this.availableSeats = 0,
    this.bookingsCount = 0,
    this.passengersCount = 0,
  });

  String get routeName {
    final origin = originDestinationName;
    final destination = destinationDestinationName;
    if (origin != null &&
        origin.trim().isNotEmpty &&
        destination != null &&
        destination.trim().isNotEmpty) {
      return '$origin → $destination';
    }
    return 'Chuyến xe';
  }

  int get occupiedSeats {
    final occupied = totalSeats - availableSeats;
    if (occupied < 0) return 0;
    return occupied;
  }
}

class CoachTripBooking {
  final String bookingId;
  final String contactName;
  final String contactPhone;
  final int seatCount;
  final String status;
  final List<String> seatNames;

  const CoachTripBooking({
    required this.bookingId,
    required this.contactName,
    required this.contactPhone,
    this.seatCount = 0,
    required this.status,
    this.seatNames = const [],
  });

  String get normalizedStatus => status.toUpperCase();

  bool get isCheckedIn => normalizedStatus == 'CHECKED_IN';
  bool get isNoShow => normalizedStatus == 'NO_SHOW';
  bool get isCancelled => normalizedStatus == 'CANCELLED';
  bool get canCheckIn => !isCheckedIn && !isNoShow && !isCancelled;
  bool get isPending => canCheckIn;
}
