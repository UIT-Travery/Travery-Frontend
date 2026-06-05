import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/data/services/api/model/amenity/create_amenity_request.dart';
import 'package:travery_frontend/ui/admin/view_model/update_amenity_view_model.dart';
import 'widgets/dropdown_button.dart';
import 'widgets/input_text_field.dart';
import 'widgets/large_button.dart';

class UpdateAmenityScreen extends StatefulWidget {
  final UpdateAmenityViewModel viewModel;
  final String amenityId;
  final String? amenityType;
  final String? amenityName;
  final IconData? iconData;

  const UpdateAmenityScreen({
    super.key,
    required this.viewModel,
    required this.amenityId,
    this.amenityType,
    this.amenityName,
    this.iconData,
  });

  @override
  State<UpdateAmenityScreen> createState() => _UpdateAmenityScreenState();
}

class _UpdateAmenityScreenState extends State<UpdateAmenityScreen> {
  late TextEditingController _nameController;
  AmenityType? _selectedType;
  final List<String> _typeLabels = ['Khách sạn', 'Phòng'];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.amenityName ?? '');
    _selectedType = _typeFromLabel(widget.amenityType);
    widget.viewModel.updateAmenity.addListener(_onResult);
  }

  @override
  void didUpdateWidget(UpdateAmenityScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.updateAmenity.removeListener(_onResult);
      widget.viewModel.updateAmenity.addListener(_onResult);
    }
  }

  @override
  void dispose() {
    widget.viewModel.updateAmenity.removeListener(_onResult);
    _nameController.dispose();
    super.dispose();
  }

  void _onResult() {
    final cmd = widget.viewModel.updateAmenity;
    if (cmd.completed) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đã cập nhật cơ sở vật chất thành công'),
          backgroundColor: Colors.green,
        ),
      );
      context.pop();
    } else if (cmd.error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi: ${cmd.error.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _submit() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập tên cơ sở vật chất')),
      );
      return;
    }
    widget.viewModel.updateAmenity.execute((
      amenityId: widget.amenityId,
      name: name,
      type: _selectedType,
      iconImagePath: null,
    ));
  }

  AmenityType? _typeFromLabel(String? label) {
    if (label == 'Khách sạn') return AmenityType.hotelAmenity;
    if (label == 'Phòng') return AmenityType.roomAmenity;
    return null;
  }

  String? _labelFromType(AmenityType? type) {
    if (type == AmenityType.hotelAmenity) return 'Khách sạn';
    if (type == AmenityType.roomAmenity) return 'Phòng';
    return null;
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
              'Chỉnh sửa Cơ sở vật chất',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Chỉnh sửa thông tin cơ sở vật chất',
              style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCE6FB),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      widget.iconData ?? Icons.category_outlined,
                      color: const Color(0xFF64748B),
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Icon',
                    style: TextStyle(color: Color(0xFF64748B), fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            CustomDropdownButton(
              label: 'Loại cơ sở vật chất',
              textholder: 'Chọn loại cơ sở vật chất',
              prefixIcon: const Icon(
                Icons.category_outlined,
                color: Colors.black54,
              ),
              items: _typeLabels,
              value: _labelFromType(_selectedType),
              onChanged: (value) {
                setState(() => _selectedType = _typeFromLabel(value));
              },
            ),
            const SizedBox(height: 16),
            InputTextField(
              label: 'Tên cơ sở vật chất',
              textholder: 'Nhập tên cơ sở vật chất',
              prefixIcon: const Icon(Icons.text_format, color: Colors.black54),
              suffixIcon: const Icon(Icons.edit, color: Colors.black54),
              controller: _nameController,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 48),
            ListenableBuilder(
              listenable: widget.viewModel.updateAmenity,
              builder: (context, _) {
                final running = widget.viewModel.updateAmenity.running;
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
