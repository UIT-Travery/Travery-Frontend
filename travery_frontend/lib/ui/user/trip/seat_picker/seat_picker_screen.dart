import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/trip/seat_picker/view_models/seat_picker_view_model.dart';
import 'package:travery_frontend/data/models/trip/trip_search_item.dart';
import 'package:travery_frontend/ui/user/widgets/user_app_bar.dart';

class SeatPickerScreen extends StatefulWidget {
  const SeatPickerScreen({super.key});

  @override
  State<SeatPickerScreen> createState() => _SeatPickerScreenState();
}

class _SeatPickerScreenState extends State<SeatPickerScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final trip = GoRouterState.of(context).extra as TripSearchItem?;
      if (trip != null) {
        final vm = context.read<SeatPickerViewModel>();
        vm.setTrip(trip);
        vm.loadSeats();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: UserAppBar(
        title: 'Chọn ghế',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Consumer<SeatPickerViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.grey),
                  const SizedBox(height: 12),
                  Text(vm.error ?? 'Lỗi'),
                  ElevatedButton(
                    onPressed: vm.loadSeats,
                    child: const Text('Thử lại'),
                  ),
                ],
              ),
            );
          }
          if (vm.seatData == null) {
            return const Center(child: Text('Không có dữ liệu ghế'));
          }

          final seatData = vm.seatData!;
          return Column(
            children: [
              _buildSeatCount(seatData.availableSeats),
              Expanded(
                child: seatData.isDoubleDecker
                    ? _buildDoubleDeckView(vm)
                    : _buildSingleDeckView(vm),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Consumer<SeatPickerViewModel>(
        builder: (context, vm, _) {
          if (vm.selectedSeats.isEmpty) return const SizedBox.shrink();
          return _buildBottomBar(context, vm);
        },
      ),
    );
  }

  Widget _buildSeatCount(int availableSeats) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: Text(
          'Còn $availableSeats chỗ',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0058BC),
          ),
        ),
      ),
    );
  }

  // ── SINGLE DECK VIEW ──────────────────────────────────────────
  Widget _buildSingleDeckView(SeatPickerViewModel vm) {
    final seats = vm.seatsForActiveDeck;
    if (seats.isEmpty) return const SizedBox.shrink();
    return Column(
      children: [
        _buildLegend(),
        Expanded(
          child: _SeatGrid(seats: seats, vm: vm),
        ),
      ],
    );
  }

  // ── DOUBLE DECK VIEW ─────────────────────────────────────────
  Widget _buildDoubleDeckView(SeatPickerViewModel vm) {
    final lowerSeats = vm.seatsForLowerDeck;
    final upperSeats = vm.seatsForUpperDeck;

    return Column(
      children: [
        _buildLegend(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tầng dưới
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _DeckLabel(
                        label: 'Tầng dưới',
                        color: const Color(0xFFF2F3FF),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: _SeatGrid(
                          seats: lowerSeats,
                          vm: vm,
                          seatColor: const Color(0xFFF2F3FF),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Tầng trên
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _DeckLabel(
                        label: 'Tầng trên',
                        color: const Color(0xFFE0E8FF),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: _SeatGrid(
                          seats: upperSeats,
                          vm: vm,
                          seatColor: const Color(0xFFE0E8FF),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLegend() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      child: Row(
        children: [
          _legendDot(const Color(0xFFF2F3FF), 'Trống'),
          const SizedBox(width: 20),
          _legendDot(AppColors.primary, 'Đang chọn'),
          const SizedBox(width: 20),
          _legendDot(const Color(0xFFE2E8F0), 'Đã đặt'),
        ],
      ),
    );
  }

  Widget _legendDot(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF717786)),
        ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context, SeatPickerViewModel vm) {
    final seats = vm.selectedSeats;
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        MediaQuery.of(context).padding.bottom + 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${seats.length} ghế đã chọn',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF131B2E),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      seats.map((s) => s.seatName).join(', '),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF414755),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                _formatPrice(vm.totalPrice),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              context.push(
                Routes.tripBookingInput,
                extra: {'trip': vm.trip, 'seats': vm.selectedSeats},
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Tiếp tục',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }
}

// ─────────────────────────────────────────────────────────────────
// DECK LABEL
// ─────────────────────────────────────────────────────────────────

class _DeckLabel extends StatelessWidget {
  const _DeckLabel({required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF414755),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────
// SEAT GRID (reusable)
// ─────────────────────────────────────────────────────────────────

class _SeatGrid extends StatelessWidget {
  const _SeatGrid({required this.seats, required this.vm, this.seatColor});

  final List<dynamic> seats;
  final SeatPickerViewModel vm;
  final Color? seatColor;

  @override
  Widget build(BuildContext context) {
    if (seats.isEmpty) return const SizedBox.shrink();

    final rows = <int, List<dynamic>>{};
    for (final seat in seats) {
      rows.putIfAbsent(seat.rowNumber, () => []).add(seat);
    }
    final sortedRows = rows.keys.toList()..sort();

    return Container(
      decoration: BoxDecoration(
        color: seatColor ?? const Color(0xFFF2F3FF),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: sortedRows.length,
        itemBuilder: (context, index) {
          final rowNum = sortedRows[index];
          final rowSeats = rows[rowNum]!;
          rowSeats.sort((a, b) => a.columnNumber.compareTo(b.columnNumber));

          return Container(
            margin: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                SizedBox(
                  width: 28,
                  child: Center(
                    child: Text(
                      '$rowNum',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF717786),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: rowSeats.map((seat) {
                      return _SeatButton(seat: seat, vm: vm);
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _SeatButton extends StatelessWidget {
  const _SeatButton({required this.seat, required this.vm});
  final dynamic seat;
  final SeatPickerViewModel vm;

  @override
  Widget build(BuildContext context) {
    final isSelected = vm.isSeatSelected(seat);
    final isAvailable = seat.isAvailable;

    return GestureDetector(
      onTap: isAvailable ? () => vm.toggleSeat(seat) : null,
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : isAvailable
              ? const Color(0xFFFFFFFF)
              : const Color(0xFFE2E8F0),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primary : const Color(0xFFE2E8F0),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Center(
          child: isSelected
              ? const Icon(Icons.check, color: Colors.white, size: 16)
              : Text(
                  seat.seatName,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: isAvailable
                        ? const Color(0xFF131B2E)
                        : const Color(0xFFB0B8C9),
                  ),
                ),
        ),
      ),
    );
  }
}
