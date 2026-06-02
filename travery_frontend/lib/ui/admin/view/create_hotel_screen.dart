import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/ui/admin/view_model/create_hotel_view_model.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_theme.dart';
import 'widgets/input_text_field.dart';
import 'widgets/dropdown_button.dart';
import 'widgets/input_button.dart';
import 'add_hotel_info_screen.dart';
import 'widgets/large_button.dart';

// No room data here anymore

class CreateHotelScreen extends StatefulWidget {
  const CreateHotelScreen({super.key, required this.viewModel});
  final CreateHotelViewModel viewModel;

  @override
  State<CreateHotelScreen> createState() => _CreateHotelScreenState();
}

class _CreateHotelScreenState extends State<CreateHotelScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  String? _selectedCity;
  String? _selectedPolicy;
  final _descriptionController = TextEditingController();

  String _checkInTime = "12:00";
  String _checkOutTime = "12:00";

  // ── Lifecycle ──────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    widget.viewModel.createHotel.addListener(_onCreateHotelChanged);
  }

  @override
  void dispose() {
    widget.viewModel.createHotel.removeListener(_onCreateHotelChanged);
    _nameController.dispose();
    _addressController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // ── Command listener ───────────────────────────────────────────────────────

  void _onCreateHotelChanged() {
    final cmd = widget.viewModel.createHotel;
    if (cmd.completed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã thêm khách sạn: ${_nameController.text.trim()}'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      context.pop();
    } else if (cmd.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Không thể thêm khách sạn. Vui lòng thử lại.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  // ── Actions ────────────────────────────────────────────────────────────────

  void _onNext() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập tên khách sạn'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    // In real scenario we could save it to viewModel, but for now navigate
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddHotelInfoScreen()),
    );
  }

  Future<void> _selectTime(BuildContext context, bool isCheckIn) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 12, minute: 0),
    );
    if (picked != null) {
      setState(() {
        final timeStr =
            '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
        if (isCheckIn) {
          _checkInTime = timeStr;
        } else {
          _checkOutTime = timeStr;
        }
      });
    }
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
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              _buildHeader(),
              const SizedBox(height: 24),
              _buildSectionTitle(Icons.bed_outlined, 'Thông tin khách sạn'),
              const SizedBox(height: 16),
              InputTextField(
                label: 'Tên khách sạn',
                textholder: 'Nhập tên khách sạn',
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
              CustomDropdownButton(
                label: 'Tỉnh, thành phố',
                textholder: 'Chọn tỉnh, thành phố',
                prefixIcon: const Icon(
                  Icons.location_city,
                  size: 20,
                  color: Colors.black87,
                ),
                items: const [
                  'Hà Nội',
                  'TP. Hồ Chí Minh',
                  'Đà Nẵng',
                  'Hải Phòng',
                ],
                value: _selectedCity,
                onChanged: (val) => setState(() => _selectedCity = val),
              ),
              const SizedBox(height: 16),
              InputTextField(
                label: 'Địa chỉ chi tiết',
                textholder: 'Nhập địa chỉ chi tiết',
                prefixIcon: const Icon(
                  Icons.location_on_outlined,
                  size: 20,
                  color: Colors.black87,
                ),
                suffixIcon: const Icon(
                  Icons.edit,
                  size: 16,
                  color: Colors.black54,
                ),
                controller: _addressController,
                textInputType: TextInputType.streetAddress,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: InputButton(
                      label: 'Thời gian check-in',
                      textholder: _checkInTime,
                      prefixIcon: const Icon(
                        Icons.access_time,
                        size: 20,
                        color: Colors.black87,
                      ),
                      suffixIcon: const Icon(
                        Icons.edit,
                        size: 16,
                        color: Colors.black54,
                      ),
                      onTap: () => _selectTime(context, true),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: InputButton(
                      label: 'Thời gian check-out',
                      textholder: _checkOutTime,
                      prefixIcon: const Icon(
                        Icons.access_time,
                        size: 20,
                        color: Colors.black87,
                      ),
                      suffixIcon: const Icon(
                        Icons.edit,
                        size: 16,
                        color: Colors.black54,
                      ),
                      onTap: () => _selectTime(context, false),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomDropdownButton(
                label: 'Chính sách',
                textholder: 'Chọn chính sách',
                prefixIcon: const Icon(
                  Icons.receipt_long,
                  size: 20,
                  color: Colors.black87,
                ),
                items: const ['Miễn phí hủy phòng', 'Không hoàn tiền'],
                value: _selectedPolicy,
                onChanged: (val) => setState(() => _selectedPolicy = val),
              ),
              const SizedBox(height: 16),
              InputTextField(
                label: 'Mô tả',
                textholder: 'Nhập mô tả...',
                controller: _descriptionController,
                textInputType: TextInputType.multiline,
                maxLines: 4,
                suffixIcon: const Icon(
                  Icons.edit,
                  size: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Cơ sở vật chất',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors
                      .textPrimary, // Ensure this exists, or use Colors.black
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.primaryDarkBlackBlue),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add, color: AppColors.textPrimary),
                      const SizedBox(width: 8),
                      Text(
                        'Chọn cơ sở vật chất',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: AppTextTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              LargeButton(
                text: 'Tiếp tục',
                onTap: widget.viewModel.createHotel.running ? null : _onNext,
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
      listenable: widget.viewModel.createHotel,
      builder: (context, _) {
        final isRunning = widget.viewModel.createHotel.running;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Thêm khách sạn',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDarkBlackBlue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Nhập thông tin khách sạn và phòng',
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

  // removed image upload
}
