import 'package:flutter/material.dart';
import 'widgets/dropdown_button.dart';
import 'widgets/input_text_field.dart';
import 'widgets/large_button.dart';

class CreateAmenityScreen extends StatefulWidget {
  const CreateAmenityScreen({super.key});

  @override
  State<CreateAmenityScreen> createState() => _CreateAmenityScreenState();
}

class _CreateAmenityScreenState extends State<CreateAmenityScreen> {
  final TextEditingController nameController = TextEditingController();
  String? selectedAmenityType;
  final List<String> amenityTypes = ['Khách sạn', 'Phòng', 'Khác'];

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FB),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Thêm Cơ sở vật chất',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Bổ sung các thông tin cần thiết',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF64748B),
              ),
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
                    child: const Icon(
                      Icons.category_outlined,
                      color: Color(0xFF64748B),
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Icon',
                    style: TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            CustomDropdownButton(
              label: 'Loại cơ sở vật chất',
              textholder: 'Chọn loại cơ sở vật chất',
              prefixIcon: const Icon(Icons.category_outlined, color: Colors.black54),
              items: amenityTypes,
              value: selectedAmenityType,
              onChanged: (value) {
                setState(() {
                  selectedAmenityType = value;
                });
              },
            ),
            const SizedBox(height: 16),
            InputTextField(
              label: 'Tên cơ sở vật chất',
              textholder: 'Nhập tên loại phòng', 
              prefixIcon: const Icon(Icons.text_format, color: Colors.black54),
              suffixIcon: const Icon(Icons.edit, color: Colors.black54),
              controller: nameController,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 48),
            LargeButton(
              text: 'Xác nhận',
              onTap: () {
                // Submit action
              },
            ),
            const SizedBox(height: 12),
            LargeButton(
              text: 'Hủy bỏ',
              color: const Color(0xFFCC0000), // Red color
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
