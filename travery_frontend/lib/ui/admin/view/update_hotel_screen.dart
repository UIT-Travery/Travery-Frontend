import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/ui/admin/view_model/update_hotel_view_model.dart';
import 'package:travery_frontend/ui/admin/view/widgets/room_card.dart';
import 'package:travery_frontend/ui/admin/view/widgets/dropdown_button.dart';
import 'package:travery_frontend/ui/admin/view/widgets/input_text_field.dart';
import 'package:travery_frontend/ui/admin/view/widgets/large_button.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_theme.dart';

class _RoomData {
  final TextEditingController numberController;
  final TextEditingController priceController;
  final TextEditingController capacityController;
  final TextEditingController maxAdultsController;
  final TextEditingController maxChildrenController;
  String? type;

  _RoomData({
    String? initialNumber,
    String? initialPrice,
    String? initialCapacity,
    String? initialMaxAdults,
    String? initialMaxChildren,
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

class UpdateHotelScreen extends StatefulWidget {
  /// The hotel ID to load and update. Required for API integration.
  final String? hotelId;
  final UpdateHotelViewModel viewModel;

  const UpdateHotelScreen({super.key, required this.viewModel, this.hotelId});

  @override
  State<UpdateHotelScreen> createState() => _UpdateHotelScreenState();
}

class _UpdateHotelScreenState extends State<UpdateHotelScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  String? _selectedCity;

  final List<_RoomData> _rooms = [];

  // ── Lifecycle ──────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    _rooms.add(_RoomData());

    widget.viewModel.updateHotel.addListener(_onUpdateHotelChanged);
    widget.viewModel.loadHotel.addListener(_onLoadHotelChanged);

    // Load hotel data if we have an ID
    if (widget.hotelId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.viewModel.loadHotel.execute(widget.hotelId!);
      });
    }
  }

  @override
  void didUpdateWidget(UpdateHotelScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.hotelId != oldWidget.hotelId && widget.hotelId != null) {
      widget.viewModel.loadHotel.execute(widget.hotelId!);
    }
  }

  @override
  void dispose() {
    widget.viewModel.updateHotel.removeListener(_onUpdateHotelChanged);
    widget.viewModel.loadHotel.removeListener(_onLoadHotelChanged);
    _nameController.dispose();
    _addressController.dispose();
    for (var room in _rooms) {
      room.dispose();
    }
    super.dispose();
  }

  // ── Command listeners ──────────────────────────────────────────────────────

  void _onLoadHotelChanged() {
    final cmd = context.read<UpdateHotelViewModel>().loadHotel;
    if (cmd.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Không thể tải thông tin khách sạn.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
    // Populate fields when hotel is loaded
    // (When real API is connected, fill controllers from cmd.result)
  }

  void _onUpdateHotelChanged() {
    final cmd = context.read<UpdateHotelViewModel>().updateHotel;
    if (cmd.completed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Đã cập nhật khách sạn: ${_nameController.text.trim()}',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      context.pop();
    } else if (cmd.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Không thể cập nhật khách sạn. Vui lòng thử lại.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  // ── Actions ────────────────────────────────────────────────────────────────

  void _onSave() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập tên khách sạn'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    if (_addressController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập địa chỉ'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    if (_selectedCity == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng chọn tỉnh/thành phố'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    widget.viewModel.updateHotel.execute((
      id: widget.hotelId ?? '',
      name: _nameController.text.trim(),
      address: _addressController.text.trim(),
      starRating: 5,
      cityProvince: _selectedCity!,
      status: 'ACTIVE',
    ));
  }

  void _addRoom() => setState(() => _rooms.add(_RoomData()));

  void _removeRoom(int index) {
    setState(() {
      _rooms[index].dispose();
      _rooms.removeAt(index);
    });
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
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
              const SizedBox(height: 16),
              LargeButton(
                text: 'Lưu',
                onTap: widget.viewModel.updateHotel.running ? null : _onSave,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ── Builders ───────────────────────────────────────────────────────────────

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
    return ListenableBuilder(
      listenable: widget.viewModel.updateHotel,
      builder: (context, _) {
        final isRunning = widget.viewModel.updateHotel.running;
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
      },
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
          const Text('Ảnh khách sạn', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
