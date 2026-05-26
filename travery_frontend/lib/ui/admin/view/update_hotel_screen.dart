import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/ui/admin/view/widgets/room_card.dart';
import 'package:travery_frontend/ui/admin/view/widgets/dropdown_button.dart';
import 'package:travery_frontend/ui/admin/view/widgets/input_text_field.dart';
import '../../core/themes/app_colors.dart';

class RoomData {
  final TextEditingController numberController;
  final TextEditingController priceController;
  final TextEditingController capacityController;
  final TextEditingController maxAdultsController;
  final TextEditingController maxChildrenController;
  String? type;

  RoomData({
    String? initialNumber,
    String? initialPrice,
    String? initialCapacity,
    String? initialMaxAdults,
    String? initialMaxChildren,
    this.type,
  }) : numberController = TextEditingController(text: initialNumber),
       priceController = TextEditingController(text: initialPrice),
       capacityController = TextEditingController(text: initialCapacity),
       maxAdultsController = TextEditingController(text: initialMaxAdults),
       maxChildrenController = TextEditingController(text: initialMaxChildren);

  void dispose() {
    numberController.dispose();
    priceController.dispose();
    capacityController.dispose();
    maxAdultsController.dispose();
    maxChildrenController.dispose();
  }
}

class Room {
  final TextEditingController numberController;
  String? type;

  Room({String? initialNumber, this.type})
    : numberController = TextEditingController(text: initialNumber);

  void dispose() {
    numberController.dispose();
  }
}

class UpdateHotelScreen extends StatefulWidget {
  const UpdateHotelScreen({super.key});

  @override
  State<UpdateHotelScreen> createState() => _UpdateHotelScreenState();
}

class _UpdateHotelScreenState extends State<UpdateHotelScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  String? _selectedCity;

  final List<RoomData> _rooms = [];

  @override
  void initState() {
    super.initState();
    // Initialize with mock values from Image 4
    _rooms.add(RoomData(initialNumber: '101', type: 'Đôi'));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    for (var room in _rooms) {
      room.dispose();
    }
    super.dispose();
  }

  void _addRoom() {
    setState(() {
      _rooms.add(RoomData());
    });
  }

  void _removeRoom(int index) {
    setState(() {
      _rooms[index].dispose();
      _rooms.removeAt(index);
    });
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
              _buildSectionTitle(Icons.bed_outlined, 'Thông tin khách sạn'),
              const SizedBox(height: 16),
              _buildHotelImage(),
              const SizedBox(height: 24),
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
              const SizedBox(height: 32),
              _buildSectionTitle(Icons.list_alt, 'Danh sách các phòng'),
              const SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _rooms.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final roomNum = (index + 1).toString().padLeft(2, '0');
                  return RoomCard(
                    roomName: 'Phòng $roomNum',
                    roomNumberController: _rooms[index].numberController,
                    roomType: _rooms[index].type,
                    roomTypes: const ['Đơn', 'Đôi', 'Gia đình', 'VIP'],
                    onRoomTypeChanged: (val) =>
                        setState(() => _rooms[index].type = val),
                    onClose: _rooms.length > 1
                        ? () => _removeRoom(index)
                        : null,
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _addRoom,
                icon: const Icon(Icons.add, color: Colors.white, size: 18),
                label: const Text(
                  'Thêm phòng khác',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryDarkBlackBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
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
                'Chỉnh sửa khách sạn',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDarkBlackBlue,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Nhập thông tin khách sạn và phòng',
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

  Widget _buildHotelImage() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
          ), // Placeholder hotel image
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
