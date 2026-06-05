import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travery_frontend/data/models/hotel/hotel_detail_data.dart';
import 'package:travery_frontend/data/models/hotel/hotel_list_data.dart';
import 'package:travery_frontend/data/services/hotel/hotel_service.dart';
import 'package:travery_frontend/ui/user/hotel/home/hotel_home_screen.dart';
import 'package:travery_frontend/utils/core_result.dart';

void main() {
  testWidgets('applies city filter after the filter sheet closes', (
    tester,
  ) async {
    final hotelService = _FakeHotelService();

    await tester.pumpWidget(
      MaterialApp(home: HotelHomeScreen(hotelService: hotelService)),
    );
    await tester.pump();
    await tester.pump();

    await tester.tap(find.byIcon(Icons.tune));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 350));

    await tester.enterText(find.byType(TextField).last, 'Da Nang');
    await tester.tap(find.text('Áp dụng'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(hotelService.lastCityProvince, 'Da Nang');
  });
}

class _FakeHotelService implements HotelService {
  String? lastCityProvince;

  @override
  Future<Result<List<HotelAmenityData>>> getAmenities() async {
    return const Result.ok([]);
  }

  @override
  Future<Result<HotelSearchResult>> searchHotels({
    String? keyword,
    String? cityProvince,
    DateTime? startDate,
    DateTime? endDate,
    int? adults,
    int? children,
    int? roomCount,
    int? minRating,
    double? minPrice,
    double? maxPrice,
    List<String>? amenityIds,
    List<String>? availableHotelIds,
    int page = 0,
    int size = 20,
    String? sortBy,
    String? sortDir,
  }) async {
    lastCityProvince = cityProvince;
    return Result.ok(
      HotelSearchResult(
        hotels: [
          HotelListData(
            id: 'hotel-1',
            name: 'Test Hotel',
            imageUrl: '',
            address: 'Test address',
            rating: 4.5,
            priceFrom: 1200000,
            cityProvince: cityProvince,
          ),
        ],
        totalElements: 1,
        totalPages: 1,
        currentPage: page,
        pageSize: size,
      ),
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
