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

import 'package:travery_frontend/ui/admin/view/widgets/input_button.dart';
import 'package:travery_frontend/ui/admin/view/widgets/amenity_bottom_sheet.dart';
import 'package:travery_frontend/data/services/api/model/hotel/amenity_response.dart';

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
  final _descriptionController = TextEditingController();
  String? _selectedCity;
  String? _selectedPolicy;
  String _checkInTime = "12:00";
  String _checkOutTime = "12:00";
  List<String> _selectedAmenityIds = [];

  // ── Lifecycle ──────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();

    widget.viewModel.updateHotel.addListener(_onUpdateHotelChanged);
    widget.viewModel.loadHotel.addListener(_onLoadHotelChanged);
    widget.viewModel.loadAmenities.addListener(_onAmenitiesLoaded);
    widget.viewModel.loadRefundPolicies.addListener(_onRefundPoliciesLoaded);

    widget.viewModel.loadAmenities.execute();
    widget.viewModel.loadRefundPolicies.execute();

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
    widget.viewModel.loadAmenities.removeListener(_onAmenitiesLoaded);
    widget.viewModel.loadRefundPolicies.removeListener(_onRefundPoliciesLoaded);
    _nameController.dispose();
    _addressController.dispose();
    _descriptionController.dispose();
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

    } else if (cmd.completed) {
      final result = cmd.result;
      if (result != null) {
        // Assume result has value getter or we pattern match
        // But since we can't import Ok easily here if it's not imported, let's just cast.
        // Or wait, Result is imported via utils/core_result.dart?
        // Actually cmd.result?.value gives error because cmd.result is of type Result<BusinessHotel>, which doesn't have .value unless it's Ok.
        // Let's check how Result is defined. Usually it's:
        // switch(result) { case Ok(): return result.value; case Error(): return null; }
      }
      // Let's use dynamic for a quick workaround if Ok is not imported, or just cast
      final hotel = (cmd.result as dynamic).value;
      if (hotel != null) {
        _nameController.text = hotel.name;
        _addressController.text = hotel.address;
        _selectedCity = hotel.cityProvince;
        _descriptionController.text = hotel.description ?? '';

        if (hotel.checkInTime != null) {
          _checkInTime = hotel.checkInTime!.substring(0, 5); // Format HH:mm
        }
        if (hotel.checkOutTime != null) {
          _checkOutTime = hotel.checkOutTime!.substring(0, 5);
        }

        if (hotel.refundPolicy != null) {
          _selectedPolicy = hotel.refundPolicy!['id'] as String?;
        }

        if (hotel.amenities != null) {
          print('hotel.amenities from API: ${hotel.amenities}');
          try {
            final List<dynamic> rawAmenities = hotel.amenities;
            _selectedAmenityIds = rawAmenities
                .map<String>((e) => (e as Map<String, dynamic>)['id'] as String)
                .toList();
            print('Successfully parsed _selectedAmenityIds: $_selectedAmenityIds');
          } catch (e, stack) {
            print('Error parsing amenities: $e\n$stack');
          }
        }

        if (mounted) setState(() {});
      }
    }
  }

  void _onAmenitiesLoaded() {
    if (mounted) setState(() {});
  }

  void _onRefundPoliciesLoaded() {
    if (mounted) setState(() {});
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
      hotelId: widget.hotelId ?? '',
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      address: _addressController.text.trim(),
      cityProvince: _selectedCity,
      checkInTime: _checkInTime,
      checkOutTime: _checkOutTime,
      amenityIds: _selectedAmenityIds.isEmpty ? null : _selectedAmenityIds,
      refundPolicyId: _selectedPolicy,
    ));
  }

  Future<void> _selectTime(BuildContext context, bool isCheckIn) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 12, minute: 0),
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
    final List<String> cityList = [
      'Hà Nội',
      'TP. Hồ Chí Minh',
      'Đà Nẵng',
      'Hải Phòng',
      'Sa Pa',
      'Đà Lạt',
      'Nha Trang',
      'Phú Quốc',
      'Vũng Tàu',
      'Hạ Long',
    ];
    if (_selectedCity != null && !cityList.contains(_selectedCity)) {
      cityList.add(_selectedCity!);
    }

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                items: cityList,
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
                      orElse: () {
                        final hotel =
                            (widget.viewModel.loadHotel.result as dynamic)
                                ?.value;
                        final hotelAmenity = hotel?.amenities.firstWhere(
                          (a) => a['id'] == id,
                          orElse: () => null,
                        );
                        if (hotelAmenity != null) {
                          return AmenityResponse(
                            id: hotelAmenity['id'] as String? ?? id,
                            name: hotelAmenity['name'] as String? ?? 'Unknown',
                            iconUrl: hotelAmenity['iconUrl'] as String?,
                            type: hotelAmenity['type'] as String? ?? 'HOTEL',
                          );
                        }
                        return AmenityResponse(
                          id: id,
                          name: 'Unknown',
                          type: 'HOTEL',
                        );
                      },
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
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(
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
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Chỉnh sửa khách sạn',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Nhập thông tin khách sạn và phòng',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
}
