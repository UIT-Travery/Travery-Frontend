import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/themes/app_colors.dart';
import 'widgets/input_text_field.dart';
import 'widgets/dropdown_button.dart';

class CreateVehicleScreen extends StatefulWidget {
  const CreateVehicleScreen({super.key});

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

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _licenseController.dispose();
    _plateController.dispose();
    _seatsController.dispose();
    super.dispose();
  }

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
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

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
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text(
                'Hủy',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryDarkBlackBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text('Lưu', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ],
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
}
