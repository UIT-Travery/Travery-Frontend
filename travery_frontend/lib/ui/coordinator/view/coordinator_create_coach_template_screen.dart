import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_input_field.dart';
import 'package:travery_frontend/data/models/trip/destination_data.dart';
import 'package:travery_frontend/data/services/trip/trip_service.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'package:go_router/go_router.dart';

class CoordinatorCreateCoachTemplateScreen extends StatefulWidget {
  const CoordinatorCreateCoachTemplateScreen({super.key});

  @override
  State<CoordinatorCreateCoachTemplateScreen> createState() =>
      _CoordinatorCreateCoachTemplateScreenState();
}

class _StopPoint {
  DestinationData? selectedDestination;

  void dispose() {}
}

class _CoordinatorCreateCoachTemplateScreenState
    extends State<CoordinatorCreateCoachTemplateScreen> {
  final List<_StopPoint> _stopPoints = [_StopPoint(), _StopPoint()];
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _distanceController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  bool _isLoading = false;

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

  Future<void> _onConfirm() async {
    final origin = _stopPoints[0].selectedDestination;
    final destination = _stopPoints[1].selectedDestination;
    final distance = double.tryParse(_distanceController.text);
    final hours = int.tryParse(_durationController.text);
    final price = double.tryParse(_priceController.text);

    if (origin == null ||
        destination == null ||
        distance == null ||
        hours == null ||
        price == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập đầy đủ và hợp lệ các trường')),
      );
      return;
    }

    setState(() => _isLoading = true);
    
    final repo = context.read<CoordinatorRepository>();
    final result = await repo.createRoute(
      originDestinationId: origin.id,
      destinationDestinationId: destination.id,
      distanceKm: distance,
      estimatedHours: hours,
      basePrice: price,
    );

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (result is Ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lộ trình đã được tạo thành công!')),
      );
      context.pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi: ${(result as Error).error.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
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
                  if (_isLoading)
                    const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    )
                  else
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
                        const Center(
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
                      keyboardType: TextInputType.number,
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
                            keyboardType: TextInputType.number,
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
                            keyboardType: TextInputType.number,
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
                decoration: const BoxDecoration(
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

          // Destination Search using Autocomplete
          LayoutBuilder(
            builder: (context, constraints) {
              return Autocomplete<DestinationData>(
                optionsBuilder: (TextEditingValue textEditingValue) async {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<DestinationData>.empty();
                  }
                  final result = await context.read<TripService>().searchDestinations(textEditingValue.text);
                  if (result is Ok) {
                    return (result as Ok<List<DestinationData>>).value;
                  }
                  return const Iterable<DestinationData>.empty();
                },
                displayStringForOption: (DestinationData option) => option.name,
                onSelected: (DestinationData selection) {
                  setState(() {
                    stop.selectedDestination = selection;
                  });
                },
                fieldViewBuilder: (
                  BuildContext context,
                  TextEditingController fieldTextEditingController,
                  FocusNode fieldFocusNode,
                  VoidCallback onFieldSubmitted,
                ) {
                  return CoordinatorInputField(
                    hintText: 'Tìm kiếm Tỉnh, thành phố',
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    suffixIcon: const Icon(
                      Icons.search,
                      size: 18,
                      color: AppColors.textSecondary,
                    ),
                  );
                },
                optionsViewBuilder: (
                  BuildContext context,
                  AutocompleteOnSelected<DestinationData> onSelected,
                  Iterable<DestinationData> options,
                ) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4.0,
                      child: SizedBox(
                        width: constraints.biggest.width,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8.0),
                          itemCount: options.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final DestinationData option = options.elementAt(index);
                            return GestureDetector(
                              onTap: () {
                                onSelected(option);
                              },
                              child: ListTile(
                                leading: const Icon(Icons.location_city, color: AppColors.primary),
                                title: Text(option.name),
                                subtitle: Text(option.code),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          ),
        ],
      ),
    );
  }
}
