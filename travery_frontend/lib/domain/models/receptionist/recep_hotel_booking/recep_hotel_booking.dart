import 'package:travery_frontend/domain/models/receptionist/recep_add_on/recep_add_on.dart';
import 'package:travery_frontend/domain/models/receptionist/recep_guest/recep_guest.dart';
import 'package:travery_frontend/domain/models/receptionist/recep_room/recep_room.dart';

enum RecepBookingStatus { checkedIn, checkedOut }

class RecepHotelBooking {
  final String bookingId;
  final RecepBookingStatus status;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final String mainBookingGuestName;
  final List<RecepGuest>? guests;
  final List<RecepRoom>? rooms;
  final List<RecepAddon>? addons;

  const RecepHotelBooking({
    required this.bookingId,
    required this.status,
    required this.checkInDate,
    required this.checkOutDate,
    required this.mainBookingGuestName,
    this.rooms,
    this.guests,
    this.addons,
  });
}
