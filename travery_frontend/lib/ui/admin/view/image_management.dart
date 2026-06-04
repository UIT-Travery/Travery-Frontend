import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travery_frontend/data/services/api/model/hotel/hotel_image_response.dart';
import 'package:travery_frontend/data/services/api/model/hotel/room_type_response.dart';
import 'package:travery_frontend/ui/admin/view_model/image_management_view_model.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'widgets/small_button.dart';

class ImageManagementScreen extends StatefulWidget {
  final ImageManagementViewModel viewModel;
  final String hotelId;

  const ImageManagementScreen({
    super.key,
    required this.viewModel,
    required this.hotelId,
  });

  @override
  State<ImageManagementScreen> createState() => _ImageManagementScreenState();
}

class _ImageManagementScreenState extends State<ImageManagementScreen> {
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadData.addListener(_onLoadResult);
    widget.viewModel.uploadHotelImages.addListener(_onUploadHotelResult);
    widget.viewModel.setHotelThumbnail.addListener(_onSetThumbnailResult);
    widget.viewModel.deleteHotelImage.addListener(_onDeleteHotelResult);
    widget.viewModel.uploadRoomTypeImage.addListener(_onUploadRoomTypeResult);
    widget.viewModel.deleteRoomTypeImage.addListener(_onDeleteRoomTypeResult);
    
    widget.viewModel.loadData.execute(widget.hotelId);
  }

  @override
  void didUpdateWidget(ImageManagementScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.loadData.removeListener(_onLoadResult);
      oldWidget.viewModel.uploadHotelImages.removeListener(_onUploadHotelResult);
      oldWidget.viewModel.setHotelThumbnail.removeListener(_onSetThumbnailResult);
      oldWidget.viewModel.deleteHotelImage.removeListener(_onDeleteHotelResult);
      oldWidget.viewModel.uploadRoomTypeImage.removeListener(_onUploadRoomTypeResult);
      oldWidget.viewModel.deleteRoomTypeImage.removeListener(_onDeleteRoomTypeResult);

      widget.viewModel.loadData.addListener(_onLoadResult);
      widget.viewModel.uploadHotelImages.addListener(_onUploadHotelResult);
      widget.viewModel.setHotelThumbnail.addListener(_onSetThumbnailResult);
      widget.viewModel.deleteHotelImage.addListener(_onDeleteHotelResult);
      widget.viewModel.uploadRoomTypeImage.addListener(_onUploadRoomTypeResult);
      widget.viewModel.deleteRoomTypeImage.addListener(_onDeleteRoomTypeResult);
      
      widget.viewModel.loadData.execute(widget.hotelId);
    }
  }

  @override
  void dispose() {
    widget.viewModel.loadData.removeListener(_onLoadResult);
    widget.viewModel.uploadHotelImages.removeListener(_onUploadHotelResult);
    widget.viewModel.setHotelThumbnail.removeListener(_onSetThumbnailResult);
    widget.viewModel.deleteHotelImage.removeListener(_onDeleteHotelResult);
    widget.viewModel.uploadRoomTypeImage.removeListener(_onUploadRoomTypeResult);
    widget.viewModel.deleteRoomTypeImage.removeListener(_onDeleteRoomTypeResult);
    super.dispose();
  }

  void _onLoadResult() {
    final cmd = widget.viewModel.loadData;
    if (cmd.error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Không thể tải dữ liệu ảnh'),
          backgroundColor: Colors.red,
          action: SnackBarAction(
            label: 'Thử lại',
            textColor: Colors.white,
            onPressed: () => widget.viewModel.loadData.execute(widget.hotelId),
          ),
        ),
      );
    }
  }

  void _showError(String message, dynamic error) {
    if (!mounted) return;
    String errorMessage = message;
    if (error is Error) {
      errorMessage = error.toString().replaceAll('Exception: ', '');
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
    );
  }

  void _showSuccess(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }

  void _onUploadHotelResult() {
    final cmd = widget.viewModel.uploadHotelImages;
    if (cmd.completed) {
      _showSuccess('Tải ảnh khách sạn lên thành công');
      cmd.clearResult();
    } else if (cmd.error) {
      _showError('Tải ảnh lên thất bại', cmd.result);
      cmd.clearResult();
    }
  }

  void _onSetThumbnailResult() {
    final cmd = widget.viewModel.setHotelThumbnail;
    if (cmd.completed) {
      _showSuccess('Đặt ảnh đại diện thành công');
      cmd.clearResult();
    } else if (cmd.error) {
      _showError('Đặt ảnh đại diện thất bại', cmd.result);
      cmd.clearResult();
    }
  }

  void _onDeleteHotelResult() {
    final cmd = widget.viewModel.deleteHotelImage;
    if (cmd.completed) {
      _showSuccess('Xóa ảnh khách sạn thành công');
      cmd.clearResult();
    } else if (cmd.error) {
      _showError('Xóa ảnh thất bại', cmd.result);
      cmd.clearResult();
    }
  }

  void _onUploadRoomTypeResult() {
    final cmd = widget.viewModel.uploadRoomTypeImage;
    if (cmd.completed) {
      _showSuccess('Tải ảnh loại phòng lên thành công');
      cmd.clearResult();
    } else if (cmd.error) {
      _showError('Tải ảnh lên thất bại', cmd.result);
      cmd.clearResult();
    }
  }

  void _onDeleteRoomTypeResult() {
    final cmd = widget.viewModel.deleteRoomTypeImage;
    if (cmd.completed) {
      _showSuccess('Xóa ảnh loại phòng thành công');
      cmd.clearResult();
    } else if (cmd.error) {
      _showError('Xóa ảnh thất bại', cmd.result);
      cmd.clearResult();
    }
  }

  Future<void> _pickHotelImages() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage();
      if (images.isNotEmpty) {
        widget.viewModel.uploadHotelImages.execute(images.map((e) => e.path).toList());
      }
    } catch (e) {
      _showError('Lỗi khi chọn ảnh', e);
    }
  }

  Future<void> _pickRoomTypeImages(String roomTypeId) async {
    try {
      final List<XFile> images = await _picker.pickMultiImage();
      if (images.isNotEmpty) {
        widget.viewModel.uploadRoomTypeImage.execute((roomTypeId: roomTypeId, filePaths: images.map((e) => e.path).toList()));
      }
    } catch (e) {
      _showError('Lỗi khi chọn ảnh', e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: Listenable.merge([
            widget.viewModel.loadData,
            widget.viewModel.uploadHotelImages,
            widget.viewModel.setHotelThumbnail,
            widget.viewModel.deleteHotelImage,
            widget.viewModel.uploadRoomTypeImage,
            widget.viewModel.deleteRoomTypeImage,
          ]),
          builder: (context, _) {
            final loadCmd = widget.viewModel.loadData;
            final isWorking = widget.viewModel.uploadHotelImages.running ||
                widget.viewModel.setHotelThumbnail.running ||
                widget.viewModel.deleteHotelImage.running ||
                widget.viewModel.uploadRoomTypeImage.running ||
                widget.viewModel.deleteRoomTypeImage.running;

            if (loadCmd.running) {
              return const Center(child: CircularProgressIndicator());
            }

            if (loadCmd.error && widget.viewModel.hotelImages.isEmpty && widget.viewModel.roomTypes.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, color: Color(0xFFCC0000), size: 48),
                    const SizedBox(height: 12),
                    const Text('Không thể tải dữ liệu', style: TextStyle(color: Color(0xFF64748B))),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () => widget.viewModel.loadData.execute(widget.hotelId),
                      child: const Text('Thử lại'),
                    ),
                  ],
                ),
              );
            }

            return Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Quản lý Hình ảnh',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Hình ảnh khách sạn và các loại phòng',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 24),
                      
                      // Hotel Images Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Ảnh Khách Sạn',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                          ),
                          SmallButton(
                            label: 'Thêm ảnh',
                            prefixIcon: const Icon(Icons.add_photo_alternate_outlined, size: 16, color: Colors.white),
                            color: const Color(0xFF0055C3),
                            onTap: isWorking ? () {} : _pickHotelImages,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildHotelImagesGrid(widget.viewModel.hotelImages),
                      const SizedBox(height: 32),

                      // Room Types Images Section
                      const Text(
                        'Ảnh Loại Phòng',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                      ),
                      const SizedBox(height: 16),
                      _buildRoomTypesList(widget.viewModel.roomTypes),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
                if (isWorking)
                  Container(
                    color: Colors.black12,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHotelImagesGrid(List<HotelImageResponse> images) {
    if (images.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Column(
          children: [
            Icon(Icons.image_not_supported_outlined, size: 48, color: Colors.grey[400]),
            const SizedBox(height: 12),
            Text('Chưa có ảnh nào', style: TextStyle(color: Colors.grey[500])),
          ],
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final image = images[index];
        return _buildHotelImageCard(image);
      },
    );
  }

  Widget _buildHotelImageCard(HotelImageResponse image) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: image.thumbnail ? const Color(0xFF0055C3) : Colors.grey[300]!,
          width: image.thumbnail ? 2 : 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            image.url,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.broken_image, color: Colors.grey[400]),
          ),
          if (image.thumbnail)
            Positioned(
              top: 4,
              left: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF0055C3),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text('Thumbnail', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ),
          Positioned(
            top: 4,
            right: 4,
            child: Row(
              children: [
                if (!image.thumbnail)
                  GestureDetector(
                    onTap: () => widget.viewModel.setHotelThumbnail.execute(image.id),
                    child: Container(
                      margin: const EdgeInsets.only(right: 4),
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.star_border, color: Colors.white, size: 16),
                    ),
                  ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Xác nhận xóa'),
                        content: const Text('Bạn có chắc chắn muốn xóa ảnh này không?'),
                        actions: [
                          TextButton(onPressed: () => context.pop(), child: const Text('Hủy')),
                          TextButton(
                            onPressed: () {
                              context.pop();
                              widget.viewModel.deleteHotelImage.execute(image.id);
                            },
                            child: const Text('Xóa', style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.delete_outline, color: Colors.white, size: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoomTypesList(List<RoomTypeResponse> roomTypes) {
    if (roomTypes.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Center(
          child: Text('Chưa có loại phòng nào', style: TextStyle(color: Colors.grey[500])),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: roomTypes.length,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        final rt = roomTypes[index];

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rt.name,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1E293B)),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Giá: ${(rt.basePrice / 1000).toStringAsFixed(0)}K đ',
                          style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
                        ),
                      ],
                    ),
                  ),
                  SmallButton(
                    label: 'Thêm ảnh',
                    prefixIcon: const Icon(Icons.add_photo_alternate_outlined, size: 16, color: Colors.white),
                    color: const Color(0xFF0055C3),
                    onTap: widget.viewModel.uploadRoomTypeImage.running ? () {} : () => _pickRoomTypeImages(rt.id),
                  ),
                ],
              ),
              if (rt.images.isNotEmpty) ...[
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1,
                  ),
                  itemCount: rt.images.length,
                  itemBuilder: (context, imgIndex) {
                    final image = rt.images[imgIndex];
                    return _buildRoomTypeImageCard(rt.id, image);
                  },
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildRoomTypeImageCard(String roomTypeId, HotelImageResponse image) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            image.url,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.broken_image, color: Colors.grey[400]),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Xác nhận xóa'),
                    content: const Text('Bạn có chắc chắn muốn xóa ảnh của loại phòng này?'),
                    actions: [
                      TextButton(onPressed: () => context.pop(), child: const Text('Hủy')),
                      TextButton(
                        onPressed: () {
                          context.pop();
                          widget.viewModel.deleteRoomTypeImage.execute((roomTypeId: roomTypeId, imageId: image.id));
                        },
                        child: const Text('Xóa', style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.delete_outline, color: Colors.white, size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
