import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/data/models/hotel/hotel_detail_data.dart';
import 'package:travery_frontend/data/services/api/model/profile/profile_response/profile_response.dart';
import 'package:travery_frontend/data/services/api/profile_service.dart';
import 'package:travery_frontend/data/services/security_storage_service.dart';
import 'package:travery_frontend/data/services/user_storage_service.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/widgets/section_title.dart';
import 'package:travery_frontend/ui/user/widgets/user_app_bar.dart';
import 'package:travery_frontend/utils/core_result.dart';

DateTime? _tryParseDob(String value) {
  if (value.trim().isEmpty) return null;

  var parts = value.trim().split('/');
  if (parts.length != 3) {
    parts = value.trim().split('-');
    if (parts.length != 3) return null;
  }

  int? day;
  int? month;
  int? year;
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
  if (day < 1 || day > 31 || month < 1 || month > 12 || year < 1900) {
    return null;
  }

  final dob = DateTime(year, month, day);
  if (dob.day != day || dob.month != month || dob.year != year) return null;
  return dob;
}

String? Function(String?) _nameValidator() {
  return (value) {
    if (value == null || value.trim().isEmpty) {
      return 'Vui lòng nhập họ và tên';
    }
    if (value.trim().length < 2) {
      return 'Họ tên phải có ít nhất 2 ký tự';
    }
    return null;
  };
}

String? Function(String?) _identityValidator() {
  return (value) {
    if (value == null || value.trim().isEmpty) {
      return 'Vui lòng nhập số CCCD';
    }
    if (!RegExp(r'^\d{12}$').hasMatch(value.trim())) {
      return 'Số CCCD phải đủ 12 chữ số';
    }
    return null;
  };
}

String? Function(String?) _phoneValidator() {
  return (value) {
    if (value == null || value.trim().isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }
    final phone = value.trim().replaceAll(RegExp(r'\s'), '');
    if (!RegExp(r'^\+?\d{9,15}$').hasMatch(phone)) {
      return 'Số điện thoại không hợp lệ';
    }
    return null;
  };
}

String? Function(String?) _dobValidator(bool isAdult) {
  return (value) {
    if (value == null || value.trim().isEmpty) {
      return 'Vui lòng nhập ngày sinh';
    }

    final dob = _tryParseDob(value);
    if (dob == null) return 'Ngày sinh không hợp lệ';

    final now = DateTime.now();
    var age = now.year - dob.year;
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
      age--;
    }

    if (isAdult && age < 12) {
      return 'Người lớn phải từ 12 tuổi trở lên';
    }
    if (!isAdult && age > 11) {
      return 'Trẻ em phải từ 11 tuổi trở xuống';
    }
    return null;
  };
}

class HotelBookingInputScreen extends StatefulWidget {
  const HotelBookingInputScreen({super.key});

  @override
  State<HotelBookingInputScreen> createState() =>
      _HotelBookingInputScreenState();
}

class _HotelBookingInputScreenState extends State<HotelBookingInputScreen> {
  final _formKey = GlobalKey<FormState>();

  final List<TextEditingController> _nameControllers = [];
  final List<TextEditingController> _identityControllers = [];
  final List<TextEditingController> _dobControllers = [];
  final _contactNameController = TextEditingController();
  final _contactPhoneController = TextEditingController();
  final _specialRequestsController = TextEditingController();

  HotelDetailData? _hotel;
  List<HotelRoomData> _selectedRooms = [];
  DateTime _checkInDate = DateTime.now().add(const Duration(days: 1));
  DateTime _checkOutDate = DateTime.now().add(const Duration(days: 2));
  int _adultCount = 1;
  int _childCount = 0;
  bool _loadedRouteData = false;

  int get _totalGuests => _adultCount + _childCount;

  int get _maxAdults {
    final total = _selectedRooms.fold<int>(
      0,
      (sum, room) => sum + (room.capacityAdults ?? 0),
    );
    return total > 0 ? total : 1;
  }

  int get _maxChildren {
    return _selectedRooms.fold<int>(
      0,
      (sum, room) => sum + (room.capacityChildren ?? 0),
    );
  }

  int get _nights {
    final days = _checkOutDate.difference(_checkInDate).inDays;
    return days < 1 ? 1 : days;
  }

  double get _pricePerNight {
    return _selectedRooms.fold<double>(
      0,
      (sum, room) => sum + room.pricePerNight,
    );
  }

  double get _totalPrice => _pricePerNight * _nights;

  @override
  void initState() {
    super.initState();
    _syncMemberControllers();
    _loadUserInfo();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_loadedRouteData) return;
    _loadedRouteData = true;

    final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final rooms = extra?['selectedRooms'] as List<dynamic>?;
    _hotel = extra?['hotel'] as HotelDetailData?;
    if (rooms != null) {
      _selectedRooms = rooms.cast<HotelRoomData>();
    }

    final routeStartDate = _parseRouteDate(extra?['startDate']);
    final routeEndDate = _parseRouteDate(extra?['endDate']);
    if (routeStartDate != null) {
      _checkInDate = routeStartDate;
    }
    if (routeEndDate != null && routeEndDate.isAfter(_checkInDate)) {
      _checkOutDate = routeEndDate;
    } else if (!_checkOutDate.isAfter(_checkInDate)) {
      _checkOutDate = _checkInDate.add(const Duration(days: 1));
    }

    _clampGuestCounts();
    _syncMemberControllers();
  }

  @override
  void dispose() {
    for (final controller in _nameControllers) {
      controller.dispose();
    }
    for (final controller in _identityControllers) {
      controller.dispose();
    }
    for (final controller in _dobControllers) {
      controller.dispose();
    }
    _contactNameController.dispose();
    _contactPhoneController.dispose();
    _specialRequestsController.dispose();
    super.dispose();
  }

  Future<void> _loadUserInfo() async {
    try {
      final securityStorage = SecurityStorageService();
      final accessToken = await securityStorage.getAccessToken();

      if (accessToken == null) {
        _loadFromLocalStorage();
        return;
      }

      final profileService = ProfileService();
      final result = await profileService.getProfile(accessToken: accessToken);

      switch (result) {
        case Ok<ProfileData>(:final value):
          final userStorage = await UserStorageService.getInstance();
          await userStorage.saveUserInfo(
            fullName: value.fullName,
            phone: value.phoneNumber,
            email: value.email,
          );
          _setContactInfo(value.fullName, value.phoneNumber);
        case Error<ProfileData>():
          _loadFromLocalStorage();
      }
    } catch (_) {
      _loadFromLocalStorage();
    }
  }

  void _loadFromLocalStorage() {
    UserStorageService.getInstance().then((userStorage) {
      _setContactInfo(userStorage.fullName, userStorage.phone);
    });
  }

  void _setContactInfo(String? fullName, String? phone) {
    if (!mounted) return;
    setState(() {
      if (_contactNameController.text.trim().isEmpty) {
        _contactNameController.text = fullName ?? '';
      }
      if (_contactPhoneController.text.trim().isEmpty) {
        _contactPhoneController.text = phone ?? '';
      }
    });
  }

  DateTime? _parseRouteDate(Object? value) {
    if (value is DateTime) return value;
    if (value is String && value.isNotEmpty) return DateTime.tryParse(value);
    return null;
  }

  void _clampGuestCounts() {
    if (_adultCount > _maxAdults) _adultCount = _maxAdults;
    if (_adultCount < 1) _adultCount = 1;
    if (_childCount > _maxChildren) _childCount = _maxChildren;
    if (_childCount < 0) _childCount = 0;
  }

  void _syncMemberControllers() {
    final total = _totalGuests;
    while (_nameControllers.length < total) {
      _nameControllers.add(TextEditingController());
      _identityControllers.add(TextEditingController());
      _dobControllers.add(TextEditingController());
    }
    while (_nameControllers.length > total) {
      _nameControllers.removeLast().dispose();
      _identityControllers.removeLast().dispose();
      _dobControllers.removeLast().dispose();
    }
  }

  void _setAdultCount(int count) {
    if (count < 1 || count > _maxAdults) return;
    setState(() {
      _adultCount = count;
      _syncMemberControllers();
    });
  }

  void _setChildCount(int count) {
    if (count < 0 || count > _maxChildren) return;
    setState(() {
      _childCount = count;
      _syncMemberControllers();
    });
  }

  Future<void> _selectCheckInDate() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final picked = await showDatePicker(
      context: context,
      initialDate: _checkInDate.isBefore(today) ? today : _checkInDate,
      firstDate: today,
      lastDate: today.add(const Duration(days: 365)),
      helpText: 'Chọn ngày nhận phòng',
      cancelText: 'Hủy',
      confirmText: 'Xác nhận',
      builder: _datePickerThemeBuilder,
    );

    if (picked == null) return;
    setState(() {
      _checkInDate = picked;
      if (!_checkOutDate.isAfter(_checkInDate)) {
        _checkOutDate = _checkInDate.add(const Duration(days: 1));
      }
    });
  }

  Future<void> _selectCheckOutDate() async {
    final firstDate = _checkInDate.add(const Duration(days: 1));
    final picked = await showDatePicker(
      context: context,
      initialDate: _checkOutDate.isBefore(firstDate)
          ? firstDate
          : _checkOutDate,
      firstDate: firstDate,
      lastDate: DateTime.now().add(const Duration(days: 365)),
      helpText: 'Chọn ngày trả phòng',
      cancelText: 'Hủy',
      confirmText: 'Xác nhận',
      builder: _datePickerThemeBuilder,
    );

    if (picked == null) return;
    setState(() => _checkOutDate = picked);
  }

  Widget _datePickerThemeBuilder(BuildContext context, Widget? child) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          onPrimary: Colors.white,
          surface: Colors.white,
          onSurface: Color(0xFF131B2E),
        ),
      ),
      child: child!,
    );
  }

  void _submitBooking() {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedRooms.isEmpty) {
      _showError('Vui lòng chọn phòng trước khi đặt');
      return;
    }

    final members = <Map<String, dynamic>>[];
    for (var i = 0; i < _totalGuests; i++) {
      final dob = _tryParseDob(_dobControllers[i].text.trim());
      if (dob == null) {
        _showError('Ngày sinh khách ${i + 1} không hợp lệ');
        return;
      }

      members.add({
        'fullName': _nameControllers[i].text.trim(),
        'identityNumber': _identityControllers[i].text.trim(),
        'dateOfBirth': _toIsoDate(dob),
        'memberType': i < _adultCount ? 'ADULT' : 'CHILD',
      });
    }

    context.push(
      Routes.hotelBookingReview,
      extra: {
        'rooms': _selectedRooms
            .map((room) => {'roomTypeId': room.id, 'quantity': 1})
            .toList(),
        'startDate': _toIsoDate(_checkInDate),
        'endDate': _toIsoDate(_checkOutDate),
        'members': members,
        'contactName': _contactNameController.text.trim(),
        'contactPhone': _contactPhoneController.text.trim(),
        'specialRequests': _specialRequestsController.text.trim(),
        'pricePerNight': _pricePerNight,
        'totalPrice': _totalPrice,
        'nights': _nights,
      },
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.error),
    );
  }

  String _toIsoDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFF),
      appBar: const UserAppBar(title: 'Thông tin đặt phòng'),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _buildDateSection(),
            const SizedBox(height: 24),
            _buildRoomSection(),
            const SizedBox(height: 24),
            _buildGuestCountSection(),
            const SizedBox(height: 24),
            _buildMemberSection(),
            const SizedBox(height: 24),
            _buildContactSection(),
            const SizedBox(height: 24),
            _buildSpecialRequestsSection(),
            const SizedBox(height: 120),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildDateSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Thời gian lưu trú'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: _cardDecoration(),
          child: Row(
            children: [
              Expanded(
                child: _DateSelectField(
                  label: 'Nhận phòng',
                  value: _formatDate(_checkInDate),
                  onTap: _selectCheckInDate,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _DateSelectField(
                  label: 'Trả phòng',
                  value: _formatDate(_checkOutDate),
                  onTap: _selectCheckOutDate,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRoomSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Phòng đã chọn'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: _cardDecoration(),
          child: _selectedRooms.isEmpty
              ? const Text(
                  'Chưa có phòng được chọn',
                  style: TextStyle(color: Color(0xFF717786)),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_hotel != null) ...[
                      Text(
                        _hotel!.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF131B2E),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                    ...List.generate(_selectedRooms.length, (index) {
                      final room = _selectedRooms[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index == _selectedRooms.length - 1 ? 0 : 10,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                room.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF131B2E),
                                ),
                              ),
                            ),
                            Text(
                              _formatPrice(room.pricePerNight),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    const Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$_nights đêm',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF414755),
                          ),
                        ),
                        Text(
                          _formatPrice(_totalPrice),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ],
    );
  }

  Widget _buildGuestCountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Số lượng khách'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: _cardDecoration(),
          child: Column(
            children: [
              _CounterRow(
                label: 'Người lớn',
                subtitle: 'Từ 12 tuổi trở lên',
                count: _adultCount,
                onDecrease: _adultCount > 1
                    ? () => _setAdultCount(_adultCount - 1)
                    : null,
                onIncrease: _adultCount < _maxAdults
                    ? () => _setAdultCount(_adultCount + 1)
                    : null,
              ),
              const Divider(height: 24),
              _CounterRow(
                label: 'Trẻ em',
                subtitle: 'Từ 11 tuổi trở xuống',
                count: _childCount,
                onDecrease: _childCount > 0
                    ? () => _setChildCount(_childCount - 1)
                    : null,
                onIncrease: _childCount < _maxChildren
                    ? () => _setChildCount(_childCount + 1)
                    : null,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMemberSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Danh sách khách'),
        const SizedBox(height: 12),
        ...List.generate(_totalGuests, (index) {
          final isAdult = index < _adultCount;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _MemberCard(
              index: index,
              isAdult: isAdult,
              nameController: _nameControllers[index],
              identityController: _identityControllers[index],
              dobController: _dobControllers[index],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Thông tin liên hệ'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: _cardDecoration(),
          child: Column(
            children: [
              _InputField(
                label: 'Họ và tên *',
                controller: _contactNameController,
                hint: 'VD: Nguyễn Văn A',
                validator: _nameValidator(),
              ),
              const SizedBox(height: 12),
              _InputField(
                label: 'Số điện thoại *',
                controller: _contactPhoneController,
                hint: 'VD: 0901234567',
                keyboardType: TextInputType.phone,
                validator: _phoneValidator(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSpecialRequestsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Ghi chú đặc biệt'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: _cardDecoration(),
          child: TextField(
            controller: _specialRequestsController,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: 'VD: Yêu cầu phòng tầng cao, nhận phòng muộn...',
              hintStyle: TextStyle(color: Color(0xFF717786)),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
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
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tổng cộng ($_totalGuests khách)',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF414755),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _formatPrice(_totalPrice),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: _selectedRooms.isEmpty ? null : _submitBooking,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                disabledBackgroundColor: const Color(0xFFC1C6D7),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tiếp tục',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
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
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}

class _DateSelectField extends StatelessWidget {
  const _DateSelectField({
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: Color(0xFF414755),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F3FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF131B2E),
                    ),
                  ),
                ),
                const Icon(
                  Icons.calendar_month,
                  size: 18,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
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
  final VoidCallback? onIncrease;

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
                    color: onDecrease == null ? Colors.grey[200] : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.remove,
                    size: 18,
                    color: onDecrease == null ? Colors.grey : AppColors.primary,
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
                  decoration: BoxDecoration(
                    color: onIncrease == null
                        ? const Color(0xFFC1C6D7)
                        : AppColors.primary,
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
  });

  final int index;
  final bool isAdult;
  final TextEditingController nameController;
  final TextEditingController identityController;
  final TextEditingController dobController;

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
              Expanded(
                child: Text(
                  'Khách ${index + 1}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF131B2E),
                  ),
                ),
              ),
              Text(
                isAdult ? 'Người lớn' : 'Trẻ em',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
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
          ),
          const SizedBox(height: 12),
          _InputField(
            label: 'Số CCCD *',
            controller: identityController,
            hint: 'VD: 012345678901',
            keyboardType: TextInputType.number,
            validator: _identityValidator(),
          ),
          const SizedBox(height: 12),
          _DatePickerFormField(
            label: 'Ngày sinh *',
            controller: dobController,
            validator: _dobValidator(isAdult),
            isAdult: isAdult,
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
    this.validator,
    this.keyboardType,
  });

  final String label;
  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
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
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }
}

class _DatePickerFormField extends FormField<String> {
  _DatePickerFormField({
    required String label,
    required TextEditingController controller,
    super.validator,
    bool isAdult = true,
  }) : super(
         initialValue: controller.text,
         builder: (FormFieldState<String> state) {
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 label.toUpperCase(),
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
                   final initial = _tryParseDob(controller.text);
                   final firstDate = isAdult
                       ? DateTime(1900)
                       : DateTime(
                           now.year - 11,
                           now.month,
                           now.day,
                         ).add(const Duration(days: 1));
                   final lastDate = isAdult
                       ? DateTime(now.year - 12, now.month, now.day)
                       : now;
                   final fallbackDate = isAdult
                       ? DateTime(now.year - 30, now.month, now.day)
                       : DateTime(now.year - 5, now.month, now.day);

                   final picked = await showDatePicker(
                     context: state.context,
                     initialDate: initial ?? fallbackDate,
                     firstDate: firstDate,
                     lastDate: lastDate,
                     helpText: 'Chọn ngày sinh',
                     cancelText: 'Hủy',
                     confirmText: 'Xác nhận',
                     builder: (context, child) {
                       return Theme(
                         data: Theme.of(context).copyWith(
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
                     controller.text = formatted;
                     state.didChange(formatted);
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
                           controller.text.isNotEmpty
                               ? controller.text
                               : 'Chọn ngày sinh',
                           style: TextStyle(
                             fontSize: 15,
                             color: controller.text.isNotEmpty
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
