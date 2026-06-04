import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/ui/admin/view_model/create_hotel_view_model.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_theme.dart';
import 'widgets/input_text_field.dart';
import 'widgets/dropdown_button.dart';
import 'widgets/input_button.dart';
import 'widgets/large_button.dart';
import 'widgets/amenity_bottom_sheet.dart';
import 'package:travery_frontend/data/services/api/model/hotel/amenity_response.dart';

// No room data here anymore

class CreateHotelScreen extends StatefulWidget {
  const CreateHotelScreen({super.key, required this.viewModel});
  final CreateHotelViewModel viewModel;

  @override
  State<CreateHotelScreen> createState() => _CreateHotelScreenState();
}

class _CreateHotelScreenState extends State<CreateHotelScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  String? _selectedCity;
  String? _selectedPolicy;
  final _descriptionController = TextEditingController();

  String _checkInTime = "12:00";
  String _checkOutTime = "12:00";

  // ── Lifecycle ──────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    widget.viewModel.createHotel.addListener(_onCreateHotelResult);
    widget.viewModel.loadAmenities.addListener(_onAmenitiesLoaded);
    widget.viewModel.loadRefundPolicies.addListener(_onRefundPoliciesLoaded);
    widget.viewModel.loadAmenities.execute();
    widget.viewModel.loadRefundPolicies.execute();
  }

  void _onAmenitiesLoaded() {
    setState(() {}); // Rebuild when amenities load
  }

  void _onRefundPoliciesLoaded() {
    setState(() {}); // Rebuild when refund policies load
  }

  @override
  void dispose() {
    widget.viewModel.createHotel.removeListener(_onCreateHotelResult);
    widget.viewModel.loadAmenities.removeListener(_onAmenitiesLoaded);
    widget.viewModel.loadRefundPolicies.removeListener(_onRefundPoliciesLoaded);
    _nameController.dispose();
    _addressController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  List<String> _selectedAmenityIds = [];

  void _onCreateHotelResult() {
    final cmd = widget.viewModel.createHotel;
    if (cmd.completed) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đã tạo khách sạn thành công'),
          backgroundColor: Colors.green,
        ),
      );
      context.pop(true);
    } else if (cmd.error) {
      if (!mounted) return;
      String errorMessage = 'Tạo khách sạn thất bại';
      // In Dart 3, result could be matched. For now, assuming basic Error toString.
      final result = cmd.result;
      if (result != null && result.toString().contains('Exception:')) {
        errorMessage = result.toString().replaceAll('Exception: ', '');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
      );
      cmd.clearResult();
    }
  }

  // ── Actions ────────────────────────────────────────────────────────────────

  Future<void> _onNext() async {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập tên khách sạn'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (_selectedPolicy == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng chọn chính sách hoàn tiền'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final payload = (
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim().isEmpty ? null : _descriptionController.text.trim(),
      address: _addressController.text.trim(),
      cityProvince: _selectedCity ?? 'Hà Nội',
      checkInTime: _checkInTime,
      checkOutTime: _checkOutTime,
      amenityIds: _selectedAmenityIds,
      refundPolicyId: _selectedPolicy!,
    );

    widget.viewModel.createHotel.execute(payload);
  }

  Future<void> _selectTime(BuildContext context, bool isCheckIn) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 12, minute: 0),
    );
    if (picked != null) {
      setState(() {
        final timeStr =
            '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
        if (isCheckIn) {
          _checkInTime = timeStr;
        } else {
          _checkOutTime = timeStr;
        }
      });
    }
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
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              _buildHeader(),
              const SizedBox(height: 24),
              _buildSectionTitle(Icons.bed_outlined, 'Thông tin khách sạn'),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: InputButton(
                      label: 'Thời gian check-in',
                      textholder: _checkInTime,
                      prefixIcon: const Icon(
                        Icons.access_time,
                        size: 20,
                        color: Colors.black87,
                      ),
                      suffixIcon: const Icon(
                        Icons.edit,
                        size: 16,
                        color: Colors.black54,
                      ),
                      onTap: () => _selectTime(context, true),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: InputButton(
                      label: 'Thời gian check-out',
                      textholder: _checkOutTime,
                      prefixIcon: const Icon(
                        Icons.access_time,
                        size: 20,
                        color: Colors.black87,
                      ),
                      suffixIcon: const Icon(
                        Icons.edit,
                        size: 16,
                        color: Colors.black54,
                      ),
                      onTap: () => _selectTime(context, false),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomDropdownButton(
                label: 'Chính sách',
                textholder: 'Chọn chính sách',
                prefixIcon: const Icon(
                  Icons.receipt_long,
                  size: 20,
                  color: Colors.black87,
                ),
                items: widget.viewModel.refundPolicies
                    .map((e) => e.name ?? 'Không tên')
                    .toList(),
                value: widget.viewModel.refundPolicies
                    .where((e) => e.id == _selectedPolicy)
                    .firstOrNull
                    ?.name,
                onChanged: (val) {
                  final policy = widget.viewModel.refundPolicies
                      .where((e) => e.name == val)
                      .firstOrNull;
                  setState(() => _selectedPolicy = policy?.id);
                },
              ),
              const SizedBox(height: 16),
              InputTextField(
                label: 'Mô tả',
                textholder: 'Nhập mô tả...',
                controller: _descriptionController,
                textInputType: TextInputType.multiline,
                maxLines: 4,
                suffixIcon: const Icon(
                  Icons.edit,
                  size: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cơ sở vật chất',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => AmenityBottomSheet(
                          amenities: widget.viewModel.amenities,
                          initialSelected: _selectedAmenityIds,
                          onConfirm: (selectedIds) {
                            setState(() => _selectedAmenityIds = selectedIds);
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'Chọn cơ sở vật chất',
                      style: TextStyle(
                        color: AppColors.primaryDarkBlackBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              if (_selectedAmenityIds.isNotEmpty) ...[
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _selectedAmenityIds.map((id) {
                    final amenity = widget.viewModel.amenities.firstWhere(
                      (a) => a.id == id,
                      orElse: () => const AmenityResponse(
                        id: '',
                        name: 'Unknown',
                        type: 'HOTEL',
                      ),
                    );
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.primaryDarkBlackBlue,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (amenity.iconUrl != null &&
                              amenity.iconUrl!.isNotEmpty) ...[
                            Image.network(
                              amenity.iconUrl!,
                              width: 24,
                              height: 24,
                              color: AppColors.primaryDarkBlackBlue,
                              errorBuilder: (context, error, stackTrace) => const Icon(
                                Icons.star,
                                color: AppColors.primaryDarkBlackBlue,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                          Text(
                            amenity.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryDarkBlackBlue,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
              const SizedBox(height: 16),
              LargeButton(
                text: 'Tiếp tục',
                onTap: widget.viewModel.createHotel.running ? null : _onNext,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ── Builders ───────────────────────────────────────────────────────────────

  Widget _buildHeader() {
    return ListenableBuilder(
      listenable: widget.viewModel.createHotel,
      builder: (context, _) {
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

  // removed image upload
}
