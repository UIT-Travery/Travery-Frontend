import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/ui/admin/view_model/create_hotel_view_model.dart';
import 'package:travery_frontend/utils/core_result.dart';
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
  const AddHotelInfoScreen({
    super.key,
    required this.viewModel,
    required this.payload,
  });

  final CreateHotelViewModel viewModel;
  final CreateHotelPayload payload;

  @override
  State<AddHotelInfoScreen> createState() => _AddHotelInfoScreenState();
}

class _AddHotelInfoScreenState extends State<AddHotelInfoScreen> {
  final List<RoomData> _rooms = [RoomData()];
  bool _isSaving = false;

  final List<XFile> _pickedImages = [];
  int _thumbnailIndex = 0;
  final ImagePicker _picker = ImagePicker();

  // ── Lifecycle ──────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    widget.viewModel.createHotel.addListener(_onHotelCreated);
  }

  @override
  void didUpdateWidget(covariant AddHotelInfoScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.createHotel.removeListener(_onHotelCreated);
      widget.viewModel.createHotel.addListener(_onHotelCreated);
    }
  }

  @override
  void dispose() {
    widget.viewModel.createHotel.removeListener(_onHotelCreated);
    for (var room in _rooms) {
      room.dispose();
    }
    super.dispose();
  }

  // ── Command listener ───────────────────────────────────────────────────────

  void _onHotelCreated() async {
    final cmd = widget.viewModel.createHotel;
    if (cmd.completed && cmd.result is Ok<String>) {
      final hotelId = (cmd.result as Ok<String>).value;
      await _saveRoomsAndImages(hotelId);
    } else if (cmd.error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Không thể tạo khách sạn. Vui lòng thử lại.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      setState(() => _isSaving = false);
    }
  }

  Future<void> _pickImages() async {
    final List<XFile> images = await _picker.pickMultiImage();
    if (images.isNotEmpty) {
      setState(() {
        _pickedImages.addAll(images);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _pickedImages.removeAt(index);
      if (_thumbnailIndex >= _pickedImages.length) {
        _thumbnailIndex = 0;
      } else if (_thumbnailIndex == index) {
        _thumbnailIndex = 0;
      } else if (_thumbnailIndex > index) {
        _thumbnailIndex--;
      }
    });
  }

  void _setThumbnail(int index) {
    setState(() {
      _thumbnailIndex = index;
    });
  }

  void _onSave() {
    for (var room in _rooms) {
      if (room.numberController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vui lòng nhập số phòng cho tất cả các phòng'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
    }

    setState(() {
      _isSaving = true;
    });

    widget.viewModel.createHotel.execute(widget.payload);
  }

  Future<void> _saveRoomsAndImages(String hotelId) async {
    try {
      final adminRepo = context.read<AdminRepository>();

      // Upload images
      if (_pickedImages.isNotEmpty) {
        final uploadResult = await adminRepo.uploadHotelImages(
          hotelId: hotelId,
          filePaths: _pickedImages.map((e) => e.path).toList(),
        );

        if (uploadResult is Ok<List<dynamic>>) {
          final uploadedImages = uploadResult.value;
          if (uploadedImages.isNotEmpty &&
              _thumbnailIndex < uploadedImages.length) {
            final thumbnailId = uploadedImages[_thumbnailIndex]['id'] as String;
            await adminRepo.setHotelThumbnail(
              hotelId: hotelId,
              imageId: thumbnailId,
            );
          }
        }
      }

      // Create rooms
      for (var room in _rooms) {
        final roomTypeResult = await adminRepo.createHotelRoomType(
          hotelId: hotelId,
          name: room.type ?? 'Đơn',
          description: 'Phòng ${room.type ?? 'Đơn'}',
          basePrice: 500000,
          bedType: 'SINGLE',
          capacityAdults: 2,
          capacityChildren: 0,
          area: 30,
        );

        if (roomTypeResult is Ok<String>) {
          await adminRepo.createHotelRoom(
            hotelId: hotelId,
            roomNumber: room.numberController.text.trim(),
            floor: 1,
            roomTypeId: roomTypeResult.value,
          );
        } else {
          throw Exception(
            'Không thể tạo loại phòng cho phòng ${room.numberController.text}',
          );
        }
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đã lưu thông tin khách sạn thành công!'),
          behavior: SnackBarBehavior.floating,
        ),
      );

      context.pop(true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Có lỗi xảy ra: $e'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildSectionTitle(Icons.image_outlined, 'Ảnh khách sạn'),
              const SizedBox(height: 16),
              _buildImageGallery(),
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
                text: _isSaving ? 'Đang lưu...' : 'Lưu',
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
                'Thêm ảnh và phòng',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDarkBlackBlue,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Tải ảnh lên và nhập thông tin các phòng',
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

  Widget _buildImageGallery() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_pickedImages.isNotEmpty)
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _pickedImages.length + 1,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                if (index == _pickedImages.length) {
                  return GestureDetector(
                    onTap: _pickImages,
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.blue.shade200,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add_photo_alternate_outlined,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                    ),
                  );
                }

                final isThumbnail = index == _thumbnailIndex;
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () => _setThumbnail(index),
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isThumbnail
                                ? Colors.green
                                : Colors.transparent,
                            width: 3,
                          ),
                          image: DecorationImage(
                            image: FileImage(File(_pickedImages[index].path)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    if (isThumbnail)
                      Positioned(
                        bottom: 4,
                        left: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'Ảnh bìa',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: GestureDetector(
                        onTap: () => _removeImage(index),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        else
          GestureDetector(
            onTap: _pickImages,
            child: Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image_outlined, color: Colors.black54, size: 30),
                  SizedBox(height: 8),
                  Text(
                    'Tải ảnh lên',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        const SizedBox(height: 8),
        Text(
          'Chạm vào ảnh để chọn làm ảnh bìa (thumbnail)',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
