import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_theme.dart';
import 'widgets/room_card.dart';
import 'widgets/large_button.dart';

class RoomData {
  final TextEditingController numberController;
  String? type;

  RoomData({String? initialNumber, this.type})
    : numberController = TextEditingController(text: initialNumber);

  void dispose() {
    numberController.dispose();
  }
}

class AddHotelInfoScreen extends StatefulWidget {
  const AddHotelInfoScreen({super.key});

  @override
  State<AddHotelInfoScreen> createState() => _AddHotelInfoScreenState();
}

class _AddHotelInfoScreenState extends State<AddHotelInfoScreen> {
  final List<RoomData> _rooms = [RoomData()];
  bool _isSaving = false;

  @override
  void dispose() {
    for (var room in _rooms) {
      room.dispose();
    }
    super.dispose();
  }

  void _onSave() async {
    setState(() {
      _isSaving = true;
    });
    // Simulate save
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Đã lưu thông tin khách sạn'),
        behavior: SnackBarBehavior.floating,
      ),
    );
    // Go back or to another screen
    context.pop();
  }

  void _addRoom() => setState(() => _rooms.add(RoomData()));

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
              const SizedBox(height: 20),
              _buildHeader(),
              const SizedBox(height: 24),
              _buildSectionTitle(Icons.bed_outlined, 'Thông tin khách sạn'),
              const SizedBox(height: 16),
              _buildImageUpload('Thêm ảnh khách sạn'),
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
              const SizedBox(height: 16),
              LargeButton(
                text: 'Lưu',
                onTap: _isSaving ? null : _onSave,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
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
                'Thêm khách sạn',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDarkBlackBlue,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Nhập thông tin khách sạn và phòng',
                style: TextStyle(
                  fontSize: AppTextTheme.bodySmall,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
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
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.image_outlined, color: Colors.black54, size: 30),
          const SizedBox(height: 8),
          Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
