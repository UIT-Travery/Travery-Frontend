import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/domain/models/admin/business_coach/business_coach.dart';
import 'package:travery_frontend/domain/models/admin/business_coach_seat/business_coach_seat.dart';
import 'package:travery_frontend/ui/admin/view_model/update_vehicle_view_model.dart';
import 'package:travery_frontend/utils/core_result.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_theme.dart';
import 'widgets/input_text_field.dart';
import 'widgets/dropdown_button.dart';
import 'widgets/large_button.dart';

class UpdateVehicleScreen extends StatefulWidget {
  final UpdateVehicleViewModel viewModel;
  final String? vehicleId;

  const UpdateVehicleScreen({
    super.key,
    required this.viewModel,
    this.vehicleId,
  });

  @override
  State<UpdateVehicleScreen> createState() => _UpdateVehicleScreenState();
}

class _UpdateVehicleScreenState extends State<UpdateVehicleScreen> {
  final _plateController = TextEditingController();
  final _seatsController = TextEditingController();
  String? _selectedVehicleType;

  int _numberOfFloors = 1;
  final List<BusinessCoachSeat> _coachSeats = [];

  // ── Lifecycle ──────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    // Pre-populate with any existing values

    widget.viewModel.updateVehicle.addListener(_onUpdateVehicleChanged);
    widget.viewModel.loadVehicle.addListener(_onLoadVehicleChanged);
    widget.viewModel.deleteVehicle.addListener(_onDeleteVehicleChanged);

    if (widget.vehicleId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.viewModel.loadVehicle.execute(widget.vehicleId!);
      });
    }
  }

  @override
  void didUpdateWidget(UpdateVehicleScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.vehicleId != oldWidget.vehicleId && widget.vehicleId != null) {
      widget.viewModel.loadVehicle.execute(widget.vehicleId!);
    }
  }

  @override
  void dispose() {
    final vm = widget.viewModel;
    vm.updateVehicle.removeListener(_onUpdateVehicleChanged);
    vm.loadVehicle.removeListener(_onLoadVehicleChanged);
    vm.deleteVehicle.removeListener(_onDeleteVehicleChanged);
    _plateController.dispose();
    _seatsController.dispose();
    super.dispose();
  }

  // ── Command listeners ──────────────────────────────────────────────────────

  void _onLoadVehicleChanged() {
    final cmd = widget.viewModel.loadVehicle;
    if (cmd.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Không thể tải thông tin phương tiện.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else if (cmd.completed && cmd.result != null) {
      final result = cmd.result!;
      if (result is Ok<BusinessCoach>) {
        final coach = result.value;
        setState(() {
          _plateController.text = coach.plateNumber;
          _seatsController.text = coach.seatCount.toString();

          final ct = coach.coachType.toUpperCase();
          if (ct == 'BED' || ct.contains('GIƯỜNG') || ct.contains('SLEEPER')) {
            _selectedVehicleType = 'Xe giường nằm';
          } else if (ct == 'LIMOUSINE' || ct.contains('DU LỊCH')) {
            _selectedVehicleType = 'Xe du lịch';
          } else {
            _selectedVehicleType = 'Xe khách';
          }

          _coachSeats.clear();
          if (coach.seats != null) {
            _coachSeats.addAll(coach.seats!);
            if (_coachSeats.any((s) => s.tier == CoachSeatTier.upper)) {
              _numberOfFloors = 2;
            } else {
              _numberOfFloors = 1;
            }
          }
        });
      }
    }
  }

  void _onUpdateVehicleChanged() {
    final cmd = widget.viewModel.updateVehicle;
    if (cmd.completed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Đã cập nhật phương tiện: ${_plateController.text.trim()}',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      context.pop();
    } else if (cmd.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Không thể cập nhật phương tiện. Vui lòng thử lại.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _onDeleteVehicleChanged() {
    final cmd = widget.viewModel.deleteVehicle;
    if (cmd.completed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đã xóa phương tiện'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      context.pop();
    } else if (cmd.error) {
      final e = cmd.result as Error?;
      final errorMsg = e != null ? e.error.toString() : 'Không thể xóa phương tiện. Vui lòng thử lại.';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMsg),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  // ── Actions ────────────────────────────────────────────────────────────────

  void _onDelete() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xóa phương tiện'),
        content: const Text('Bạn có chắc chắn muốn xóa phương tiện này không?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (widget.vehicleId != null) {
                widget.viewModel.deleteVehicle.execute(widget.vehicleId!);
              }
            },
            child: const Text('Xóa', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
  }

  void _onSave() {
    if (_plateController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập biển số xe'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    if (_selectedVehicleType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng chọn loại xe'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final seatCount = int.tryParse(_seatsController.text.trim()) ?? 0;
    
    // In order to get the correct seatLayoutId, we must extract it from the loaded BusinessCoach.
    // If not available, we use a placeholder or handle the error.
    final result = widget.viewModel.loadVehicle.result;
    String layoutId = 'dummy-seat-layout';
    if (result != null && result is Ok<BusinessCoach>) {
      layoutId = result.value.seatLayoutId ?? layoutId;
    }

    widget.viewModel.updateVehicle.execute((
      id: widget.vehicleId ?? '',
      registrationNumber: _plateController.text.trim(),
      type: _selectedVehicleType!,
      seatLayoutId: layoutId,
      seatCount: seatCount,
      seatItems: _coachSeats,
      layoutName: 'Layout - ${_plateController.text.trim()}',
    ));
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildHeader(),
              const SizedBox(height: 32),
              _buildSectionTitle(
                Icons.directions_car_outlined,
                'Thông tin phương tiện',
              ),
              const SizedBox(height: 16),
              CustomDropdownButton(
                label: 'Loại xe',
                textholder: 'Chọn loại xe',
                prefixIcon: const Icon(
                  Icons.directions_bus,
                  size: 20,
                  color: Colors.black87,
                ),
                items: const ['Xe khách', 'Xe du lịch', 'Xe giường nằm'],
                value: _selectedVehicleType,
                onChanged: (val) => setState(() => _selectedVehicleType = val),
              ),
              const SizedBox(height: 16),
              InputTextField(
                label: 'Biển số xe',
                textholder: 'Nhập biển số xe',
                prefixIcon: const Icon(
                  Icons.numbers,
                  size: 20,
                  color: Colors.black87,
                ),
                suffixIcon: const Icon(
                  Icons.edit,
                  size: 16,
                  color: Colors.black54,
                ),
                controller: _plateController,
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              InputTextField(
                label: 'Số chỗ ngồi',
                textholder: 'Nhập số chỗ ngồi',
                prefixIcon: const Icon(
                  Icons.event_seat,
                  size: 20,
                  color: Colors.black87,
                ),
                suffixIcon: const Icon(
                  Icons.edit,
                  size: 16,
                  color: Colors.black54,
                ),
                controller: _seatsController,
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 32),
              _buildSectionTitle(Icons.view_module, 'Sơ đồ chỗ ngồi'),
              const SizedBox(height: 16),
              _buildFloorButtons(),
              const SizedBox(height: 24),
              _buildSeatMaps(),
              const SizedBox(height: 32),
              LargeButton(
                text: 'Lưu',
                onTap: widget.viewModel.updateVehicle.running ? null : _onSave,
              ),
              const SizedBox(height: 16),
              LargeButton(
                text: 'Xóa',
                color: AppColors.error,
                onTap: widget.viewModel.deleteVehicle.running ? null : _onDelete,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ── Builders ───────────────────────────────────────────────────────────────

  Widget _buildAppBar() {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.grid_view_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Travery Admin',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return ListenableBuilder(
      listenable: widget.viewModel.updateVehicle,
      builder: (context, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Chỉnh sửa chuyến xe',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDarkBlackBlue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Nhập thông tin phương tiện và tài xế để tạo chuyến xe',
                    style: TextStyle(
                      fontSize: AppTextTheme.bodySmall,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSectionTitle(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primaryDarkBlackBlue),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryDarkBlackBlue,
          ),
        ),
      ],
    );
  }

  Widget _buildFloorButtons() {
    return Row(
      children: [
        _buildFloorButton('1 tầng', 1),
        const SizedBox(width: 8),
        _buildFloorButton('2 tầng', 2),
      ],
    );
  }

  Widget _buildFloorButton(String label, int value) {
    final isSelected = _numberOfFloors == value;
    return InkWell(
      onTap: () {
        setState(() {
          _numberOfFloors = value;
          if (value == 1) {
            _coachSeats.removeWhere((s) => s.tier == CoachSeatTier.upper);
          }
        });
      },
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryDarkBlackBlue
              : AppColors.primaryDarkBlackBlue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.primaryDarkBlackBlue,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildSeatMaps() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildSeatMap('Tầng 1', CoachSeatTier.lower)),
        if (_numberOfFloors == 2) ...[
          const SizedBox(width: 16),
          Expanded(child: _buildSeatMap('Tầng 2', CoachSeatTier.upper)),
        ],
      ],
    );
  }

  Widget _buildSeatMap(String title, CoachSeatTier tier) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.primaryDarkBlackBlue,
            ),
          ),
          const SizedBox(height: 20),
          for (int row = 1; row <= 7; row++) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSeat(tier, 'A', row),
                _buildSeat(tier, 'B', row),
                _buildSeat(tier, 'C', row),
              ],
            ),
            if (row < 7) const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }

  void _toggleSeat(CoachSeatTier tier, String colName, int row) {
    final seatName = '$colName$row';
    final existingIndex = _coachSeats.indexWhere(
      (s) => s.seatName == seatName && s.tier == tier,
    );

    if (existingIndex != -1) {
      setState(() {
        _coachSeats.removeAt(existingIndex);
      });
    } else {
      CoachSeatPosition pos;
      if (row <= 2) {
        pos = CoachSeatPosition.front;
      } else if (row <= 5) {
        pos = CoachSeatPosition.middle;
      } else {
        pos = CoachSeatPosition.back;
      }

      int colNumber = colName == 'A' ? 1 : (colName == 'B' ? 2 : 3);

      setState(() {
        _coachSeats.add(
          BusinessCoachSeat(
            price: '0',
            tier: tier,
            position: pos,
            seatName: seatName,
            rowNumber: row,
            columnNumber: colNumber,
          ),
        );
      });
    }
  }

  Widget _buildSeat(CoachSeatTier tier, String colName, int row) {
    final seatName = '$colName$row';
    final isSelected = _coachSeats.any(
      (s) => s.seatName == seatName && s.tier == tier,
    );

    return InkWell(
      onTap: () => _toggleSeat(tier, colName, row),
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: 36,
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey[300],
          border: isSelected
              ? Border.all(color: AppColors.primaryDarkBlackBlue, width: 1.5)
              : null,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          seatName,
          style: const TextStyle(color: Colors.black87, fontSize: 14),
        ),
      ),
    );
  }
}
