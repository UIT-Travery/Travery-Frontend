import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/models/hotel/hotel_detail_data.dart';
import 'package:travery_frontend/data/models/hotel/hotel_list_data.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/user/hotel/home/view_models/hotel_home_view_model.dart';
import 'package:travery_frontend/ui/user/hotel/widgets/hotel_app_bar.dart';

class HotelHomeScreen extends StatefulWidget {
  const HotelHomeScreen({super.key});

  @override
  State<HotelHomeScreen> createState() => _HotelHomeScreenState();
}

class _HotelHomeScreenState extends State<HotelHomeScreen> {
  static const double _minSelectablePrice = 0;
  static const double _maxSelectablePrice = 5000000;
  static const int _priceDivisions = 50;

  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _searchController.addListener(_onSearchTextChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vm = context.read<HotelHomeViewModel>();
      unawaited(vm.loadHotels());
      unawaited(vm.loadAmenities());
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _searchController
      ..removeListener(_onSearchTextChanged)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.maxScrollExtent - position.pixels < 360) {
      context.read<HotelHomeViewModel>().loadMore();
    }
  }

  void _onSearchTextChanged() {
    if (mounted) setState(() {});
  }

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  String _formatDateRange(DateTime? start, DateTime? end) {
    if (start == null && end == null) return '';
    if (start == null) return _formatDate(end!);
    if (end == null) return _formatDate(start);
    return '${_formatDate(start)} - ${_formatDate(end)}';
  }

  int? _nullIfZero(int value) => value > 0 ? value : null;

  RangeValues _normalizePriceRange(double? minPrice, double? maxPrice) {
    final start = (minPrice ?? _minSelectablePrice).clamp(
      _minSelectablePrice,
      _maxSelectablePrice,
    );
    final end = (maxPrice ?? _maxSelectablePrice).clamp(
      _minSelectablePrice,
      _maxSelectablePrice,
    );

    if (start > end) {
      return RangeValues(end.toDouble(), start.toDouble());
    }

    return RangeValues(start.toDouble(), end.toDouble());
  }

  double? _minPriceFilterValue(RangeValues range) {
    return range.start <= _minSelectablePrice ? null : range.start;
  }

  double? _maxPriceFilterValue(RangeValues range) {
    return range.end >= _maxSelectablePrice ? null : range.end;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: const HotelAppBar(title: 'Danh sách khách sạn'),
      body: Consumer<HotelHomeViewModel>(
        builder: (context, vm, _) {
          return Column(
            children: [
              _buildSearchHeader(vm),
              Expanded(child: _buildHotelContent(vm)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSearchHeader(HotelHomeViewModel vm) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) => vm.applyFilters(
                    keyword: value,
                    cityProvince: vm.cityProvince,
                    startDate: vm.startDate,
                    endDate: vm.endDate,
                    adults: vm.adults,
                    children: vm.children,
                    roomCount: vm.roomCount,
                    minRating: vm.minRating,
                    minPrice: vm.minPrice,
                    maxPrice: vm.maxPrice,
                    amenityIds: vm.selectedAmenityIds,
                  ),
                  onChanged: vm.searchByKeywordDebounced,
                  decoration: InputDecoration(
                    hintText: 'Tìm khách sạn, thành phố...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isEmpty
                        ? null
                        : IconButton(
                            tooltip: 'Xóa từ khóa',
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              _searchController.clear();
                              vm.searchByKeywordDebounced('');
                            },
                          ),
                    filled: true,
                    fillColor: const Color(0xFFF8FAFC),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFF2563EB),
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  IconButton.filledTonal(
                    tooltip: 'Bộ lọc',
                    onPressed: () => _showFilterSheet(vm),
                    icon: const Icon(Icons.tune),
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0xFFEFF6FF),
                      foregroundColor: const Color(0xFF2563EB),
                      fixedSize: const Size(48, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  if (vm.activeFilterCount > 0)
                    Positioned(
                      right: -2,
                      top: -4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEF4444),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          '${vm.activeFilterCount}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          if (vm.activeFilterCount > 0) ...[
            const SizedBox(height: 10),
            _buildActiveFilterChips(vm),
          ],
        ],
      ),
    );
  }

  Widget _buildActiveFilterChips(HotelHomeViewModel vm) {
    final chips = <Widget>[];
    if ((vm.cityProvince ?? '').isNotEmpty) {
      chips.add(_FilterChipLabel(label: vm.cityProvince!));
    }
    if (vm.startDate != null || vm.endDate != null) {
      chips.add(
        _FilterChipLabel(label: _formatDateRange(vm.startDate, vm.endDate)),
      );
    }
    if ((vm.adults ?? 0) > 0 ||
        (vm.children ?? 0) > 0 ||
        (vm.roomCount ?? 0) > 0) {
      chips.add(
        _FilterChipLabel(
          label:
              '${vm.adults ?? 0} NL, ${vm.children ?? 0} TE, ${vm.roomCount ?? 0} phòng',
        ),
      );
    }
    if (vm.minRating != null) {
      chips.add(_FilterChipLabel(label: 'Từ ${vm.minRating} sao'));
    }
    if (vm.minPrice != null || vm.maxPrice != null) {
      final min = vm.minPrice != null ? _formatPrice(vm.minPrice!) : '0đ';
      final max = vm.maxPrice != null ? _formatPrice(vm.maxPrice!) : '∞';
      chips.add(_FilterChipLabel(label: '$min - $max'));
    }
    if ((vm.selectedAmenityIds ?? const []).isNotEmpty) {
      chips.add(
        _FilterChipLabel(label: '${vm.selectedAmenityIds!.length} tiện ích'),
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ...chips,
        TextButton.icon(
          onPressed: vm.clearFilters,
          icon: const Icon(Icons.restart_alt, size: 16),
          label: const Text('Xóa lọc'),
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF2563EB),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
        ),
      ],
    );
  }

  Widget _buildHotelContent(HotelHomeViewModel vm) {
    if (vm.isInitialLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (vm.error != null && vm.hotels.isEmpty) {
      return _HotelMessageState(
        icon: Icons.error_outline,
        title: 'Không thể tải khách sạn',
        message: vm.error,
        actionLabel: 'Thử lại',
        onAction: () => unawaited(vm.loadHotels(refresh: true)),
      );
    }

    if (vm.hotels.isEmpty) {
      return _HotelMessageState(
        icon: Icons.hotel_outlined,
        title: 'Không tìm thấy khách sạn',
        message: 'Thử đổi từ khóa hoặc bỏ bớt bộ lọc.',
        actionLabel: 'Xóa tìm kiếm',
        onAction: () {
          _searchController.clear();
          vm.clearAll();
        },
      );
    }

    return RefreshIndicator(
      onRefresh: () => vm.loadHotels(refresh: true),
      child: ListView.separated(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemCount: vm.hotels.length + (vm.isLoadingMore ? 1 : 0),
        separatorBuilder: (_, _) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          if (index >= vm.hotels.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          final hotel = vm.hotels[index];
          return _HotelCard(
            hotel: hotel,
            formatPrice: _formatPrice,
            onTap: () => context.push(
              Routes.hotelDetail.replaceFirst(':id', hotel.id),
              extra: {'hotel': hotel},
            ),
          );
        },
      ),
    );
  }

  Future<void> _showFilterSheet(HotelHomeViewModel vm) async {
    unawaited(vm.loadAmenities());

    final cityController = TextEditingController(text: vm.cityProvince ?? '');
    DateTime? startDate = vm.startDate;
    DateTime? endDate = vm.endDate;
    int adults = vm.adults ?? 0;
    int children = vm.children ?? 0;
    int roomCount = vm.roomCount ?? 0;
    int? minRating = vm.minRating;
    RangeValues priceRange = _normalizePriceRange(vm.minPrice, vm.maxPrice);
    final selectedAmenityIds = <String>{...?vm.selectedAmenityIds};

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            Future<void> pickDateRange() async {
              final now = DateTime.now();
              final today = DateTime(now.year, now.month, now.day);
              final initialStart = startDate ?? today;
              final initialEnd =
                  endDate ?? initialStart.add(const Duration(days: 1));
              final picked = await showDateRangePicker(
                context: context,
                firstDate: today,
                lastDate: today.add(const Duration(days: 365)),
                initialDateRange: DateTimeRange(
                  start: initialStart,
                  end: initialEnd.isAfter(initialStart)
                      ? initialEnd
                      : initialStart.add(const Duration(days: 1)),
                ),
              );
              if (picked != null) {
                setModalState(() {
                  startDate = picked.start;
                  endDate = picked.end;
                });
              }
            }

            return Consumer<HotelHomeViewModel>(
              builder: (context, sheetVm, _) {
                return Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.9,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: SafeArea(
                    top: false,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 10, 8, 8),
                          child: Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  'Bộ lọc khách sạn',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF111827),
                                  ),
                                ),
                              ),
                              IconButton(
                                tooltip: 'Đóng',
                                onPressed: () => Navigator.of(context).pop(),
                                icon: const Icon(Icons.close),
                              ),
                            ],
                          ),
                        ),
                        const Divider(height: 1),
                        Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _FilterTextField(
                                  controller: cityController,
                                  label: 'Thành phố / tỉnh',
                                  hint: 'VD: Đà Nẵng, Hà Nội...',
                                  icon: Icons.location_on_outlined,
                                ),
                                const SizedBox(height: 16),
                                _FilterSectionTitle(
                                  icon: Icons.calendar_today_outlined,
                                  title: 'Ngày lưu trú',
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Expanded(
                                      child: OutlinedButton.icon(
                                        onPressed: pickDateRange,
                                        icon: const Icon(Icons.date_range),
                                        label: Text(
                                          startDate == null && endDate == null
                                              ? 'Chọn ngày'
                                              : _formatDateRange(
                                                  startDate,
                                                  endDate,
                                                ),
                                        ),
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: const Color(
                                            0xFF1F2937,
                                          ),
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 14,
                                            vertical: 14,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          side: const BorderSide(
                                            color: Color(0xFFE5E7EB),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (startDate != null || endDate != null)
                                      IconButton(
                                        tooltip: 'Xóa ngày',
                                        onPressed: () => setModalState(() {
                                          startDate = null;
                                          endDate = null;
                                        }),
                                        icon: const Icon(Icons.close),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 18),
                                _FilterSectionTitle(
                                  icon: Icons.people_alt_outlined,
                                  title: 'Khách và phòng',
                                ),
                                const SizedBox(height: 8),
                                _CounterRow(
                                  label: 'Người lớn',
                                  value: adults,
                                  onDecrease: adults > 0
                                      ? () => setModalState(() => adults--)
                                      : null,
                                  onIncrease: () =>
                                      setModalState(() => adults++),
                                ),
                                _CounterRow(
                                  label: 'Trẻ em',
                                  value: children,
                                  onDecrease: children > 0
                                      ? () => setModalState(() => children--)
                                      : null,
                                  onIncrease: () =>
                                      setModalState(() => children++),
                                ),
                                _CounterRow(
                                  label: 'Số phòng',
                                  value: roomCount,
                                  onDecrease: roomCount > 0
                                      ? () => setModalState(() => roomCount--)
                                      : null,
                                  onIncrease: () =>
                                      setModalState(() => roomCount++),
                                ),
                                const SizedBox(height: 18),
                                _FilterSectionTitle(
                                  icon: Icons.star_outline,
                                  title: 'Đánh giá tối thiểu',
                                ),
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: List.generate(5, (index) {
                                    final rating = index + 1;
                                    return ChoiceChip(
                                      label: Text('$rating sao'),
                                      selected: minRating == rating,
                                      onSelected: (selected) {
                                        setModalState(() {
                                          minRating = selected ? rating : null;
                                        });
                                      },
                                    );
                                  }),
                                ),
                                const SizedBox(height: 18),
                                _FilterSectionTitle(
                                  icon: Icons.payments_outlined,
                                  title: 'Khoảng giá mỗi đêm',
                                ),
                                const SizedBox(height: 10),
                                _PriceRangeSlider(
                                  values: priceRange,
                                  min: _minSelectablePrice,
                                  max: _maxSelectablePrice,
                                  divisions: _priceDivisions,
                                  formatPrice: _formatPrice,
                                  onChanged: (values) {
                                    setModalState(() => priceRange = values);
                                  },
                                ),
                                const SizedBox(height: 18),
                                _buildAmenityFilters(
                                  vm: sheetVm,
                                  selectedAmenityIds: selectedAmenityIds,
                                  setModalState: setModalState,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(height: 1),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            16,
                            12,
                            16,
                            MediaQuery.of(context).padding.bottom + 12,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    vm.clearFilters();
                                  },
                                  icon: const Icon(Icons.restart_alt),
                                  label: const Text('Xóa lọc'),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    vm.applyFilters(
                                      keyword: _searchController.text,
                                      cityProvince: cityController.text,
                                      startDate: startDate,
                                      endDate: endDate,
                                      adults: _nullIfZero(adults),
                                      children: _nullIfZero(children),
                                      roomCount: _nullIfZero(roomCount),
                                      minRating: minRating,
                                      minPrice: _minPriceFilterValue(
                                        priceRange,
                                      ),
                                      maxPrice: _maxPriceFilterValue(
                                        priceRange,
                                      ),
                                      amenityIds: selectedAmenityIds.toList(),
                                    );
                                  },
                                  icon: const Icon(Icons.check),
                                  label: const Text('Áp dụng'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF2563EB),
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );

    cityController.dispose();
  }

  Widget _buildAmenityFilters({
    required HotelHomeViewModel vm,
    required Set<String> selectedAmenityIds,
    required StateSetter setModalState,
  }) {
    if (vm.isLoadingAmenities) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: LinearProgressIndicator(),
      );
    }

    if (vm.amenitiesError != null && vm.amenities.isEmpty) {
      return Row(
        children: [
          const Expanded(
            child: Text(
              'Không thể tải tiện ích',
              style: TextStyle(color: Color(0xFF6B7280)),
            ),
          ),
          TextButton(onPressed: vm.loadAmenities, child: const Text('Thử lại')),
        ],
      );
    }

    if (vm.amenities.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FilterSectionTitle(
          icon: Icons.check_circle_outline,
          title: 'Tiện ích khách sạn',
        ),
        const SizedBox(height: 8),
        _AmenityChipGroup(
          amenities: vm.hotelAmenities,
          selectedIds: selectedAmenityIds,
          onChanged: (id, selected) {
            setModalState(() {
              selected
                  ? selectedAmenityIds.add(id)
                  : selectedAmenityIds.remove(id);
            });
          },
        ),
        if (vm.roomAmenities.isNotEmpty) ...[
          const SizedBox(height: 16),
          _FilterSectionTitle(
            icon: Icons.bed_outlined,
            title: 'Tiện ích phòng',
          ),
          const SizedBox(height: 8),
          _AmenityChipGroup(
            amenities: vm.roomAmenities,
            selectedIds: selectedAmenityIds,
            onChanged: (id, selected) {
              setModalState(() {
                selected
                    ? selectedAmenityIds.add(id)
                    : selectedAmenityIds.remove(id);
              });
            },
          ),
        ],
      ],
    );
  }
}

class _FilterChipLabel extends StatelessWidget {
  const _FilterChipLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFBFDBFE)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF2563EB),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _FilterSectionTitle extends StatelessWidget {
  const _FilterSectionTitle({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color(0xFF2563EB)),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Color(0xFF111827),
          ),
        ),
      ],
    );
  }
}

class _FilterTextField extends StatelessWidget {
  const _FilterTextField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, size: 20),
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2563EB), width: 1.5),
        ),
      ),
    );
  }
}

class _PriceRangeSlider extends StatelessWidget {
  const _PriceRangeSlider({
    required this.values,
    required this.min,
    required this.max,
    required this.divisions,
    required this.formatPrice,
    required this.onChanged,
  });

  final RangeValues values;
  final double min;
  final double max;
  final int divisions;
  final String Function(double) formatPrice;
  final ValueChanged<RangeValues> onChanged;

  @override
  Widget build(BuildContext context) {
    final startLabel = values.start <= min
        ? 'Từ 0đ'
        : formatPrice(values.start);
    final endLabel = values.end >= max
        ? 'Không giới hạn'
        : formatPrice(values.end);

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _PricePill(
                  icon: Icons.remove,
                  label: 'Từ',
                  value: startLabel,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _PricePill(
                  icon: Icons.add,
                  label: 'Đến',
                  value: endLabel,
                  highlighted: values.end < max,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: const Color(0xFF2563EB),
              inactiveTrackColor: const Color(0xFFDCE7FF),
              thumbColor: Colors.white,
              overlayColor: const Color(0xFF2563EB).withValues(alpha: 0.12),
              rangeThumbShape: const RoundRangeSliderThumbShape(
                enabledThumbRadius: 10,
                elevation: 2,
                pressedElevation: 4,
              ),
              rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
            ),
            child: RangeSlider(
              values: values,
              min: min,
              max: max,
              divisions: divisions,
              labels: RangeLabels(startLabel, endLabel),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class _PricePill extends StatelessWidget {
  const _PricePill({
    required this.icon,
    required this.label,
    required this.value,
    this.highlighted = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final borderColor = highlighted
        ? const Color(0xFF2563EB)
        : const Color(0xFFE5E7EB);

    return Container(
      constraints: const BoxConstraints(minHeight: 58),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: highlighted ? 1.6 : 1),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF4B5563), size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    value,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Color(0xFF374151),
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CounterRow extends StatelessWidget {
  const _CounterRow({
    required this.label,
    required this.value,
    required this.onDecrease,
    required this.onIncrease,
  });

  final String label;
  final int value;
  final VoidCallback? onDecrease;
  final VoidCallback onIncrease;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF374151),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                IconButton(
                  tooltip: 'Giảm',
                  onPressed: onDecrease,
                  icon: const Icon(Icons.remove),
                  constraints: const BoxConstraints(
                    minWidth: 38,
                    minHeight: 38,
                  ),
                  color: onDecrease == null
                      ? const Color(0xFF9CA3AF)
                      : const Color(0xFF2563EB),
                ),
                SizedBox(
                  width: 34,
                  child: Text(
                    '$value',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                IconButton(
                  tooltip: 'Tăng',
                  onPressed: onIncrease,
                  icon: const Icon(Icons.add),
                  constraints: const BoxConstraints(
                    minWidth: 38,
                    minHeight: 38,
                  ),
                  color: const Color(0xFF2563EB),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AmenityChipGroup extends StatelessWidget {
  const _AmenityChipGroup({
    required this.amenities,
    required this.selectedIds,
    required this.onChanged,
  });

  final List<HotelAmenityData> amenities;
  final Set<String> selectedIds;
  final void Function(String id, bool selected) onChanged;

  @override
  Widget build(BuildContext context) {
    if (amenities.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: amenities.map((amenity) {
        return FilterChip(
          label: Text(amenity.name),
          selected: selectedIds.contains(amenity.id),
          onSelected: (selected) => onChanged(amenity.id, selected),
          checkmarkColor: const Color(0xFF2563EB),
          selectedColor: const Color(0xFFEFF6FF),
          side: BorderSide(
            color: selectedIds.contains(amenity.id)
                ? const Color(0xFF93C5FD)
                : const Color(0xFFE5E7EB),
          ),
        );
      }).toList(),
    );
  }
}

class _HotelMessageState extends StatelessWidget {
  const _HotelMessageState({
    required this.icon,
    required this.title,
    this.message,
    this.actionLabel,
    this.onAction,
  });

  final IconData icon;
  final String title;
  final String? message;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: const Color(0xFFCBD5E1)),
            const SizedBox(height: 14),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1F2937),
              ),
            ),
            if (message != null) ...[
              const SizedBox(height: 6),
              Text(
                message!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF6B7280),
                  height: 1.4,
                ),
              ),
            ],
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 14),
              ElevatedButton(onPressed: onAction, child: Text(actionLabel!)),
            ],
          ],
        ),
      ),
    );
  }
}

class _HotelCard extends StatelessWidget {
  const _HotelCard({
    required this.hotel,
    required this.formatPrice,
    required this.onTap,
  });

  final HotelListData hotel;
  final String Function(double) formatPrice;
  final VoidCallback onTap;

  String get _location {
    final city = hotel.cityProvince ?? hotel.destinationName ?? '';
    if (hotel.address.isEmpty) return city;
    if (city.isEmpty || hotel.address.contains(city)) return hotel.address;
    return '${hotel.address}, $city';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(color: const Color(0xFFF3F4F6)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: hotel.imageUrl.isEmpty
                  ? const _HotelImageFallback()
                  : Image.network(
                      hotel.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => const _HotelImageFallback(),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          hotel.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF111827),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 15,
                            color: Color(0xFFFACC15),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            hotel.rating.toStringAsFixed(
                              hotel.rating.truncateToDouble() == hotel.rating
                                  ? 0
                                  : 1,
                            ),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF92400E),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 15,
                        color: Color(0xFF6B7280),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          _location,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF6B7280),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Expanded(
                        child: Text(
                          'Giá từ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6B7280),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        formatPrice(hotel.priceFrom),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF2563EB),
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 2),
                        child: Text(
                          '/đêm',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HotelImageFallback extends StatelessWidget {
  const _HotelImageFallback();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF0F7FF),
      child: const Center(
        child: Icon(Icons.hotel, size: 48, color: Color(0xFFBFDBFE)),
      ),
    );
  }
}
