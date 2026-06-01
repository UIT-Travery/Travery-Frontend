import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/input_text_field.dart';
import 'widgets/dropdown_button.dart';
import 'widgets/large_button.dart';

class CreateRoomTypeScreen extends StatefulWidget {
  const CreateRoomTypeScreen({super.key});

  @override
  State<CreateRoomTypeScreen> createState() => _CreateRoomTypeScreenState();
}

class _CreateRoomTypeScreenState extends State<CreateRoomTypeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _adultController = TextEditingController();
  final TextEditingController _childController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  String? _selectedBedType;
  final List<String> _bedTypes = ['Single', 'Double', 'Twin'];

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
              text: 'Xác nhận',
              color: const Color(0xFF0055C3),
              onTap: () {
                // Handle confirm
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
