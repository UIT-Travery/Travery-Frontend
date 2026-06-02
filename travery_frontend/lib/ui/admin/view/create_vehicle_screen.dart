import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/domain/models/admin/business_coach_seat/business_coach_seat.dart';
import 'package:travery_frontend/ui/admin/view_model/create_vehicle_view_model.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_theme.dart';
import 'widgets/input_text_field.dart';
import 'widgets/dropdown_button.dart';
import 'widgets/large_button.dart';

class CreateVehicleScreen extends StatefulWidget {
  const CreateVehicleScreen({super.key, required this.viewModel});
  final CreateVehicleViewModel viewModel;

  @override
  State<CreateVehicleScreen> createState() => _CreateVehicleScreenState();
}

class _CreateVehicleScreenState extends State<CreateVehicleScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _licenseController = TextEditingController();
  final _plateController = TextEditingController();
  final _seatsController = TextEditingController();
  String? _selectedVehicleType;

  int _numberOfFloors = 1;
  final List<BusinessCoachSeat> _coachSeats = [];

  // ── Lifecycle ──────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    widget.viewModel.createVehicle.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant CreateVehicleScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.createVehicle.removeListener(_onResult);
      widget.viewModel.createVehicle.addListener(_onResult);
    }
  }

  @override
  void dispose() {
    widget.viewModel.createVehicle.removeListener(_onResult);
    _nameController.dispose();
    _phoneController.dispose();
    _licenseController.dispose();
    _plateController.dispose();
    _seatsController.dispose();
    super.dispose();
  }

  // ── Command listener ───────────────────────────────────────────────────────

  void _onResult() {
    final cmd = widget.viewModel.createVehicle;
    if (cmd.completed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã thêm phương tiện: ${_plateController.text.trim()}'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      context.pop();
    } else if (cmd.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Không thể thêm phương tiện. Vui lòng thử lại.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  // ── Actions ────────────────────────────────────────────────────────────────

  void _onSave() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập họ và tên'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    if (_phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập số điện thoại'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    if (_licenseController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập giấy phép lái xe'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
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

    widget.viewModel.createVehicle.execute((
      registrationNumber: _plateController.text.trim(),
      type: _selectedVehicleType!,
      layoutName: 'Layout - ${_plateController.text.trim()}',
      seatCount: seatCount,
      seatItems: _coachSeats,
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
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _buildHeader(),
              const SizedBox(height: 24),
              _buildSectionTitle(Icons.person_outline, 'Thông tin tài xế'),
              const SizedBox(height: 16),
              _buildImageUpload('Thêm ảnh đại diện tài xế'),
              const SizedBox(height: 24),
              InputTextField(
                label: 'Họ và tên',
                textholder: 'Nhập họ và tên',
                prefixIcon: const Icon(
                  Icons.text_format,
                  size: 20,
                  color: Colors.black87,
                ),
                suffixIcon: const Icon(
                  Icons.edit,
                  size: 16,
                  color: Colors.black54,
                ),
                controller: _nameController,
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              InputTextField(
                label: 'Số điện thoại',
                textholder: 'Nhập số điện thoại',
                prefixIcon: const Icon(
                  Icons.phone,
                  size: 20,
                  color: Colors.black87,
                ),
                suffixIcon: const Icon(
                  Icons.edit,
                  size: 16,
                  color: Colors.black54,
                ),
                controller: _phoneController,
                textInputType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              InputTextField(
                label: 'Giấy phép lái xe',
                textholder: 'Nhập số giấy phép lái xe',
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
                controller: _licenseController,
                textInputType: TextInputType.text,
              ),
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
              _buildSectionTitle(Icons.event_seat_outlined, 'Sơ đồ chỗ ngồi'),
              const SizedBox(height: 16),
              _buildFloorButtons(),
              const SizedBox(height: 24),
              _buildSeatMaps(),
              const SizedBox(height: 16),
              LargeButton(
                text: 'Lưu',
                onTap: widget.viewModel.createVehicle.running ? null : _onSave,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ── Builders ───────────────────────────────────────────────────────────────

  Widget _buildHeader() {
    return ListenableBuilder(
      listenable: widget.viewModel.createVehicle,
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
                    'Thêm phương tiện',
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

  Widget _buildImageUpload(String text) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.image_outlined,
              color: Colors.black54,
              size: 30,
            ),
          ),
          const SizedBox(height: 8),
          Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
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
