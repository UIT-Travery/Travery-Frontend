import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_input_field.dart';

class CoordinatorCreateCoachTemplateScreen extends StatefulWidget {
  const CoordinatorCreateCoachTemplateScreen({super.key});

  @override
  State<CoordinatorCreateCoachTemplateScreen> createState() =>
      _CoordinatorCreateCoachTemplateScreenState();
}

class _StopPoint {
  String? selectedStation;
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  void dispose() {
    cityController.dispose();
    addressController.dispose();
  }
}

class _CoordinatorCreateCoachTemplateScreenState
    extends State<CoordinatorCreateCoachTemplateScreen> {
  final List<_StopPoint> _stopPoints = [_StopPoint(), _StopPoint()];
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _distanceController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  final List<String> _dummyStations = [
    'Chi nhánh Sài Gòn',
    'Chi nhánh Đà Lạt',
    'Chi nhánh Hà Nội',
    'Chi nhánh Sapa',
  ];

  @override
  void dispose() {
    for (final s in _stopPoints) {
      s.dispose();
    }
    _priceController.dispose();
    _distanceController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  void _onStationSelected(int index, String station) {
    setState(() {
      _stopPoints[index].selectedStation = station;
      // Mock data population based on selection
      if (station.contains('Sài Gòn')) {
        _stopPoints[index].cityController.text = 'Hồ Chí Minh';
        _stopPoints[index].addressController.text = 'Quận 1, TP. HCM';
      } else if (station.contains('Đà Lạt')) {
        _stopPoints[index].cityController.text = 'Lâm Đồng';
        _stopPoints[index].addressController.text = 'Phường 3, Đà Lạt';
      } else if (station.contains('Hà Nội')) {
        _stopPoints[index].cityController.text = 'Hà Nội';
        _stopPoints[index].addressController.text = 'Quận Hoàn Kiếm, Hà Nội';
      } else if (station.contains('Sapa')) {
        _stopPoints[index].cityController.text = 'Lào Cai';
        _stopPoints[index].addressController.text = 'Thị xã Sapa, Lào Cai';
      }
    });
  }

  void _onConfirm() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Lộ trình đã được tạo thành công!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar
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
                  Material(
                    color: AppColors.primaryDarkBlackBlue,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: _onConfirm,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Text(
                          'Xác nhận',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppTextTheme.bodyMedium,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Body
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Stop points
                    for (int i = 0; i < _stopPoints.length; i++) ...[
                      _buildStopPointCard(i),
                      if (i < _stopPoints.length - 1) ...[
                        const SizedBox(height: 12),
                        Center(
                          child: Icon(
                            Icons.arrow_downward_rounded,
                            color: AppColors.primary,
                            size: 24,
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ],

                    const SizedBox(height: 20),

                    // Giá vé
                    CoordinatorInputField(
                      label: 'Giá vé',
                      hintText: 'Nhập giá...',
                      controller: _priceController,
                      suffixIcon: const Icon(
                        Icons.attach_money_rounded,
                        size: 18,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Khoảng cách & Thời gian
                    Row(
                      children: [
                        Expanded(
                          child: CoordinatorInputField(
                            label: 'Khoảng cách',
                            hintText: 'Nhập số km...',
                            controller: _distanceController,
                            suffixIcon: const Icon(
                              Icons.format_line_spacing_rounded,
                              size: 18,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CoordinatorInputField(
                            label: 'Thời gian ước tính',
                            hintText: 'Nhập số giờ',
                            controller: _durationController,
                            suffixIcon: const Icon(
                              Icons.access_time_rounded,
                              size: 18,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
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

  Widget _buildStopPointCard(int index) {
    final stop = _stopPoints[index];
    final label = index + 1;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title row
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.primaryDarkBlackBlue,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$label',
                    style: const TextStyle(
                      fontSize: AppTextTheme.bodySmall,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Địa điểm $label',
                style: const TextStyle(
                  fontSize: AppTextTheme.bodyLarge,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Station dropdown
          Container(
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColors.primaryLightWhiteBlue,
                width: 1.5,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 18,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: const Text(
                        'Chọn chi nhánh',
                        style: TextStyle(
                          fontSize: AppTextTheme.bodyMedium,
                          color: AppColors.textHint,
                        ),
                      ),
                      value: stop.selectedStation,
                      items: _dummyStations.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) _onStationSelected(index, val);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // City Input
          CoordinatorInputField(
            hintText: 'Tỉnh, thành phố',
            controller: stop.cityController,
            suffixIcon: const Icon(
              Icons.location_on_outlined,
              size: 18,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 10),

          // Address input
          CoordinatorInputField(
            hintText: 'Địa chỉ chi tiết',
            controller: stop.addressController,
            suffixIcon: const Icon(
              Icons.location_on_outlined,
              size: 18,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
