import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/hotel/hotel_booking_data.dart';

class HotelBookingDetailViewModel extends ChangeNotifier {
  HotelBookingDetailViewModel();

  HotelBookingData? _booking;
  HotelBookingData? get booking => _booking;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  bool _isCancelling = false;
  bool get isCancelling => _isCancelling;

  double get serviceTotal {
    return _booking?.services.fold<double>(0, (sum, s) => sum + s.total) ?? 0;
  }

  double get grandTotal {
    return (_booking?.totalPrice ?? 0) + serviceTotal;
  }

  void loadBooking(String bookingId) {
    _isLoading = true;
    _error = null;
    notifyListeners();

    _booking = _dummyBooking;
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> cancelBooking(String bookingId) async {
    _isCancelling = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    _isCancelling = false;
    if (_booking != null) {
      _booking = HotelBookingData(
        id: _booking!.id,
        hotelName: _booking!.hotelName,
        hotelAddress: _booking!.hotelAddress,
        hotelImageUrl: _booking!.hotelImageUrl,
        roomName: _booking!.roomName,
        roomCount: _booking!.roomCount,
        checkInDate: _booking!.checkInDate,
        checkOutDate: _booking!.checkOutDate,
        pricePerNight: _booking!.pricePerNight,
        totalPrice: _booking!.totalPrice,
        status: 'CANCELLED',
        contactName: _booking!.contactName,
        contactPhone: _booking!.contactPhone,
        contactEmail: _booking!.contactEmail,
        guests: _booking!.guests,
        services: _booking!.services,
        paymentDeadline: _booking!.paymentDeadline,
      );
    }
    notifyListeners();
    return true;
  }

  static HotelBookingData get _dummyBooking => HotelBookingData(
    id: 'TRV-###4410',
    hotelName: 'Azure Bay Resort & Spa',
    hotelAddress: '255 Trường Sa, Đà Nẵng',
    hotelImageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuBcE55rXTQJcmdMx31UNV4owHPI1yqnnkfmsfv15NoemogAoVl7ASfGQ3wU6lp2bOdVg5ikQd49YzoAZ4OZG_qquWIFNu7tYd8NY5EFKM6nry63yuXiraHTB5jG8WNK978CotpPPUBJuaKGvjecPemdJRCCIfyY5av58uSc3WeLEt91NINAT3PDAwsAKibozMvb_jF_McCi5G4qzK3kwRxrGJttIlNVYUTHZ9oqagDByGbFmRXWkn2fCvB2-ZMOVOMMN8s-5YEl6g',
    roomName: 'VIP DELUXE',
    roomCount: 1,
    checkInDate: DateTime.now().add(const Duration(days: 5)),
    checkOutDate: DateTime.now().add(const Duration(days: 8)),
    pricePerNight: 4500000,
    totalPrice: 12450000,
    status: 'PAID',
    contactName: 'Nguyễn Văn A',
    contactPhone: '012345678910',
    contactEmail: 'nguyenvana@email.com',
    guests: [],
    services: [
      HotelServiceData(
        id: 's1',
        name: 'In-Room Dining (Dinner)',
        price: 1250000,
        quantity: 1,
      ),
      HotelServiceData(
        id: 's2',
        name: 'Spa & Wellness Treatment',
        price: 3800000,
        quantity: 1,
      ),
    ],
    paymentDeadline: null,
  );
}
