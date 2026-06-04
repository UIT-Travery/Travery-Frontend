import 'package:flutter/material.dart';
import 'widgets/dropdown_button.dart';
import 'widgets/input_text_field.dart';
import 'widgets/large_button.dart';

class UpdateHotelServiceScreen extends StatefulWidget {
  final String? serviceType;
  final String? serviceName;
  final String? unit;
  final String? price;
  final String? hotelId;
  final String? serviceId;
  final String? description;

  const UpdateHotelServiceScreen({
    super.key,
    this.serviceType,
    this.serviceName,
    this.unit,
    this.price,
    this.hotelId,
    this.serviceId,
    this.description,
  });

  @override
  State<UpdateHotelServiceScreen> createState() =>
      _UpdateHotelServiceScreenState();
}

class _UpdateHotelServiceScreenState extends State<UpdateHotelServiceScreen> {
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController unitController;
  late TextEditingController descriptionController;

  String? selectedServiceType;

  final List<String> serviceTypes = ['Ăn uống', 'Spa', 'Giặt ủi', 'Khác'];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.serviceName);
    priceController = TextEditingController(text: widget.price);
    unitController = TextEditingController(text: widget.unit);
    descriptionController = TextEditingController(text: widget.description);
    selectedServiceType = widget.serviceType;

    if (selectedServiceType != null &&
        !serviceTypes.contains(selectedServiceType)) {
      selectedServiceType = serviceTypes.last;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    unitController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _submit() {
    // TODO: wire up UpdateHotelServiceViewModel when update endpoint is available
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Chức năng cập nhật đang được phát triển'),
        backgroundColor: Colors.orange,
      ),
    );
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
              style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 24),
            CustomDropdownButton(
              label: 'Loại dịch vụ',
              textholder: 'Chọn loại dịch vụ',
              prefixIcon:
                  const Icon(Icons.category_outlined, color: Colors.black54),
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
              textholder: 'Nhập tên dịch vụ',
              prefixIcon: const Icon(Icons.text_format, color: Colors.black54),
              suffixIcon: const Icon(Icons.edit, color: Colors.black54),
              controller: nameController,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            InputTextField(
              label: 'Đơn vị tính',
              textholder: 'Ví dụ: Người, Suất, KG, Lần...',
              prefixIcon:
                  const Icon(Icons.straighten_outlined, color: Colors.black54),
              suffixIcon: const Icon(Icons.edit, color: Colors.black54),
              controller: unitController,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            InputTextField(
              label: 'Đơn giá (VND)',
              textholder: 'Nhập số tiền',
              prefixIcon: const Icon(Icons.attach_money, color: Colors.black54),
              suffixIcon: const Icon(Icons.edit, color: Colors.black54),
              controller: priceController,
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            InputTextField(
              label: 'Mô tả (tuỳ chọn)',
              textholder: 'Nhập mô tả dịch vụ',
              prefixIcon:
                  const Icon(Icons.description_outlined, color: Colors.black54),
              suffixIcon: const Icon(Icons.edit, color: Colors.black54),
              controller: descriptionController,
              textInputType: TextInputType.multiline,
            ),
            const SizedBox(height: 32),
            LargeButton(
              text: 'Xác nhận',
              onTap: _submit,
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
