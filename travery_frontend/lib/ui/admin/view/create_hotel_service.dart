import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/data/services/api/model/hotel/hotel_service_response.dart';
import 'package:travery_frontend/ui/admin/view_model/create_hotel_service_view_model.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'widgets/dropdown_button.dart';
import 'widgets/input_text_field.dart';
import 'widgets/large_button.dart';

class CreateHotelServiceScreen extends StatefulWidget {
  final CreateHotelServiceViewModel viewModel;
  final String hotelId;

  const CreateHotelServiceScreen({
    super.key,
    required this.viewModel,
    required this.hotelId,
  });

  @override
  State<CreateHotelServiceScreen> createState() =>
      _CreateHotelServiceScreenState();
}

class _CreateHotelServiceScreenState extends State<CreateHotelServiceScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  HotelServiceCategory? _selectedCategory;

  final List<String> _categoryLabels = ['Ăn uống', 'Spa', 'Giặt ủi', 'Khác'];

  @override
  void initState() {
    super.initState();
    widget.viewModel.createService.addListener(_onResult);
  }

  @override
  void didUpdateWidget(CreateHotelServiceScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.createService.removeListener(_onResult);
      widget.viewModel.createService.addListener(_onResult);
    }
  }

  @override
  void dispose() {
    widget.viewModel.createService.removeListener(_onResult);
    _nameController.dispose();
    _priceController.dispose();
    _unitController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _onResult() {
    final cmd = widget.viewModel.createService;
    if (cmd.completed) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đã thêm dịch vụ thành công'),
          backgroundColor: Colors.green,
        ),
      );
      context.pop();
    } else if (cmd.error) {
      if (!mounted) return;
      final result = cmd.result;
      String errorMessage = 'Thêm dịch vụ thất bại';
      if (result is Error) {
        errorMessage = result.error.toString().replaceAll('Exception: ', '');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
      cmd.clearResult();
    }
  }

  HotelServiceCategory? _categoryFromLabel(String? label) {
    switch (label) {
      case 'Ăn uống':
        return HotelServiceCategory.food;
      case 'Spa':
        return HotelServiceCategory.spa;
      case 'Giặt ủi':
        return HotelServiceCategory.laundry;
      case 'Khác':
        return HotelServiceCategory.other;
      default:
        return null;
    }
  }

  String? _labelFromCategory(HotelServiceCategory? cat) {
    if (cat == null) return null;
    switch (cat) {
      case HotelServiceCategory.food:
        return 'Ăn uống';
      case HotelServiceCategory.spa:
        return 'Spa';
      case HotelServiceCategory.laundry:
        return 'Giặt ủi';
      case HotelServiceCategory.other:
        return 'Khác';
    }
  }

  void _submit() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập tên dịch vụ')),
      );
      return;
    }
    if (_selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng chọn loại dịch vụ')),
      );
      return;
    }
    final unit = _unitController.text.trim();
    if (unit.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập đơn vị tính')),
      );
      return;
    }
    final priceText = _priceController.text.trim();
    if (priceText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập giá tiền')),
      );
      return;
    }
    final price = double.tryParse(priceText);
    if (price == null || price < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Giá tiền không hợp lệ')),
      );
      return;
    }

    widget.viewModel.createService.execute((
      hotelId: widget.hotelId,
      name: name,
      category: _selectedCategory!,
      price: price,
      unit: unit,
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Thêm Dịch vụ mới',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Cung cấp các thông tin dịch vụ cần thiết',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 24),
            CustomDropdownButton(
              label: 'Loại dịch vụ',
              textholder: 'Chọn loại dịch vụ',
              prefixIcon:
                  const Icon(Icons.category_outlined, color: Colors.black54),
              items: _categoryLabels,
              value: _labelFromCategory(_selectedCategory),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = _categoryFromLabel(value);
                });
              },
            ),
            const SizedBox(height: 16),
            InputTextField(
              label: 'Tên dịch vụ',
              textholder: 'Nhập tên dịch vụ',
              prefixIcon: const Icon(Icons.text_format, color: Colors.black54),
              suffixIcon: const Icon(Icons.edit, color: Colors.black54),
              controller: _nameController,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            InputTextField(
              label: 'Đơn vị tính',
              textholder: 'Ví dụ: Người, Suất, KG, Lần...',
              prefixIcon: const Icon(Icons.straighten_outlined, color: Colors.black54),
              suffixIcon: const Icon(Icons.edit, color: Colors.black54),
              controller: _unitController,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            InputTextField(
              label: 'Đơn giá (VND)',
              textholder: 'Nhập số tiền',
              prefixIcon: const Icon(Icons.attach_money, color: Colors.black54),
              suffixIcon: const Icon(Icons.edit, color: Colors.black54),
              controller: _priceController,
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            InputTextField(
              label: 'Mô tả (tuỳ chọn)',
              textholder: 'Nhập mô tả dịch vụ',
              prefixIcon: const Icon(Icons.description_outlined, color: Colors.black54),
              suffixIcon: const Icon(Icons.edit, color: Colors.black54),
              controller: _descriptionController,
              textInputType: TextInputType.multiline,
            ),
            const SizedBox(height: 32),
            ListenableBuilder(
              listenable: widget.viewModel.createService,
              builder: (context, _) {
                final running = widget.viewModel.createService.running;
                return LargeButton(
                  text: running ? 'Đang xử lý...' : 'Xác nhận',
                  onTap: running ? () {} : _submit,
                );
              },
            ),
            const SizedBox(height: 12),
            LargeButton(
              text: 'Hủy bỏ',
              color: const Color(0xFFCC0000),
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
