import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/data/services/api/model/hotel/room_type_response.dart';
import 'package:travery_frontend/ui/admin/view_model/create_room_type_view_model.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'widgets/input_text_field.dart';
import 'widgets/dropdown_button.dart';
import 'widgets/large_button.dart';

class CreateRoomTypeScreen extends StatefulWidget {
  final CreateRoomTypeViewModel viewModel;
  final String hotelId;

  const CreateRoomTypeScreen({
    super.key,
    required this.viewModel,
    required this.hotelId,
  });

  @override
  State<CreateRoomTypeScreen> createState() => _CreateRoomTypeScreenState();
}

class _CreateRoomTypeScreenState extends State<CreateRoomTypeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _adultController = TextEditingController();
  final TextEditingController _childController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();

  RoomBedType? _selectedBedType;

  final List<String> _bedTypeLabels = ['Single', 'Double', 'Twin'];

  @override
  void initState() {
    super.initState();
    widget.viewModel.createRoomType.addListener(_onResult);
  }

  @override
  void didUpdateWidget(CreateRoomTypeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.createRoomType.removeListener(_onResult);
      widget.viewModel.createRoomType.addListener(_onResult);
    }
  }

  @override
  void dispose() {
    widget.viewModel.createRoomType.removeListener(_onResult);
    _nameController.dispose();
    _descriptionController.dispose();
    _adultController.dispose();
    _childController.dispose();
    _priceController.dispose();
    _areaController.dispose();
    super.dispose();
  }

  void _onResult() {
    final cmd = widget.viewModel.createRoomType;
    if (cmd.completed) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đã thêm loại phòng thành công'),
          backgroundColor: Colors.green,
        ),
      );
      context.pop();
    } else if (cmd.error) {
      if (!mounted) return;
      final result = cmd.result;
      String errorMessage = 'Thêm loại phòng thất bại';
      if (result is Error<String>) {
        errorMessage = result.error.toString().replaceAll('Exception: ', '');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
      );
      cmd.clearResult();
    }
  }

  RoomBedType? _bedTypeFromLabel(String? label) {
    switch (label) {
      case 'Single':
        return RoomBedType.single;
      case 'Double':
        return RoomBedType.double_;
      case 'Twin':
        return RoomBedType.twin;
      default:
        return null;
    }
  }

  String? _labelFromBedType(RoomBedType? type) {
    if (type == null) return null;
    switch (type) {
      case RoomBedType.single:
        return 'Single';
      case RoomBedType.double_:
        return 'Double';
      case RoomBedType.twin:
        return 'Twin';
    }
  }

  void _submit() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập tên loại phòng')),
      );
      return;
    }
    if (_selectedBedType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng chọn loại giường')),
      );
      return;
    }
    final priceText = _priceController.text.trim();
    if (priceText.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Vui lòng nhập giá tiền')));
      return;
    }
    final price = double.tryParse(priceText);
    if (price == null || price <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Giá tiền không hợp lệ')));
      return;
    }

    final adultText = _adultController.text.trim();
    final childText = _childController.text.trim();
    final areaText = _areaController.text.trim();

    widget.viewModel.createRoomType.execute((
      hotelId: widget.hotelId,
      name: name,
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      capacityAdults: adultText.isEmpty ? null : int.tryParse(adultText),
      capacityChildren: childText.isEmpty ? null : int.tryParse(childText),
      basePrice: price,
      bedType: _selectedBedType!,
      area: areaText.isEmpty ? null : int.tryParse(areaText),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Thêm Loại phòng mới',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Cung cấp các thông tin cần thiết',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 24),
              InputTextField(
                label: 'Tên loại phòng',
                textholder: 'Nhập tên loại phòng',
                controller: _nameController,
                textInputType: TextInputType.text,
                prefixIcon: const Icon(
                  Icons.format_size,
                  color: Colors.black54,
                ),
                suffixIcon: const Icon(
                  Icons.edit,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              InputTextField(
                label: 'Mô tả (tuỳ chọn)',
                textholder: 'Nhập mô tả loại phòng',
                controller: _descriptionController,
                textInputType: TextInputType.multiline,
                prefixIcon: const Icon(
                  Icons.description_outlined,
                  color: Colors.black54,
                ),
                suffixIcon: const Icon(
                  Icons.edit,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              CustomDropdownButton(
                label: 'Loại giường',
                textholder: 'Chọn loại giường',
                items: _bedTypeLabels,
                value: _labelFromBedType(_selectedBedType),
                prefixIcon: const Icon(
                  Icons.bed_outlined,
                  color: Colors.black54,
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedBedType = _bedTypeFromLabel(value);
                  });
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: InputTextField(
                      label: 'Số người lớn',
                      textholder: 'Nhập số người lớn',
                      controller: _adultController,
                      textInputType: TextInputType.number,
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: Colors.black54,
                      ),
                      suffixIcon: const Icon(
                        Icons.edit,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: InputTextField(
                      label: 'Số trẻ em',
                      textholder: 'Nhập số trẻ em',
                      controller: _childController,
                      textInputType: TextInputType.number,
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: Colors.black54,
                      ),
                      suffixIcon: const Icon(
                        Icons.edit,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              InputTextField(
                label: 'Giá tiền / đêm (VND)',
                textholder: 'Nhập số tiền',
                controller: _priceController,
                textInputType: TextInputType.number,
                prefixIcon: const Icon(
                  Icons.attach_money,
                  color: Colors.black54,
                ),
                suffixIcon: const Icon(
                  Icons.edit,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              InputTextField(
                label: 'Diện tích (m²) (tuỳ chọn)',
                textholder: 'Nhập diện tích',
                controller: _areaController,
                textInputType: TextInputType.number,
                prefixIcon: const Icon(
                  Icons.square_foot_outlined,
                  color: Colors.black54,
                ),
                suffixIcon: const Icon(
                  Icons.edit,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 32),
              ListenableBuilder(
                listenable: widget.viewModel.createRoomType,
                builder: (context, _) {
                  final running = widget.viewModel.createRoomType.running;
                  return LargeButton(
                    text: running ? 'Đang xử lý...' : 'Xác nhận',
                    color: const Color(0xFF0055C3),
                    onTap: running ? () {} : _submit,
                  );
                },
              ),
              const SizedBox(height: 12),
              LargeButton(
                text: 'Hủy bỏ',
                color: const Color(0xFFC80000),
                onTap: () => context.pop(),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
