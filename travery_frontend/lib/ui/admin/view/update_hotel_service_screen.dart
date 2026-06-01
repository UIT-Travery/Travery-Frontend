import 'package:flutter/material.dart';
import 'widgets/dropdown_button.dart';
import 'widgets/input_text_field.dart';
import 'widgets/large_button.dart';

class UpdateHotelServiceScreen extends StatefulWidget {
  final String? serviceType;
  final String? serviceName;
  final String? unit;
  final String? price;

  const UpdateHotelServiceScreen({
    super.key,
    this.serviceType,
    this.serviceName,
    this.unit,
    this.price,
  });

  @override
  State<UpdateHotelServiceScreen> createState() => _UpdateHotelServiceScreenState();
}

class _UpdateHotelServiceScreenState extends State<UpdateHotelServiceScreen> {
  late TextEditingController nameController;
  late TextEditingController priceController;

  String? selectedServiceType;
  String? selectedUnit;

  final List<String> serviceTypes = ['Spa', 'Ăn uống', 'Giặt ủi', 'Khác'];
  final List<String> units = ['Người', 'Suất', 'KG', 'Lần'];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.serviceName);
    priceController = TextEditingController(text: widget.price);
    selectedServiceType = widget.serviceType;
    selectedUnit = widget.unit;
    
    if (selectedServiceType != null && !serviceTypes.contains(selectedServiceType)) {
      serviceTypes.add(selectedServiceType!);
    }
    if (selectedUnit != null && !units.contains(selectedUnit)) {
      units.add(selectedUnit!);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
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
              'Chỉnh sửa Dịch vụ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Thay đổi thông tin của dịch vụ đã chọn',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 24),
            CustomDropdownButton(
              label: 'Loại dịch vụ',
              textholder: 'Chọn loại dịch vụ',
              prefixIcon: const Icon(Icons.category_outlined, color: Colors.black54),
              items: serviceTypes,
              value: selectedServiceType,
              onChanged: (value) {
                setState(() {
                  selectedServiceType = value;
                });
              },
            ),
            const SizedBox(height: 16),
            InputTextField(
              label: 'Tên dịch vụ',
              textholder: 'Nhập tên loại phòng', 
              prefixIcon: const Icon(Icons.text_format, color: Colors.black54),
              suffixIcon: const Icon(Icons.edit, color: Colors.black54),
              controller: nameController,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            CustomDropdownButton(
              label: 'Đơn vị tính',
              textholder: 'Chọn đơn vị tính',
              prefixIcon: const Icon(Icons.category_outlined, color: Colors.black54),
              items: units,
              value: selectedUnit,
              onChanged: (value) {
                setState(() {
                  selectedUnit = value;
                });
              },
            ),
            const SizedBox(height: 16),
            InputTextField(
              label: 'Đơn giá',
              textholder: 'Nhập số tiền',
              prefixIcon: const Icon(Icons.attach_money, color: Colors.black54),
              suffixIcon: const Icon(Icons.edit, color: Colors.black54),
              controller: priceController,
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 32),
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
