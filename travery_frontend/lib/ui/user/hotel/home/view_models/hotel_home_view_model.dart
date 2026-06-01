import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/hotel/hotel_list_data.dart';

class HotelHomeViewModel extends ChangeNotifier {
  HotelHomeViewModel();

  List<HotelListData> _hotels = [];
  List<HotelListData> get hotels => _hotels;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  void loadHotels() {
    _isLoading = true;
    _error = null;
    notifyListeners();

    _hotels = _dummyHotels;
    _isLoading = false;
    notifyListeners();
  }

  static final List<HotelListData> _dummyHotels = [
    HotelListData(
      id: '1',
      name: 'Azure Bay Resort & Spa',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuArsfcr_VVr8jVhCN-MfJqFU30FvAwJ_if2EMTCc9tzs3MJS5ReNRW3eGPk3Jx8lzLwSVidTmUIx4QhXbyV8aQlfsAAr1P2rVvILUUhAkx8FfDMRsIQL_Db3PgjZWXrZtrde_XbvkR5FByT987_3wLLg-cuFoSviygD2N08us__78H-iHDrumxGR1fm_TN3obayQsQ-Y0VcOP4rxXEJyYdhCbecspME_PXc790tahXaOwAty7IHuGXJr0rTSDOzGCgXMICltcVCzA',
      address: 'Võ Nguyên Giáp, Đà Nẵng',
      rating: 4.9,
      priceFrom: 1200000,
    ),
    HotelListData(
      id: '2',
      name: 'Azure Bay Resort & Spa',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuArsfcr_VVr8jVhCN-MfJqFU30FvAwJ_if2EMTCc9tzs3MJS5ReNRW3eGPk3Jx8lzLwSVidTmUIx4QhXbyV8aQlfsAAr1P2rVvILUUhAkx8FfDMRsIQL_Db3PgjZWXrZtrde_XbvkR5FByT987_3wLLg-cuFoSviygD2N08us__78H-iHDrumxGR1fm_TN3obayQsQ-Y0VcOP4rxXEJyYdhCbecspME_PXc790tahXaOwAty7IHuGXJr0rTSDOzGCgXMICltcVCzA',
      address: 'Võ Nguyên Giáp, Đà Nẵng',
      rating: 4.9,
      priceFrom: 1200000,
    ),
    HotelListData(
      id: '3',
      name: 'Azure Bay Resort & Spa',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuArsfcr_VVr8jVhCN-MfJqFU30FvAwJ_if2EMTCc9tzs3MJS5ReNRW3eGPk3Jx8lzLwSVidTmUIx4QhXbyV8aQlfsAAr1P2rVvILUUhAkx8FfDMRsIQL_Db3PgjZWXrZtrde_XbvkR5FByT987_3wLLg-cuFoSviygD2N08us__78H-iHDrumxGR1fm_TN3obayQsQ-Y0VcOP4rxXEJyYdhCbecspME_PXc790tahXaOwAty7IHuGXJr0rTSDOzGCgXMICltcVCzA',
      address: 'Võ Nguyên Giáp, Đà Nẵng',
      rating: 4.9,
      priceFrom: 1200000,
    ),
  ];
}
