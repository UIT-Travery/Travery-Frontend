import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_hotel/coordinator_hotel.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_hotel_selection_card.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CoordinatorHotelSelectionBottomsheet extends StatefulWidget {
  final void Function(String hotelName)? onHotelSelected;

  const CoordinatorHotelSelectionBottomsheet({
    super.key,
    this.onHotelSelected,
  });

  @override
  State<CoordinatorHotelSelectionBottomsheet> createState() =>
      _CoordinatorHotelSelectionBottomsheetState();
}

class _CoordinatorHotelSelectionBottomsheetState
    extends State<CoordinatorHotelSelectionBottomsheet> {
  List<CoordinatorHotel> _allHotels = [];
  List<CoordinatorHotel> _filteredHotels = [];
  bool _isLoading = true;
  String? _errorMessage;
  String _selectedLocation = 'Tất cả';

  // Extract unique city tags from hotel addresses
  List<String> get _locationTabs {
    final cities = <String>{'Tất cả'};
    for (final hotel in _allHotels) {
      final parts = hotel.address.split(',');
      if (parts.isNotEmpty) {
        final city = parts.last.trim();
        if (city.isNotEmpty) cities.add(city);
      }
    }
    return cities.toList();
  }

  @override
  void initState() {
    super.initState();
    _loadHotels();
  }

  Future<void> _loadHotels() async {
    try {
      final repository = context.read<CoordinatorRepository>();
      final result = await repository.getAllHotels();
      if (mounted) {
        setState(() {
          if (result is Ok<List<CoordinatorHotel>>) {
            _allHotels = result.value;
            _filteredHotels = result.value;
          }
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  void _filterByLocation(String location) {
    setState(() {
      _selectedLocation = location;
      if (location == 'Tất cả') {
        _filteredHotels = _allHotels;
      } else {
        _filteredHotels = _allHotels.where((h) {
          return h.address.toLowerCase().contains(location.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.88;

    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.inputBorder,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.close,
                      size: 22, color: AppColors.textSecondary),
                ),
                Expanded(
                  child: Center(
                    child: const Text(
                      'Chọn khách sạn',
                      style: TextStyle(
                        fontSize: AppTextTheme.bodyLarge,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 22),
              ],
            ),
          ),

          // Location filter chips
          if (!_isLoading && _allHotels.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: const Text(
                'Địa điểm',
                style: TextStyle(
                  fontSize: AppTextTheme.bodyMedium,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: _locationTabs.length,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final loc = _locationTabs[index];
                  final isSelected = _selectedLocation == loc;
                  return GestureDetector(
                    onTap: () => _filterByLocation(loc),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.inputBackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        loc,
                        style: TextStyle(
                          fontSize: AppTextTheme.bodySmall,
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? Colors.white
                              : AppColors.textSecondary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
          ],

          const Divider(height: 1, color: AppColors.inputBorder),

          // Hotel list
          Flexible(
            child: _isLoading
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: CircularProgressIndicator(
                          color: AppColors.primary),
                    ),
                  )
                : _errorMessage != null
                    ? Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          'Lỗi: $_errorMessage',
                          style:
                              const TextStyle(color: AppColors.error),
                        ),
                      )
                    : _filteredHotels.isEmpty
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.all(32),
                              child: Text(
                                'Không tìm thấy khách sạn nào',
                                style: TextStyle(
                                    color: AppColors.textSecondary),
                              ),
                            ),
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.all(16),
                            itemCount: _filteredHotels.length,
                            separatorBuilder: (_, _) =>
                                const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              final hotel = _filteredHotels[index];
                              // Extract a readable city/province from address
                              final addressParts =
                                  hotel.address.split(',');
                              final cityProvince =
                                  addressParts.length >= 2
                                      ? addressParts
                                          .sublist(
                                              addressParts.length - 2)
                                          .join(',')
                                          .trim()
                                      : hotel.address;

                              return CoordinatorHotelSelectionCard(
                                hotelname: hotel.name,
                                cityprovince: cityProvince,
                                imageurl: hotel.imageUrl.isNotEmpty
                                    ? hotel.imageUrl
                                    : null,
                                onTap: () {
                                  Navigator.of(context).pop();
                                  widget.onHotelSelected?.call(hotel.name);
                                },
                              );
                            },
                          ),
          ),

          SizedBox(
              height: MediaQuery.of(context).padding.bottom + 8),
        ],
      ),
    );
  }
}
