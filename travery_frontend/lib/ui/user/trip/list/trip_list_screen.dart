import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/data/models/trip/trip_search_item.dart';
import 'package:travery_frontend/ui/user/trip/list/view_models/trip_list_view_model.dart';

class TripListScreen extends StatefulWidget {
  const TripListScreen({super.key});

  @override
  State<TripListScreen> createState() => _TripListScreenState();
}

class _TripListScreenState extends State<TripListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
      if (extra != null) {
        final origin = extra['origin'];
        final destination = extra['destination'];
        final departureDate = extra['departureDate'] as DateTime;
        final vm = context.read<TripListViewModel>();
        vm.setSearchParams(
          origin: origin,
          destination: destination,
          departureDate: departureDate,
        );
        vm.search();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Consumer<TripListViewModel>(
        builder: (context, vm, _) {
          return Column(
            children: [
              _buildHeader(context, vm),
              _DateStrip(vm: vm),
              _FilterChips(vm: vm),
              Expanded(
                child: vm.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : vm.error != null
                    ? _buildError(vm)
                    : vm.trips.isEmpty
                    ? _buildEmpty()
                    : _buildTripList(vm),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context, TripListViewModel vm) {
    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.fromLTRB(
        12,
        MediaQuery.of(context).padding.top + 8,
        16,
        16,
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop(),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${vm.origin?.name ?? 'Điểm đi'} → ${vm.destination?.name ?? 'Điểm đến'}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (vm.departureDate != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    _formatHeaderDate(vm.departureDate!),
                    style: const TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  String _formatHeaderDate(DateTime dt) {
    const weekdays = [
      'Thứ 2',
      'Thứ 3',
      'Thứ 4',
      'Thứ 5',
      'Thứ 6',
      'Thứ 7',
      'CN',
    ];
    return '${weekdays[dt.weekday - 1]}, ${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';
  }

  Widget _buildTripList(TripListViewModel vm) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: vm.trips.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final trip = vm.trips[index];
        return _TripCard(
          trip: trip,
          onTap: () => context.push(Routes.tripSeatPicker, extra: trip),
        );
      },
    );
  }

  Widget _buildError(TripListViewModel vm) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.grey),
          const SizedBox(height: 12),
          Text(
            vm.error ?? 'Có lỗi xảy ra',
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 8),
          ElevatedButton(onPressed: vm.search, child: const Text('Thử lại')),
        ],
      ),
    );
  }

  Widget _buildEmpty() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.directions_bus_outlined,
            size: 64,
            color: Color(0xFFE2E8F0),
          ),
          SizedBox(height: 16),
          Text(
            'Không tìm thấy chuyến xe nào',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF414755),
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Thử thay đổi bộ lọc hoặc ngày khởi hành',
            style: TextStyle(fontSize: 13, color: Color(0xFF717786)),
          ),
        ],
      ),
    );
  }
}

class _ClampingScrollPhysics extends ClampingScrollPhysics {
  const _ClampingScrollPhysics({super.parent});

  @override
  _ClampingScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return _ClampingScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    if (value < 0) return 0;
    return super.applyBoundaryConditions(position, value);
  }
}

class _DateStrip extends StatefulWidget {
  const _DateStrip({required this.vm});
  final TripListViewModel vm;

  @override
  State<_DateStrip> createState() => _DateStripState();
}

class _DateStripState extends State<_DateStrip> {
  static const _totalDays = 90;
  late final List<DateTime> _dates;
  late final ScrollController _scrollController;
  bool _hasScrolled = false;

  @override
  void initState() {
    super.initState();
    _dates = List.generate(
      _totalDays,
      (i) => DateTime.now().add(Duration(days: i)),
    );
    _scrollController = ScrollController();
    Future.microtask(_scrollToSelected);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSelected() {
    if (_hasScrolled) return;
    final selectedDate = widget.vm.departureDate ?? widget.vm.initDepartureDate;
    if (selectedDate == null) return;
    final index = _dates.indexWhere((d) => _isSameDay(d, selectedDate));
    if (index < 0) return;
    const chipWidth = 64.0;
    const chipSpacing = 8.0;
    final offset = index * (chipWidth + chipSpacing) + 12;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(
          offset.clamp(0.0, _scrollController.position.maxScrollExtent),
        );
      }
    });
    _hasScrolled = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 68,
        child: ListView.separated(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          physics: const _ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: _dates.length,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (context, index) {
            final date = _dates[index];
            final isSelected = _isSameDay(
              date,
              widget.vm.departureDate ??
                  widget.vm.initDepartureDate ??
                  DateTime.now(),
            );
            return _DateChip(
              date: date,
              isSelected: isSelected,
              onTap: () => widget.vm.setDepartureDate(date),
            );
          },
        ),
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

class _DateChip extends StatelessWidget {
  const _DateChip({
    required this.date,
    required this.isSelected,
    required this.onTap,
  });
  final DateTime date;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const weekdays = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : const Color(0xFFF8F9FA),
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? null
              : Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weekdays[date.weekday - 1],
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white70 : const Color(0xFF717786),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${date.day}/${date.month}',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.white : const Color(0xFF131B2E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChips extends StatelessWidget {
  const _FilterChips({required this.vm});
  final TripListViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _PriceChip(vm: vm),
            const SizedBox(width: 8),
            _CoachChip(vm: vm),
            const SizedBox(width: 8),
            _TimeChip(vm: vm),
          ],
        ),
      ),
    );
  }
}

class _FilterPill extends StatelessWidget {
  const _FilterPill({
    required this.label,
    required this.isActive,
    required this.icon,
    required this.onTap,
  });
  final String label;
  final bool isActive;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : const Color(0xFFF8F9FA),
          borderRadius: BorderRadius.circular(20),
          border: isActive ? null : Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isActive ? Colors.white : const Color(0xFF414755),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isActive ? Colors.white : const Color(0xFF414755),
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.keyboard_arrow_down,
              size: 16,
              color: isActive ? Colors.white70 : const Color(0xFF717786),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceChip extends StatelessWidget {
  const _PriceChip({required this.vm});
  final TripListViewModel vm;

  @override
  Widget build(BuildContext context) {
    final hasSort = vm.priceSort != 0;
    final isUp = vm.priceSort == 1;
    final label = !hasSort ? 'Giá' : (isUp ? 'Giá ↑' : 'Giá ↓');

    return _FilterPill(
      label: label,
      isActive: hasSort,
      icon: Icons.attach_money,
      onTap: () => _showPriceSheet(context),
    );
  }

  void _showPriceSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => _PriceFilterSheet(vm: vm),
    );
  }
}

class _CoachChip extends StatelessWidget {
  const _CoachChip({required this.vm});
  final TripListViewModel vm;

  @override
  Widget build(BuildContext context) {
    final selected = vm.selectedCoachType;
    final label = selected == null ? 'Loại xe' : selected.label;

    return _FilterPill(
      label: label,
      isActive: selected != null,
      icon: Icons.directions_bus,
      onTap: () => _showCoachSheet(context),
    );
  }

  void _showCoachSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => _CoachTypeFilterSheet(vm: vm),
    );
  }
}

class _TimeChip extends StatelessWidget {
  const _TimeChip({required this.vm});
  final TripListViewModel vm;

  String _shortLabel(TimeSlot? slot) {
    if (slot == null) return 'Giờ';
    switch (slot) {
      case TimeSlot.earlyMorning:
        return 'Rạng sáng';
      case TimeSlot.morning:
        return 'Sáng';
      case TimeSlot.afternoon:
        return 'Chiều';
      case TimeSlot.evening:
        return 'Tối';
    }
  }

  @override
  Widget build(BuildContext context) {
    final selected = vm.selectedTimeSlot;
    final label = _shortLabel(selected);

    return _FilterPill(
      label: label,
      isActive: selected != null,
      icon: Icons.schedule,
      onTap: () => _showTimeSheet(context),
    );
  }

  void _showTimeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => _TimeSlotFilterSheet(vm: vm),
    );
  }
}

class _PriceFilterSheet extends StatelessWidget {
  const _PriceFilterSheet({required this.vm});
  final TripListViewModel vm;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  'Sắp xếp theo giá',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF131B2E),
                  ),
                ),
                const Spacer(),
                if (vm.priceSort != 0)
                  GestureDetector(
                    onTap: () {
                      vm.resetPriceSort();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.close, size: 14, color: AppColors.primary),
                          SizedBox(width: 4),
                          Text(
                            'Xóa lọc',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _PriceOption(
            label: 'Giá thấp đến cao',
            value: -1,
            current: vm.priceSort,
            vm: vm,
          ),
          _PriceOption(
            label: 'Giá cao đến thấp',
            value: 1,
            current: vm.priceSort,
            vm: vm,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _PriceOption extends StatelessWidget {
  const _PriceOption({
    required this.label,
    required this.value,
    required this.current,
    required this.vm,
  });
  final String label;
  final int value;
  final int current;
  final TripListViewModel vm;

  @override
  Widget build(BuildContext context) {
    final isSelected = current == value;
    return InkWell(
      onTap: () {
        vm.setPriceSort(value);
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected
                      ? AppColors.primary
                      : const Color(0xFF414755),
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check, color: AppColors.primary, size: 20),
          ],
        ),
      ),
    );
  }
}

class _CoachTypeFilterSheet extends StatelessWidget {
  const _CoachTypeFilterSheet({required this.vm});
  final TripListViewModel vm;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  'Loại ghế',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF131B2E),
                  ),
                ),
                const Spacer(),
                if (vm.selectedCoachType != null)
                  GestureDetector(
                    onTap: () {
                      vm.resetCoachType();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.close, size: 14, color: AppColors.primary),
                          SizedBox(width: 4),
                          Text(
                            'Xóa lọc',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _CoachOption(
            label: 'Ghế thường',
            value: CoachType.seat,
            current: vm.selectedCoachType,
            vm: vm,
          ),
          _CoachOption(
            label: 'Giường nằm',
            value: CoachType.bed,
            current: vm.selectedCoachType,
            vm: vm,
          ),
          _CoachOption(
            label: 'Limousine',
            value: CoachType.limousine,
            current: vm.selectedCoachType,
            vm: vm,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _CoachOption extends StatelessWidget {
  const _CoachOption({
    required this.label,
    required this.value,
    required this.current,
    required this.vm,
  });
  final String label;
  final CoachType? value;
  final CoachType? current;
  final TripListViewModel vm;

  @override
  Widget build(BuildContext context) {
    final isSelected = current == value;
    return InkWell(
      onTap: () {
        vm.setCoachType(value);
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected
                      ? AppColors.primary
                      : const Color(0xFF414755),
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check, color: AppColors.primary, size: 20),
          ],
        ),
      ),
    );
  }
}

class _TimeSlotFilterSheet extends StatelessWidget {
  const _TimeSlotFilterSheet({required this.vm});
  final TripListViewModel vm;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  'Khung giờ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF131B2E),
                  ),
                ),
                const Spacer(),
                if (vm.selectedTimeSlot != null)
                  GestureDetector(
                    onTap: () {
                      vm.resetTimeSlot();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.close, size: 14, color: AppColors.primary),
                          SizedBox(width: 4),
                          Text(
                            'Xóa lọc',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _TimeOption(
            label: 'Rạng sáng (00:00 - 06:00)',
            value: TimeSlot.earlyMorning,
            current: vm.selectedTimeSlot,
            vm: vm,
          ),
          _TimeOption(
            label: 'Sáng (06:00 - 12:00)',
            value: TimeSlot.morning,
            current: vm.selectedTimeSlot,
            vm: vm,
          ),
          _TimeOption(
            label: 'Chiều (12:00 - 18:00)',
            value: TimeSlot.afternoon,
            current: vm.selectedTimeSlot,
            vm: vm,
          ),
          _TimeOption(
            label: 'Tối (18:00 - 24:00)',
            value: TimeSlot.evening,
            current: vm.selectedTimeSlot,
            vm: vm,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _TimeOption extends StatelessWidget {
  const _TimeOption({
    required this.label,
    required this.value,
    required this.current,
    required this.vm,
  });
  final String label;
  final TimeSlot? value;
  final TimeSlot? current;
  final TripListViewModel vm;

  @override
  Widget build(BuildContext context) {
    final isSelected = current == value;
    return InkWell(
      onTap: () {
        vm.setTimeSlot(value);
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected
                      ? AppColors.primary
                      : const Color(0xFF414755),
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check, color: AppColors.primary, size: 20),
          ],
        ),
      ),
    );
  }
}

class _TripCard extends StatelessWidget {
  const _TripCard({required this.trip, required this.onTap});
  final dynamic trip;
  final VoidCallback onTap;

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }

  String _formatTime(DateTime dt) {
    return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  String _formatDuration(DateTime start, DateTime end) {
    final diff = end.difference(start);
    final hours = diff.inHours;
    final minutes = diff.inMinutes % 60;
    return '${hours}h ${minutes}m';
  }

  String _coachLabel(String coachType) {
    switch (coachType.toUpperCase()) {
      case 'LIMOUSINE':
        return 'Ghế - Limousine';
      case 'BED':
        return 'Giường nằm';
      case 'SEAT':
      default:
        return 'Ghế';
    }
  }

  @override
  Widget build(BuildContext context) {
    final duration = _formatDuration(
      trip.departureTime as DateTime,
      trip.arrivalTime as DateTime,
    );
    final origin = trip.originDestination?.name ?? 'Điểm đi';
    final destination = trip.destinationDestination?.name ?? 'Điểm đến';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
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
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  _formatTime(trip.departureTime as DateTime),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF131B2E),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              color: Color(0xFFE2E8F0),
                              thickness: 1,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 14,
                              color: Color(0xFF717786),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: Color(0xFFE2E8F0),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        '_____________',
                        style: TextStyle(
                          color: Color(0xFFE2E8F0),
                          letterSpacing: 4,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  _formatTime(trip.arrivalTime as DateTime),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF131B2E),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.center,
              child: Text(
                duration,
                style: const TextStyle(fontSize: 10, color: Color(0xFF717786)),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    _formatPrice(trip.basePrice as double),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '•',
                      style: TextStyle(color: Color(0xFFE2E8F0)),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _coachLabel(trip.coachType as String),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF414755),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '•',
                      style: TextStyle(color: Color(0xFFE2E8F0)),
                    ),
                  ),
                  Text(
                    '${trip.availableSeats} seats left',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF717786),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    origin,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF131B2E),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F3FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.straighten,
                        size: 12,
                        color: Color(0xFF717786),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        duration,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF717786),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    destination,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF131B2E),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
