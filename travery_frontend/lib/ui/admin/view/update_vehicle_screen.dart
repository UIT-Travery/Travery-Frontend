import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/ui/admin/view_model/update_vehicle_view_model.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_theme.dart';
import 'widgets/input_text_field.dart';
import 'widgets/dropdown_button.dart';

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
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _licenseController = TextEditingController();
  final _plateController = TextEditingController();
  final _seatsController = TextEditingController();
  String? _selectedVehicleType;

  // ── Lifecycle ──────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    // Pre-populate with any existing values

    widget.viewModel.updateVehicle.addListener(_onUpdateVehicleChanged);
    widget.viewModel.loadVehicle.addListener(_onLoadVehicleChanged);

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
    _nameController.dispose();
    _phoneController.dispose();
    _licenseController.dispose();
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
    }
    // When real API is connected, fill controllers from cmd.result here.
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

  // ── Actions ────────────────────────────────────────────────────────────────

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

    widget.viewModel.updateVehicle.execute((
      id: widget.vehicleId ?? '',
      registrationNumber: _plateController.text.trim(),
      model: _nameController.text.trim(),
      type: _selectedVehicleType!,
      seatCount: seatCount,
      isAvailable: true,
    ));
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(),
              const SizedBox(height: 20),
              _buildHeader(),
              const SizedBox(height: 24),
              _buildSectionTitle(Icons.person_outline, 'Thông tin tài xế'),
              const SizedBox(height: 16),
              _buildDriverProfileImage(),
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
        final isRunning = widget.viewModel.updateVehicle.running;
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
            Row(
              children: [
                TextButton(
                  onPressed: isRunning ? null : () => context.pop(),
                  child: const Text(
                    'Hủy',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: isRunning ? null : _onSave,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryDarkBlackBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: isRunning
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Lưu',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ],
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

  Widget _buildDriverProfileImage() {
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
          const Text('Thêm ảnh đại diện tài xế', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
