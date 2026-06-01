import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/tour/booking_input/view_models/booking_input_view_model.dart';
import 'package:travery_frontend/ui/user/widgets/section_title.dart';
import 'package:travery_frontend/ui/user/widgets/user_app_bar.dart';

// ─── Top-level helpers for date-of-birth validation ───────────────────────────

DateTime? _tryParseDob(String value) {
  if (value.isEmpty) return null;
  var parts = value.split('/');
  if (parts.length != 3) {
    parts = value.split('-');
    if (parts.length != 3) return null;
  }
  int? day, month, year;
  if (int.tryParse(parts[0]) != null && int.parse(parts[0]) > 31) {
    year = int.tryParse(parts[0]);
    month = int.tryParse(parts[1]);
    day = int.tryParse(parts[2]);
  } else {
    day = int.tryParse(parts[0]);
    month = int.tryParse(parts[1]);
    year = int.tryParse(parts[2]);
  }
  if (day == null || month == null || year == null) return null;
  if (day < 1 || day > 31 || month < 1 || month > 12 || year < 1900)
    return null;
  return DateTime(year, month, day);
}

String? Function(String?) _nameValidator() {
  return (value) {
    if (value == null || value.trim().isEmpty) return 'Vui lòng nhập họ và tên';
    if (value.trim().length < 2) return 'Họ tên phải có ít nhất 2 ký tự';
    return null;
  };
}

String? Function(String?) _identityValidator() {
  return (value) {
    if (value == null || value.trim().isEmpty) return 'Vui lòng nhập số CCCD';
    if (!RegExp(r'^\d{12}$').hasMatch(value.trim())) {
      return 'Số CCCD phải đủ 12 chữ số';
    }
    return null;
  };
}

String? Function(String?) _dobValidator() {
  return (value) {
    if (value == null || value.trim().isEmpty) {
      return 'Vui lòng nhập ngày sinh';
    }
    return null;
  };
}

class BookingInputScreen extends StatefulWidget {
  const BookingInputScreen({
    super.key,
    required this.viewModel,
    required this.tourId,
    required this.instanceId,
    required this.tourName,
    this.destinationName,
    // this.startLocation,
    this.pricePerAdult,
    this.pricePerChild,
    this.startDate,
    this.endDate,
  });

  final BookingInputViewModel viewModel;
  final String tourId;
  final String instanceId;
  final String tourName;
  final String? destinationName;
  // final String? startLocation;
  final double? pricePerAdult;
  final double? pricePerChild;
  final String? startDate;
  final String? endDate;

  @override
  State<BookingInputScreen> createState() => _BookingInputScreenState();
}

class _BookingInputScreenState extends State<BookingInputScreen> {
  final List<TextEditingController> _nameControllers = [];
  final List<TextEditingController> _identityControllers = [];
  final List<TextEditingController> _dobControllers = [];
  final TextEditingController _specialRequestsController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void _syncControllers() {
    final members = widget.viewModel.members;
    while (_nameControllers.length < members.length) {
      _nameControllers.add(TextEditingController());
      _identityControllers.add(TextEditingController());
      _dobControllers.add(TextEditingController());
    }
    while (_nameControllers.length > members.length) {
      _nameControllers.removeLast().dispose();
      _identityControllers.removeLast().dispose();
      _dobControllers.removeLast().dispose();
    }
    for (int i = 0; i < members.length; i++) {
      _nameControllers[i].text = members[i].fullName;
      _identityControllers[i].text = members[i].identityNumber;
      _dobControllers[i].text = members[i].dateOfBirth;
    }
    _specialRequestsController.text = widget.viewModel.specialRequests;
  }

  @override
  void dispose() {
    for (final c in _nameControllers) c.dispose();
    for (final c in _identityControllers) c.dispose();
    for (final c in _dobControllers) c.dispose();
    _specialRequestsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pricePerAdult = widget.pricePerAdult ?? 0.0;
    final pricePerChild = widget.pricePerChild ?? 0.0;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFF),
      appBar: const UserAppBar(title: 'Thông tin đặt tour'),
      body: Consumer<BookingInputViewModel>(
        builder: (context, vm, _) {
          _syncControllers();
          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // Guest Count Section
                const SectionTitle(title: 'Số lượng hành khách'),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _CounterRow(
                        label: 'Người lớn',
                        subtitle: 'Từ 12 tuổi trở lên',
                        count: vm.adultCount,
                        onDecrease: () => vm.setAdultCount(vm.adultCount - 1),
                        onIncrease: () => vm.setAdultCount(vm.adultCount + 1),
                      ),
                      const Divider(height: 24),
                      _CounterRow(
                        label: 'Trẻ em',
                        subtitle: 'Từ 10 tuổi trở xuống',
                        count: vm.childCount,
                        onDecrease: vm.childCount > 0
                            ? () => vm.setChildCount(vm.childCount - 1)
                            : null,
                        onIncrease: () => vm.setChildCount(vm.childCount + 1),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Members List
                const SectionTitle(title: 'Danh sách thành viên'),
                const SizedBox(height: 12),
                ...List.generate(vm.members.length, (index) {
                  final member = vm.members[index];
                  final isAdult = member.memberType == 'ADULT';
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _MemberCard(
                      index: index,
                      isAdult: isAdult,
                      nameController: index < _nameControllers.length
                          ? _nameControllers[index]
                          : null,
                      identityController: index < _identityControllers.length
                          ? _identityControllers[index]
                          : null,
                      dobController: index < _dobControllers.length
                          ? _dobControllers[index]
                          : null,
                      onChanged: () {
                        vm.updateMember(
                          index,
                          MemberFormData(
                            fullName: _nameControllers[index].text,
                            identityNumber: _identityControllers[index].text,
                            dateOfBirth: _dobControllers[index].text,
                            memberType: isAdult ? 'ADULT' : 'CHILD',
                          ),
                        );
                      },
                    ),
                  );
                }),

                const SizedBox(height: 24),

                // Special Requests
                const SectionTitle(title: 'Ghi chú đặc biệt'),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _specialRequestsController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      hintText: 'VD: Dị ứng hải sản, yêu cầu phòng tầng cao...',
                      hintStyle: TextStyle(color: Color(0xFF717786)),
                      border: InputBorder.none,
                    ),
                    onChanged: vm.setSpecialRequests,
                  ),
                ),

                const SizedBox(height: 120),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Consumer<BookingInputViewModel>(
        builder: (context, vm, _) {
          final totalPrice =
              (vm.adultCount * pricePerAdult) + (vm.childCount * pricePerChild);
          final totalGuests = vm.adultCount + vm.childCount;

          return Container(
            padding: EdgeInsets.fromLTRB(
              12,
              12,
              12,
              MediaQuery.of(context).padding.bottom + 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 20,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tổng cộng ($totalGuests người)',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF414755),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _formatPrice(totalPrice),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: vm.isSubmitting
                        ? null
                        : () => _onSubmit(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: vm.isSubmitting
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Tiếp tục thanh toán',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(Icons.arrow_forward, size: 18),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _onSubmit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập đầy đủ thông tin hành khách'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    for (int i = 0; i < widget.viewModel.members.length; i++) {
      widget.viewModel.updateMember(
        i,
        MemberFormData(
          fullName: _nameControllers[i].text,
          identityNumber: _identityControllers[i].text,
          dateOfBirth: _dobControllers[i].text,
          memberType: widget.viewModel.members[i].memberType,
        ),
      );
    }

    if (!mounted) return;

    context.push(
      Routes.tourBookingReview.replaceFirst(':id', widget.tourId),
      extra: {
        'tourId': widget.tourId,
        'instanceId': widget.instanceId,
        'tourName': widget.tourName,
        'destinationName': widget.destinationName ?? '',
        // 'startLocation': widget.startLocation ?? '',
        'tourImageUrl': null,
        'members': widget.viewModel.members
            .map(
              (m) => {
                'fullName': m.fullName,
                'identityNumber': m.identityNumber,
                'dateOfBirth': m.dateOfBirth,
                'memberType': m.memberType,
              },
            )
            .toList(),
        'adultCount': widget.viewModel.adultCount,
        'childCount': widget.viewModel.childCount,
        'pricePerAdult': widget.pricePerAdult ?? 0.0,
        'pricePerChild': widget.pricePerChild ?? 0.0,
        'specialRequests': widget.viewModel.specialRequests,
        'startDate': widget.startDate,
        'endDate': widget.endDate,
      },
    );
  }

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }
}

class _CounterRow extends StatelessWidget {
  const _CounterRow({
    required this.label,
    required this.subtitle,
    required this.count,
    required this.onDecrease,
    required this.onIncrease,
  });

  final String label;
  final String subtitle;
  final int count;
  final VoidCallback? onDecrease;
  final VoidCallback onIncrease;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF131B2E),
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: Color(0xFF414755)),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF2F3FF),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: const Color(0xFFC1C6D7)),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: onDecrease,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: count > 0 ? Colors.white : Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.remove,
                    size: 18,
                    color: count > 0 ? AppColors.primary : Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                width: 40,
                child: Center(
                  child: Text(
                    count.toString().padLeft(2, '0'),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF131B2E),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: onIncrease,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, size: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MemberCard extends StatelessWidget {
  const _MemberCard({
    required this.index,
    required this.isAdult,
    required this.nameController,
    required this.identityController,
    required this.dobController,
    required this.onChanged,
  });

  final int index;
  final bool isAdult;
  final TextEditingController? nameController;
  final TextEditingController? identityController;
  final TextEditingController? dobController;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isAdult ? Icons.person : Icons.child_care,
                  size: 18,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Hành khách ${index + 1}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF131B2E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _InputField(
            label: 'Họ và tên *',
            controller: nameController,
            hint: 'VD: Nguyễn Văn A',
            validator: _nameValidator(),
            onChanged: (_) => onChanged(),
          ),
          const SizedBox(height: 12),
          _InputField(
            label: 'Số CCCD *',
            controller: identityController,
            hint: 'VD: 012345678901',
            keyboardType: TextInputType.number,
            validator: _identityValidator(),
            onChanged: (_) => onChanged(),
          ),
          const SizedBox(height: 12),
          _DatePickerFormField(
            label: 'Ngày sinh *',
            controller: dobController,
            onChanged: (_) => onChanged(),
            validator: _dobValidator(),
          ),
        ],
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.label,
    required this.controller,
    required this.hint,
    required this.onChanged,
    this.validator,
    this.keyboardType,
  });

  final String label;
  final TextEditingController? controller;
  final String hint;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: Color(0xFF414755),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFF717786)),
            filled: true,
            fillColor: const Color(0xFFF2F3FF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _DatePickerFormField extends FormField<String> {
  _DatePickerFormField({
    required String label,
    required TextEditingController? controller,
    required ValueChanged<String> onChanged,
    String? Function(String?)? validator,
  }) : super(
         builder: (FormFieldState<String> state) {
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 label,
                 style: const TextStyle(
                   fontSize: 11,
                   fontWeight: FontWeight.w700,
                   color: Color(0xFF414755),
                   letterSpacing: 0.5,
                 ),
               ),
               const SizedBox(height: 6),
               GestureDetector(
                 onTap: () async {
                   final now = DateTime.now();
                   final initial = _tryParseDob(controller?.text ?? '');
                   final picked = await showDatePicker(
                     context: state.context,
                     initialDate: initial ?? DateTime(2000),
                     firstDate: DateTime(1900),
                     lastDate: now,
                     helpText: 'Chọn ngày sinh',
                     cancelText: 'Hủy',
                     confirmText: 'Xác nhận',
                     builder: (ctx, child) {
                       return Theme(
                         data: Theme.of(ctx).copyWith(
                           colorScheme: const ColorScheme.light(
                             primary: AppColors.primary,
                             onPrimary: Colors.white,
                             surface: Colors.white,
                             onSurface: Color(0xFF131B2E),
                           ),
                         ),
                         child: child!,
                       );
                     },
                   );

                   if (picked != null) {
                     final formatted =
                         '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
                     controller?.text = formatted;
                     state.didChange(formatted);
                     onChanged(formatted);
                   }
                 },
                 child: Container(
                   width: double.infinity,
                   padding: const EdgeInsets.symmetric(
                     horizontal: 16,
                     vertical: 14,
                   ),
                   decoration: BoxDecoration(
                     color: const Color(0xFFF2F3FF),
                     borderRadius: BorderRadius.circular(12),
                     border: state.hasError
                         ? Border.all(color: Colors.red, width: 1)
                         : null,
                   ),
                   child: Row(
                     children: [
                       Expanded(
                         child: Text(
                           controller?.text.isNotEmpty == true
                               ? controller!.text
                               : 'Chọn ngày sinh',
                           style: TextStyle(
                             fontSize: 15,
                             color: controller?.text.isNotEmpty == true
                                 ? const Color(0xFF131B2E)
                                 : const Color(0xFF717786),
                           ),
                         ),
                       ),
                       const Icon(
                         Icons.calendar_month,
                         size: 20,
                         color: AppColors.primary,
                       ),
                     ],
                   ),
                 ),
               ),
               if (state.hasError) ...[
                 const SizedBox(height: 4),
                 Text(
                   state.errorText ?? '',
                   style: const TextStyle(fontSize: 11, color: Colors.red),
                 ),
               ],
             ],
           );
         },
       );
}
