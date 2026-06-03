enum PassengerType { adult, child }

enum CheckInStatus { pending, arrived, noShow }

enum AttendanceStatus { notChecked, checkedIn, noShow }

class MemberAttendance {
  final String memberId;
  final AttendanceStatus status;

  const MemberAttendance({required this.memberId, required this.status});

  Map<String, dynamic> toJson() => {
    'memberId': memberId,
    'status': status.name.toUpperCase(),
  };
}

class CheckInPassenger {
  final String id;
  final String name;
  final String idNumber;
  final String email;
  final PassengerType type;
  final CheckInStatus status;
  final String bookingId;
  final String missionId;

  const CheckInPassenger({
    required this.id,
    required this.name,
    required this.idNumber,
    required this.email,
    required this.type,
    required this.status,
    required this.bookingId,
    required this.missionId,
  });

  CheckInPassenger copyWith({
    String? id,
    String? name,
    String? idNumber,
    String? email,
    PassengerType? type,
    CheckInStatus? status,
    String? bookingId,
    String? missionId,
  }) {
    return CheckInPassenger(
      id: id ?? this.id,
      name: name ?? this.name,
      idNumber: idNumber ?? this.idNumber,
      email: email ?? this.email,
      type: type ?? this.type,
      status: status ?? this.status,
      bookingId: bookingId ?? this.bookingId,
      missionId: missionId ?? this.missionId,
    );
  }

  bool get isArrived => status == CheckInStatus.arrived;
  bool get isChild => type == PassengerType.child;

  String get typeLabel => type == PassengerType.adult ? 'Người lớn' : 'Trẻ em';
}

class CheckInPassengerList {
  final List<CheckInPassenger> passengers;
  final int totalCount;
  final int arrivedCount;

  const CheckInPassengerList({
    required this.passengers,
    required this.totalCount,
    required this.arrivedCount,
  });

  int get pendingCount => totalCount - arrivedCount;
  double get progress => totalCount > 0 ? arrivedCount / totalCount : 0;
}
