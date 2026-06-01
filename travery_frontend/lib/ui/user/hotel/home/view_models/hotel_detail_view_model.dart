import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/hotel/hotel_detail_data.dart';

class HotelDetailViewModel extends ChangeNotifier {
  HotelDetailViewModel();

  HotelDetailData? _hotel;
  HotelDetailData? get hotel => _hotel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  List<HotelRoomData> _selectedRooms = [];
  List<HotelRoomData> get selectedRooms => _selectedRooms;

  void loadHotel(String hotelId) {
    _isLoading = true;
    _error = null;
    notifyListeners();

    _hotel = _dummyHotel;
    _isLoading = false;
    notifyListeners();
  }

  void toggleRoomSelection(HotelRoomData room) {
    if (_selectedRooms.contains(room)) {
      _selectedRooms = _selectedRooms.where((r) => r.id != room.id).toList();
    } else {
      _selectedRooms = [..._selectedRooms, room];
    }
    notifyListeners();
  }

  double get totalPrice {
    return _selectedRooms.fold(0, (sum, room) => sum + room.pricePerNight);
  }

  static HotelDetailData get _dummyHotel => HotelDetailData(
    id: '1',
    name: 'Azure Sands Resort & Spa',
    imageUrls: [
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDokYsbIHsZbfvnxWacDlrQjI0ZoCt_ws1M-fI4-GdVSJvAD1rm54NXj5qeYrjYBsfu3e-2aLCdlffzrWHAbdxUNcKwr_DxuRNfQ3AXbqrreW03w3b6x1uEnOlpr_RWaSgcrxJnV6hbLNeFoV2ZtjhWk5sR0XKWOFgiTAp0V2oOZj9JomjT_C3Cvb5Jyw_0pdSJ5ZUYaUuGuhOR2Mqz5s1mOkdtfcCGMhB3WqFLKTMF0zYj0OWyugkS76itK9VRqFirvgcFOPMcZw',
    ],
    address: '255 Trường Sa, Đà Nẵng',
    rating: 4.9,
    description:
        'Trải nghiệm sự sang trọng bậc nhất tại bãi biển Đà Nẵng với dịch vụ đẳng cấp thế giới và tầm nhìn ngoạn mục ra đại dương xanh thẳm.',
    checkInTime: '14:00',
    checkOutTime: '12:00',
    amenities: [
      'Hồ bơi',
      'Spa & Wellness',
      'Ẩm thực Á-Âu',
      'Wifi miễn phí',
      'Bãi đỗ xe',
      'Phòng gym',
    ],
    rooms: [
      HotelRoomData(
        id: 'r1',
        name: 'Deluxe',
        pricePerNight: 4500000,
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBdtYrMvdUN6QfJHehYtyuBVwyBdd_VApM_LELUpfuqT80FuE5K5tKrMtS6EXyRRjpcEuFJYKaGaxX1i7hnTLW3I0RZ7E7Ae8GxCsFGValHS2RsicNmkvsmFlG5y2ulO1EMMlp9-30bgNHxSaeregzEwAO7WW4Z_KA5dstQFMM2sebREmwmdUz30yiO53SkxXiu7DsdUZcugpxYlql6LqBY37sQ6lFa7vPmn_8h4ikEJJ1A6_H7uum7uzU0womk3_o_6OxLa-BzTQ',
        features: ['Hồ bơi riêng', 'View biển', 'Quầy bar'],
        isAvailable: true,
      ),
      HotelRoomData(
        id: 'r2',
        name: 'Deluxe',
        pricePerNight: 4500000,
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuD0nflD7_YaNZYwtsbicXA5IDpl8WrqAwLujqdzwUwbjwxi9KFjAywwYOuF185VYfJutWX0-fCdCav-RZaWlXvMOqHuSTzoAAWXkbYU9YqaOYjZkcRw2XOgikFkFlauRxc40j86VqmNXEb_FtjFlU2_vWNSVxZXzgUDmWhf1EA8AsiBTz1eKGY9sUrJsLOdp4oFdEsZD9FHDaIwlODtmk38_9b52jUjxwu20FYKWoQXJVweM3XgmL_1oAfgpmDTM7nXvQGoc3zR1w',
        features: ['Hồ bơi riêng', 'View biển', 'Quầy bar'],
        isAvailable: false,
      ),
    ],
    reviews: [
      HotelReviewData(
        authorName: 'Nguyễn Minh Tuấn',
        rating: 5,
        date: '15/05/2024',
        comment:
            'Chuyến đi tuyệt vời, hướng dẫn viên rất nhiệt tình! Cảnh Vịnh Hạ Long thực sự rất hùng vĩ.',
      ),
      HotelReviewData(
        authorName: 'Lê Thị Mai Anh',
        rating: 5,
        date: '12/06/2024',
        comment:
            'Cảnh đẹp xuất sắc, dịch vụ chuyên nghiệp. Du thuyền 5 sao rất sạch sẽ và sang trọng.',
      ),
    ],
  );
}
