import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../domain/models/admin/business_room_type/business_room_type.dart';
import 'widgets/input_text_field.dart';
import 'widgets/dropdown_button.dart';
import 'widgets/large_button.dart';

class UpdateRoomTypeScreen extends StatefulWidget {
  final BusinessRoomType? roomType;

  const UpdateRoomTypeScreen({super.key, this.roomType});

  @override
  State<UpdateRoomTypeScreen> createState() => _UpdateRoomTypeScreenState();
}

class _UpdateRoomTypeScreenState extends State<UpdateRoomTypeScreen> {
  late TextEditingController _nameController;
  late TextEditingController _adultController;
  late TextEditingController _childController;
  late TextEditingController _priceController;

  String? _selectedBedType;
  final List<String> _bedTypes = ['Single', 'Double', 'Twin'];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.roomType?.name ?? 'Very VIP',
    );
    _adultController = TextEditingController(
      text: widget.roomType?.aldultCapacity.toString() ?? '2',
    );
    _childController = TextEditingController(
      text: widget.roomType?.childCapacity.toString() ?? '2',
    );
    _priceController = TextEditingController(
      text: widget.roomType != null
          ? widget.roomType!.pricePerNight.toStringAsFixed(0)
          : '2000000',
    );

    if (widget.roomType != null) {
      switch (widget.roomType!.bedType) {
        case BedType.single:
          _selectedBedType = 'Single';
          break;
        case BedType.double:
          _selectedBedType = 'Double';
          break;
        case BedType.twin:
          _selectedBedType = 'Twin';
          break;
      }
    } else {
      _selectedBedType = 'Twin';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _adultController.dispose();
    _childController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Chỉnh sửa Loại phòng',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Chỉnh sửa thông tin của loại phòng đã chọn',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            InputTextField(
              label: 'Tên loại phòng',
              textholder: 'Nhập tên loại phòng',
              controller: _nameController,
              textInputType: TextInputType.text,
              prefixIcon: const Icon(Icons.format_size, color: Colors.black54),
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
              items: _bedTypes,
              value: _selectedBedType,
              prefixIcon: const Icon(Icons.bed_outlined, color: Colors.black54),
              onChanged: (value) {
                setState(() {
                  _selectedBedType = value;
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
              label: 'Giá tiền / đêm',
              textholder: 'Nhập số tiền',
              controller: _priceController,
              textInputType: TextInputType.number,
              prefixIcon: const Icon(Icons.attach_money, color: Colors.black54),
              suffixIcon: const Icon(
                Icons.edit,
                size: 20,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 32),
            LargeButton(
              text: 'Xác nhận chỉnh sửa',
              color: const Color(0xFF0055C3),
              onTap: () {
                // Handle confirm edit
              },
            ),
            const SizedBox(height: 12),
            LargeButton(
              text: 'Hủy bỏ',
              color: const Color(0xFFC80000), // Red color
              onTap: () {
                context.pop();
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
