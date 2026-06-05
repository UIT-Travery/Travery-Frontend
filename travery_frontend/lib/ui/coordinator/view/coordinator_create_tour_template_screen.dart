import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_input_field.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_dropdown_button.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_button.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_hotel_selection_bottomsheet.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_create_tour_template_view_model.dart';
import 'package:travery_frontend/utils/core_result.dart' as core_result;

class CoordinatorCreateTourTemplateScreen extends StatefulWidget {
  final CoordinatorCreateTourTemplateViewModel viewModel;

  const CoordinatorCreateTourTemplateScreen({
    super.key,
    required this.viewModel,
  });

  @override
  State<CoordinatorCreateTourTemplateScreen> createState() =>
      _CoordinatorCreateTourTemplateScreenState();
}

class _ItineraryEntry {
  final TextEditingController labelController;
  final TextEditingController descriptionController;
  String? imageUrl;
  File? imageFile;

  _ItineraryEntry()
    : labelController = TextEditingController(),
      descriptionController = TextEditingController();

  void dispose() {
    labelController.dispose();
    descriptionController.dispose();
  }
}

class _CoordinatorCreateTourTemplateScreenState
    extends State<CoordinatorCreateTourTemplateScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _adultPriceController = TextEditingController();
  final TextEditingController _childPriceController = TextEditingController();

  final TextEditingController _pickupLocationController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

  File? _thumbnailImage;
  final List<File> _otherImages = [];
  final ImagePicker _picker = ImagePicker();

  final List<_ItineraryEntry> _itineraries = [_ItineraryEntry()];

  String? _selectedHotelName;
  String? _selectedHotelId;

  @override
  void initState() {
    super.initState();
    widget.viewModel.createTemplate.addListener(_onCreateResult);
  }

  @override
  void didUpdateWidget(CoordinatorCreateTourTemplateScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.createTemplate.removeListener(_onCreateResult);
      widget.viewModel.createTemplate.addListener(_onCreateResult);
    }
  }

  @override
  void dispose() {
    widget.viewModel.createTemplate.removeListener(_onCreateResult);
    _nameController.dispose();
    _descriptionController.dispose();
    _adultPriceController.dispose();
    _childPriceController.dispose();
    _pickupLocationController.dispose();
    _destinationController.dispose();
    for (final e in _itineraries) {
      e.dispose();
    }
    super.dispose();
  }

  void _onCreateResult() {
    final cmd = widget.viewModel.createTemplate;
    if (cmd.completed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lộ trình đã được tạo thành công!'),
          backgroundColor: AppColors.success,
        ),
      );
      Navigator.of(context).pop(true);
    } else if (cmd.error) {
      final error = (cmd.result as core_result.Error).error;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi: ${error.toString()}'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  Future<void> _pickThumbnail() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _thumbnailImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickOtherImages() async {
    final pickedFiles = await _picker.pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      setState(() {
        _otherImages.addAll(pickedFiles.map((e) => File(e.path)));
      });
    }
  }

  void _removeOtherImage(int index) {
    setState(() {
      _otherImages.removeAt(index);
    });
  }

  Future<void> _pickItineraryImage(int index) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _itineraries[index].imageFile = File(pickedFile.path);
      });
    }
  }

  void _addItinerary() {
    setState(() {
      _itineraries.add(_ItineraryEntry());
    });
  }

  void _removeItinerary(int index) {
    setState(() {
      _itineraries[index].dispose();
      _itineraries.removeAt(index);
    });
  }

  void _onConfirm() {
    // Validate required fields
    final name = _nameController.text.trim();
    final description = _descriptionController.text.trim();
    final destinationId = _destinationController.text.trim();
    final pickupLocation = _pickupLocationController.text.trim();
    final adultPriceStr = _adultPriceController.text.trim();
    final childPriceStr = _childPriceController.text.trim();

    if (name.isEmpty ||
        destinationId.isEmpty ||
        pickupLocation.isEmpty ||
        adultPriceStr.isEmpty ||
        childPriceStr.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập đầy đủ thông tin bắt buộc'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    final adultPrice = double.tryParse(adultPriceStr);
    final childPrice = double.tryParse(childPriceStr);
    if (adultPrice == null || childPrice == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Giá tiền không hợp lệ'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (_itineraries.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng thêm ít nhất một lịch trình'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    final itineraries = <Map<String, dynamic>>[];
    for (int i = 0; i < _itineraries.length; i++) {
      final e = _itineraries[i];
      itineraries.add({
        'dayNumber': i + 1,
        'title': e.labelController.text.trim(),
        'description': e.descriptionController.text.trim(),
        'imageFile': e.imageFile,
      });
    }

    widget.viewModel.createTemplate.execute({
      'name': name,
      'description': description,
      'destinationId': destinationId,
      'hotelId': _selectedHotelId,
      'pickupLocation': pickupLocation,
      'pricePerAdult': adultPrice,
      'pricePerChild': childPrice,
      'isCustom': false,
      'itineraries': itineraries,
      'thumbnailImage': _thumbnailImage,
      'otherImages': _otherImages,
    });
  }

  void _openHotelSelection() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => CoordinatorHotelSelectionBottomsheet(
        onHotelSelected: (hotelName) {
          setState(() {
            _selectedHotelName = hotelName;
            // Hotel ID would come from the selection — store name as id for now
            _selectedHotelId = hotelName;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            // ── AppBar ───────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.textPrimary,
                      size: 26,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Tạo lộ trình mới',
                          style: TextStyle(
                            fontSize: AppTextTheme.headlineSmall,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Nhập các thông tin cần thiết để tạo lộ trình',
                          style: TextStyle(
                            fontSize: AppTextTheme.bodySmall,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Xác nhận button
                  ListenableBuilder(
                    listenable: widget.viewModel.createTemplate,
                    builder: (context, _) {
                      final isRunning = widget.viewModel.createTemplate.running;
                      return Material(
                        color: isRunning
                            ? AppColors.primaryDarkBlackBlue.withValues(
                                alpha: 0.5,
                              )
                            : AppColors.primaryDarkBlackBlue,
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: isRunning ? null : _onConfirm,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: isRunning
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text(
                                    'Xác nhận',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: AppTextTheme.bodyMedium,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // ── Scrollable Body ───────────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader('Ảnh Thumbnail & Các ảnh khác'),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: _pickThumbnail,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppColors.primaryLightWhiteBlue,
                              borderRadius: BorderRadius.circular(12),
                              image: _thumbnailImage != null
                                  ? DecorationImage(
                                      image: FileImage(_thumbnailImage!),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: _thumbnailImage == null
                                ? const Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add_photo_alternate, color: AppColors.primary, size: 30),
                                        SizedBox(height: 4),
                                        Text('Thumbnail', style: TextStyle(fontSize: 10, color: AppColors.primary)),
                                      ],
                                    ),
                                  )
                                : null,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ..._otherImages.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final file = entry.value;
                                  return Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        margin: const EdgeInsets.only(right: 12),
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryLightWhiteBlue,
                                          borderRadius: BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image: FileImage(file),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: -5,
                                        right: 5,
                                        child: GestureDetector(
                                          onTap: () => _removeOtherImage(index),
                                          child: Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                            child: const Icon(Icons.close, size: 16, color: Colors.red),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                                GestureDetector(
                                  onTap: _pickOtherImages,
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryLightWhiteBlue,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add_photo_alternate, color: AppColors.primary, size: 30),
                                          SizedBox(height: 4),
                                          Text('Thêm ảnh', style: TextStyle(fontSize: 10, color: AppColors.primary)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // ── Thông tin tour ───────────────────────────────────────
                    _buildSectionHeader('Thông tin tour'),
                    const SizedBox(height: 12),

                    // Tên tour
                    CoordinatorInputField(
                      label: 'Tên tour',
                      hintText: 'Nhập tên tour...',
                      controller: _nameController,
                      isMultipleLine: true,
                      suffixIcon: const Icon(
                        Icons.edit,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Mô tả
                    CoordinatorInputField(
                      label: 'Mô tả',
                      hintText: 'Nhập mô tả...',
                      controller: _descriptionController,
                      isMultipleLine: true,
                      suffixIcon: const Icon(
                        Icons.edit,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Giá người lớn & Giá trẻ em
                    Row(
                      children: [
                        Expanded(
                          child: CoordinatorInputField(
                            label: 'Giá người lớn',
                            hintText: 'Nhập giá...',
                            controller: _adultPriceController,
                            isMultipleLine: false,
                            suffixIcon: const Icon(
                              Icons.attach_money,
                              size: 18,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CoordinatorInputField(
                            label: 'Giá trẻ em',
                            hintText: 'Nhập giá...',
                            controller: _childPriceController,
                            isMultipleLine: false,
                            suffixIcon: const Icon(
                              Icons.attach_money,
                              size: 18,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Điểm khởi hành
                    CoordinatorInputField(
                      label: 'Điểm khởi hành',
                      hintText: 'Nhập điểm khởi hành...',
                      controller: _pickupLocationController,
                      prefixIcon: const Icon(
                        Icons.location_on_outlined,
                        size: 18,
                        color: AppColors.textPrimary,
                      ),
                      suffixIcon: const Icon(
                        Icons.edit,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Điểm đến
                    CoordinatorInputField(
                      label: 'Điểm đến',
                      hintText: 'Nhập điểm đến...',
                      controller: _destinationController,
                      prefixIcon: const Icon(
                        Icons.location_on_outlined,
                        size: 18,
                        color: AppColors.textPrimary,
                      ),
                      suffixIcon: const Icon(
                        Icons.edit,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ── Thông tin khách sạn ──────────────────────────────────
                    _buildSectionHeader('Thông tin khách sạn'),
                    const SizedBox(height: 12),

                    // Hotel picker button
                    GestureDetector(
                      onTap: _openHotelSelection,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.primaryDarkBlackBlue,
                            width: 1.5,
                          ),
                        ),
                        child: _selectedHotelName != null
                            ? Row(
                                children: [
                                  const Icon(
                                    Icons.hotel_outlined,
                                    color: AppColors.primary,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      _selectedHotelName!,
                                      style: const TextStyle(
                                        fontSize: AppTextTheme.bodyMedium,
                                        color: AppColors.textPrimary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.edit,
                                    size: 16,
                                    color: AppColors.textSecondary,
                                  ),
                                ],
                              )
                            : const Column(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: AppColors.primary,
                                    size: 22,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Chọn khách sạn và phòng',
                                    style: TextStyle(
                                      fontSize: AppTextTheme.bodyMedium,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ── Lịch trình ───────────────────────────────────────────
                    _buildSectionHeader('Lịch trình'),
                    const SizedBox(height: 12),

                    // Itinerary list
                    ...List.generate(_itineraries.length, (index) {
                      return _buildItineraryCard(index);
                    }),

                    const SizedBox(height: 16),

                    // + Thêm lịch trình button
                    CoordinatorButton(
                      text: 'Thêm lịch trình',
                      color: AppColors.primary,
                      prefixIcon: Icons.add,
                      onTap: _addItinerary,
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: AppTextTheme.labelMedium,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildItineraryCard(int index) {
    final entry = _itineraries[index];
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.inputBorder, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row: image + Ngày X + X button
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Small image placeholder
                GestureDetector(
                  onTap: () => _pickItineraryImage(index),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.primaryLightWhiteBlue,
                      borderRadius: BorderRadius.circular(8),
                      image: entry.imageFile != null
                          ? DecorationImage(
                              image: FileImage(entry.imageFile!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: entry.imageFile == null
                        ? const Icon(
                            Icons.image_outlined,
                            color: AppColors.textPrimary,
                            size: 24,
                          )
                        : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ngày ${index + 1}:',
                            style: const TextStyle(
                              fontSize: AppTextTheme.bodyMedium,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                          if (_itineraries.length > 1)
                            GestureDetector(
                              onTap: () => _removeItinerary(index),
                              child: const Icon(
                                Icons.close,
                                size: 20,
                                color: AppColors.textPrimary,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Title field
                      Row(
                        children: [
                          const Text(
                            'Tiêu đề: ',
                            style: TextStyle(
                              fontSize: AppTextTheme.bodySmall,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.textSecondary,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: entry.labelController,
                                style: const TextStyle(
                                  fontSize: AppTextTheme.bodySmall,
                                  color: AppColors.textPrimary,
                                ),
                                decoration: const InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(bottom: 4),
                                  suffixIconConstraints: BoxConstraints(
                                    minHeight: 14,
                                    minWidth: 14,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.edit,
                                    size: 14,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Mô tả label
            const Text(
              'Mô tả:',
              style: TextStyle(
                fontSize: AppTextTheme.bodySmall,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            // Description field
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.textSecondary, width: 1),
                ),
              ),
              child: TextField(
                controller: entry.descriptionController,
                maxLines: null,
                style: const TextStyle(
                  fontSize: AppTextTheme.bodySmall,
                  color: AppColors.textPrimary,
                  height: 1.5,
                ),
                decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 4),
                  hintText: 'Nhập mô tả cho ngày này...',
                  hintStyle: TextStyle(
                    color: AppColors.textHint,
                    fontSize: AppTextTheme.bodySmall,
                  ),
                  suffixIconConstraints: BoxConstraints(
                    minHeight: 14,
                    minWidth: 14,
                  ),
                  suffixIcon: Icon(
                    Icons.edit,
                    size: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
