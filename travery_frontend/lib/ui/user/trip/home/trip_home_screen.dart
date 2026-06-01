import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/trip/home/view_models/trip_home_view_model.dart';
import 'package:travery_frontend/ui/user/widgets/user_app_bar.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'package:travery_frontend/data/models/trip/destination_data.dart';

const _kBannerImages = [
  'https://cellphones.com.vn/sforum/wp-content/uploads/2022/12/ung-dung-dat-xe-1.jpg',
  'https://aegona.vn/wp-content/uploads/2024/02/thiet-ke-app-dat-xe-may-be.png',
  'https://kenh14cdn.com/2019/1/11/photo-6-15471832961491730428272.jpg',
  'https://mrluka.com/wp-content/uploads/2025/09/Dich-Vu-Quang-Cao-Google-Ads-Xe-Honda-Cong-Ty-Quang-Cao-Google-Ads-Uy-Tin-Chuyeen-Nghiep.jpg',
  'https://cdn.xanhsm.com/2023/06/0484e3a7-huong-dan-tai-app-taxi-xanh-sm.jpg',
  'https://busmedia.vn/wp-content/uploads/2019/06/bao-gia-quang-cao-xe-buyt-5.jpg',
  'https://quangcaooto.vn/wp-content/uploads/2023/02/bai-viet-quang-cao-xe-o-to-1-768x515.jpg',
  'https://citgroup.vn/wp-content/uploads/2024/05/app-quan-ly-xe-640x427.png',
];

class TripHomeScreen extends StatefulWidget {
  const TripHomeScreen({super.key});

  @override
  State<TripHomeScreen> createState() => _TripHomeScreenState();
}

class _TripHomeScreenState extends State<TripHomeScreen> {
  int _bannerIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TripHomeViewModel>().loadStations();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFF),
      appBar: const UserAppBar(title: 'Đặt vé xe khách'),
      body: Consumer<TripHomeViewModel>(
        builder: (context, vm, _) {
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildSearchCard(context, vm),
              const SizedBox(height: 24),
              _buildBannerCarousel(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Chào bạn!',
          style: TextStyle(fontSize: 14, color: Color(0xFF414755)),
        ),
        const SizedBox(height: 4),
        const Text(
          'Đặt vé xe khách',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Color(0xFF131B2E),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Tìm chuyến xe phù hợp với bạn',
          style: TextStyle(fontSize: 14, color: Color(0xFF717786)),
        ),
      ],
    );
  }

  Widget _buildSearchCard(BuildContext context, TripHomeViewModel vm) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tìm chuyến xe',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF131B2E),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _LocationField(
                  label: 'Điểm đi',
                  icon: Icons.trip_origin,
                  iconColor: AppColors.primary,
                  value: _formatLocationDisplay(
                    vm.selectedOriginStation?.name,
                    vm.selectedOriginStation?.address,
                    vm.selectedOrigin?.name,
                  ),
                  onTap: () => _showStationPicker(context, vm, isOrigin: true),
                ),
              ),
              GestureDetector(
                onTap: vm.canSearch ? vm.swapOriginDestination : null,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF2F3FF),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.swap_horiz,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
              ),
              Expanded(
                child: _LocationField(
                  label: 'Điểm đến',
                  icon: Icons.location_on,
                  iconColor: const Color(0xFFFF6B6B),
                  value: _formatLocationDisplay(
                    vm.selectedDestinationStation?.name,
                    vm.selectedDestinationStation?.address,
                    vm.selectedDestination?.name,
                  ),
                  onTap: () => _showStationPicker(context, vm, isOrigin: false),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _DateField(
            value: vm.departureDate,
            onTap: () => _showDatePicker(context, vm),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: vm.canSearch
                  ? () {
                      debugPrint(
                        'Trip search — '
                        'origin: ${vm.selectedOrigin?.name}, '
                        'originStation: ${vm.selectedOriginStation?.name} (${vm.selectedOriginStation?.id}), '
                        'destination: ${vm.selectedDestination?.name}, '
                        'destinationStation: ${vm.selectedDestinationStation?.name} (${vm.selectedDestinationStation?.id}), '
                        'departureDate: ${vm.departureDate}',
                      );
                      context.push(
                        Routes.tripList,
                        extra: {
                          'origin': vm.selectedOrigin,
                          'destination': vm.selectedDestination,
                          'originStation': vm.selectedOriginStation,
                          'destinationStation': vm.selectedDestinationStation,
                          'departureDate': vm.departureDate,
                        },
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
                disabledBackgroundColor: Colors.grey[300],
              ),
              child: vm.isLoadingStations
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Text(
                      'Tìm chuyến xe',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void _showStationPicker(
    BuildContext context,
    TripHomeViewModel vm, {
    required bool isOrigin,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _StationPickerBottomSheet(
        title: isOrigin ? 'Chọn điểm đi' : 'Chọn điểm đến',
        destinations: vm.origins,
        selectedStation: isOrigin
            ? vm.selectedOriginStation
            : vm.selectedDestinationStation,
        onSelect: (destination, station) {
          if (isOrigin) {
            vm.selectOrigin(destination);
            vm.selectOriginStation(station);
          } else {
            vm.selectDestination(destination);
            vm.selectDestinationStation(station);
          }
          Navigator.pop(ctx);
        },
        onSearch: (keyword) async {
          final result = await vm.searchDestinations(keyword);
          return switch (result) {
            Ok(value: final data) => data,
            Error() => [],
          };
        },
      ),
    );
  }

  String _formatLocationDisplay(
    String? stationName,
    String? stationAddress,
    String? destName,
  ) {
    if (stationName == null || stationName.isEmpty) {
      return destName ?? '';
    }
    final parts = <String>[stationName];
    if (stationAddress != null && stationAddress.isNotEmpty) {
      parts.add(stationAddress);
    } else if (destName != null && destName.isNotEmpty) {
      parts.add(destName);
    }
    return parts.join(' • ');
  }

  void _showDatePicker(BuildContext context, TripHomeViewModel vm) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: vm.departureDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      helpText: 'Chọn ngày khởi hành',
      cancelText: 'Hủy',
      confirmText: 'Xác nhận',
      builder: (ctx, child) {
        return Theme(
          data: Theme.of(ctx).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Color(0xFF131B2E),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      vm.setDepartureDate(picked);
    }
  }

  final PageController _bannerPageController = PageController(
    viewportFraction: 0.92,
  );

  @override
  void dispose() {
    _bannerPageController.dispose();
    super.dispose();
  }

  Widget _buildBannerCarousel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Khám phá dịch vụ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF131B2E),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 160,
          child: PageView.builder(
            controller: _bannerPageController,
            onPageChanged: (index) {
              setState(() => _bannerIndex = index);
            },
            itemCount: _kBannerImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    _kBannerImages[index],
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: const Color(0xFFF2F3FF),
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primary,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primary.withValues(alpha: 0.8),
                              AppColors.primary,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.directions_bus,
                            color: Colors.white54,
                            size: 48,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        _CarouselIndicator(
          controller: _bannerPageController,
          count: _kBannerImages.length,
          currentIndex: _bannerIndex,
        ),
      ],
    );
  }
}

class _LocationField extends StatelessWidget {
  const _LocationField({
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final Color iconColor;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F3FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Color(0xFF414755),
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(icon, size: 14, color: iconColor),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    value.isEmpty ? 'Chon' : value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: value.isEmpty
                          ? const Color(0xFF717786)
                          : const Color(0xFF131B2E),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DateField extends StatelessWidget {
  const _DateField({required this.value, required this.onTap});

  final DateTime value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F3FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'NGÀY KHỞI HÀNH',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Color(0xFF414755),
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(
                  Icons.calendar_month,
                  size: 14,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 6),
                Text(
                  _formatDate(value),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF131B2E),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final weekdays = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
    return '${weekdays[date.weekday - 1]}, ${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}

class _CarouselIndicator extends StatefulWidget {
  const _CarouselIndicator({
    required this.controller,
    required this.count,
    required this.currentIndex,
  });

  final PageController controller;
  final int count;
  final int currentIndex;

  @override
  State<_CarouselIndicator> createState() => _CarouselIndicatorState();
}

class _CarouselIndicatorState extends State<_CarouselIndicator> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onPageChanged);
  }

  @override
  void didUpdateWidget(_CarouselIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onPageChanged);
      widget.controller.addListener(_onPageChanged);
    }
  }

  void _onPageChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onPageChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.count, (index) {
          final isActive =
              widget.controller.hasClients &&
              (widget.controller.page?.round() ?? widget.currentIndex) == index;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: isActive ? 20 : 6,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: isActive
                  ? AppColors.primary
                  : AppColors.primary.withValues(alpha: 0.25),
            ),
          );
        }),
      ),
    );
  }
}

class _StationPickerBottomSheet extends StatefulWidget {
  const _StationPickerBottomSheet({
    required this.title,
    required this.destinations,
    required this.selectedStation,
    required this.onSelect,
    required this.onSearch,
  });

  final String title;
  final List<dynamic> destinations;
  final StationData? selectedStation;
  final void Function(DestinationData destination, StationData station)
  onSelect;
  final Future<List<dynamic>> Function(String keyword) onSearch;

  @override
  State<_StationPickerBottomSheet> createState() =>
      _StationPickerBottomSheetState();
}

class _StationPickerBottomSheetState extends State<_StationPickerBottomSheet> {
  final _searchController = TextEditingController();
  List<dynamic> _filteredDestinations = [];
  bool _isSearching = false;
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _filteredDestinations = widget.destinations.cast();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) {
      setState(() {
        _filteredDestinations = widget.destinations.cast();
        _searchText = '';
        _isSearching = false;
      });
      return;
    }
    setState(() {
      _searchText = query;
      _isSearching = true;
    });
    _performSearch(query);
  }

  Future<void> _performSearch(String query) async {
    try {
      final results = await widget.onSearch(query);
      if (!mounted) return;
      if (query != _searchText) return;
      setState(() {
        _filteredDestinations = results;
        _isSearching = false;
      });
    } catch (_) {
      if (!mounted) return;
      if (query != _searchText) return;
      final localFiltered = widget.destinations
          .where((d) => (d.name as String).toLowerCase().contains(query))
          .toList();
      setState(() {
        _filteredDestinations = localFiltered;
        _isSearching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 16, 16),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
            ),
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF131B2E),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Color(0xFF717786)),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: TextField(
              controller: _searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Tìm thành phố hoặc trạm...',
                hintStyle: const TextStyle(
                  color: Color(0xFF717786),
                  fontSize: 14,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFF717786),
                  size: 20,
                ),
                filled: true,
                fillColor: const Color(0xFFF8FAFC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
              style: const TextStyle(fontSize: 14, color: Color(0xFF131B2E)),
            ),
          ),
          Expanded(child: _buildList()),
        ],
      ),
    );
  }

  Widget _buildList() {
    if (_isSearching) {
      return const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: AppColors.primary,
        ),
      );
    }

    if (_filteredDestinations.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off, color: Color(0xFF717786), size: 48),
            const SizedBox(height: 12),
            Text(
              _searchText.isEmpty
                  ? 'Không có điểm đến nào'
                  : 'Không tìm thấy "$_searchText"',
              style: const TextStyle(fontSize: 14, color: Color(0xFF717786)),
            ),
          ],
        ),
      );
    }

    final List<dynamic> allStations = [];
    for (final dest in _filteredDestinations) {
      final stations = dest.stations as List<dynamic>;
      for (final station in stations) {
        allStations.add({'dest': dest, 'station': station});
      }
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      itemCount: allStations.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final dest = allStations[index]['dest'];
        final station = allStations[index]['station'] as StationData;
        final isSelected = widget.selectedStation?.id == station.id;

        return GestureDetector(
          onTap: () => widget.onSelect(dest, station),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary.withValues(alpha: 0.06)
                  : const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
              border: isSelected ? Border.all(color: AppColors.primary) : null,
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color:
                        (isSelected
                                ? AppColors.primary
                                : const Color(0xFFFF6B6B))
                            .withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.directions_bus,
                    color: isSelected
                        ? AppColors.primary
                        : const Color(0xFFFF6B6B),
                    size: 18,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        station.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w500,
                          color: const Color(0xFF131B2E),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        [
                          dest.name,
                          station.address,
                        ].where((s) => s != null && s.isNotEmpty).join(' • '),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF717786),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                if (isSelected)
                  const Icon(
                    Icons.check_circle,
                    color: AppColors.primary,
                    size: 20,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
