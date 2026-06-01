import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/hotel/hotel_booking_data.dart';

class HotelMyBookingViewModel extends ChangeNotifier {
  HotelMyBookingViewModel();

  List<HotelBookingData> _bookings = [];
  List<HotelBookingData> get bookings => _bookings;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  void loadBookings() {
    _isLoading = true;
    _error = null;
    notifyListeners();

    _bookings = _dummyBookings;
    _isLoading = false;
    notifyListeners();
  }

  static final List<HotelBookingData> _dummyBookings = [
    HotelBookingData(
      id: 'BK001',
      hotelName: 'Azure Bay Resort & Spa',
      hotelAddress: 'Võ Nguyên Giáp, Đà Nẵng',
      hotelImageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBcE55rXTQJcmdMx31UNV4owHPI1yqnnkfmsfv15NoemogAoVl7ASfGQ3wU6lp2bOdVg5ikQd49YzoAZ4OZG_qquWIFNu7tYd8NY5EFKM6nry63yuXiraHTB5jG8WNK978CotpPPUBJuaKGvjecPemdJRCCIfyY5av58uSc3WeLEt91NINAT3PDAwsAKibozMvb_jF_McCi5G4qzK3kwRxrGJttIlNVYUTHZ9oqagDByGbFmRXWkn2fCvB2-ZMOVOMMN8s-5YEl6g',
      roomName: 'Deluxe',
      roomCount: 1,
      checkInDate: DateTime.now().add(const Duration(days: 2)),
      checkOutDate: DateTime.now().add(const Duration(days: 5)),
      pricePerNight: 1200000,
      totalPrice: 3600000,
      status: 'PAID',
      contactName: 'Nguyễn Văn A',
      contactPhone: '0901234567',
      contactEmail: 'nguyenvana@email.com',
      guests: [],
      services: [],
      paymentDeadline: null,
    ),
    HotelBookingData(
      id: 'BK002',
      hotelName: 'Azure Bay Resort & Spa',
      hotelAddress: 'Võ Nguyên Giáp, Đà Nẵng',
      hotelImageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBcE55rXTQJcmdMx31UNV4owHPI1yqnnkfmsfv15NoemogAoVl7ASfGQ3wU6lp2bOdVg5ikQd49YzoAZ4OZG_qquWIFNu7tYd8NY5EFKM6nry63yuXiraHTB5jG8WNK978CotpPPUBJuaKGvjecPemdJRCCIfyY5av58uSc3WeLEt91NINAT3PDAwsAKibozMvb_jF_McCi5G4qzK3kwRxrGJttIlNVYUTHZ9oqagDByGbFmRXWkn2fCvB2-ZMOVOMMN8s-5YEl6g',
      roomName: 'Deluxe',
      roomCount: 1,
      checkInDate: DateTime.now().subtract(const Duration(days: 1)),
      checkOutDate: DateTime.now().add(const Duration(days: 2)),
      pricePerNight: 1200000,
      totalPrice: 3600000,
      status: 'CHECKED_IN',
      contactName: 'Nguyễn Văn A',
      contactPhone: '0901234567',
      contactEmail: 'nguyenvana@email.com',
      guests: [],
      services: [],
      paymentDeadline: null,
    ),
    HotelBookingData(
      id: 'BK003',
      hotelName: 'Azure Bay Resort & Spa',
      hotelAddress: 'Võ Nguyên Giáp, Đà Nẵng',
      hotelImageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBcE55rXTQJcmdMx31UNV4owHPI1yqnnkfmsfv15NoemogAoVl7ASfGQ3wU6lp2bOdVg5ikQd49YzoAZ4OZG_qquWIFNu7tYd8NY5EFKM6nry63yuXiraHTB5jG8WNK978CotpPPUBJuaKGvjecPemdJRCCIfyY5av58uSc3WeLEt91NINAT3PDAwsAKibozMvb_jF_McCi5G4qzK3kwRxrGJttIlNVYUTHZ9oqagDByGbFmRXWkn2fCvB2-ZMOVOMMN8s-5YEl6g',
      roomName: 'Deluxe',
      roomCount: 1,
      checkInDate: DateTime.now().subtract(const Duration(days: 10)),
      checkOutDate: DateTime.now().subtract(const Duration(days: 7)),
      pricePerNight: 1200000,
      totalPrice: 3600000,
      status: 'CANCELLED',
      contactName: 'Nguyễn Văn A',
      contactPhone: '0901234567',
      contactEmail: 'nguyenvana@email.com',
      guests: [],
      services: [],
      paymentDeadline: null,
    ),
  ];
}
