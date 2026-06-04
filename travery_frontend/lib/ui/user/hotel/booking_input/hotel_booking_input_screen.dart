import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/data/models/hotel/hotel_detail_data.dart';
import 'package:travery_frontend/data/services/user_storage_service.dart';
import 'package:travery_frontend/data/services/security_storage_service.dart';
import 'package:travery_frontend/data/services/api/profile_service.dart';
import 'package:travery_frontend/data/services/api/model/profile/profile_response/profile_response.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'package:travery_frontend/ui/user/hotel/widgets/hotel_app_bar.dart';

class HotelBookingInputScreen extends StatefulWidget {
  const HotelBookingInputScreen({super.key});

  @override
  State<HotelBookingInputScreen> createState() =>
      _HotelBookingInputScreenState();
}

class _HotelBookingInputScreenState extends State<HotelBookingInputScreen> {
  final _formKey = GlobalKey<FormState>();

  int _adults = 1;
  int _children = 0;
  int get _totalGuests => _adults + _children;

  // Booking dates
  DateTime _checkInDate = DateTime.now().add(const Duration(days: 1));
  DateTime _checkOutDate = DateTime.now().add(const Duration(days: 2));

  // Get selected rooms from route
  List<HotelRoomData> _selectedRooms = [];
  int get _maxAdults {
    return _selectedRooms.fold(
      0,
      (sum, room) => sum + (room.capacityAdults ?? 0),
    );
  }

  int get _maxChildren {
    return _selectedRooms.fold(
      0,
      (sum, room) => sum + (room.capacityChildren ?? 0),
    );
  }

  List<Map<String, dynamic>> _guestControllers = [];

  bool _agreedToTerms = false;

  // User info from storage
  String? _contactName;
  String? _contactPhone;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _loadSelectedRooms();
        _initGuests();
      }
    });
  }

  Future<void> _loadUserInfo() async {
    try {
      final securityStorage = SecurityStorageService();
      final accessToken = await securityStorage.getAccessToken();

      if (accessToken != null) {
        final profileService = ProfileService();
        final result = await profileService.getProfile(
          accessToken: accessToken,
        );

        switch (result) {
          case Ok<ProfileData>(:final value):
            final profile = value;
            final userStorage = await UserStorageService.getInstance();
            await userStorage.saveUserInfo(
              fullName: profile.fullName,
              phone: profile.phoneNumber,
              email: profile.email,
            );
            if (mounted) {
              setState(() {
                _contactName = profile.fullName;
                _contactPhone = profile.phoneNumber;
              });
            }
          case Error<ProfileData>():
            _loadFromLocalStorage();
        }
      } else {
        _loadFromLocalStorage();
      }
    } catch (e) {
      _loadFromLocalStorage();
    }
  }

  void _loadFromLocalStorage() {
    if (!mounted) return;
    UserStorageService.getInstance().then((userStorage) {
      if (mounted) {
        setState(() {
          _contactName = userStorage.fullName;
          _contactPhone = userStorage.phone;
        });
      }
    });
  }

  void _loadSelectedRooms() {
    if (!mounted) return;
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final rooms = extra?['selectedRooms'] as List<dynamic>?;
    if (rooms != null) {
      setState(() {
        _selectedRooms = rooms.cast<HotelRoomData>();
        // Set initial adults to match room capacity
        if (_selectedRooms.isNotEmpty) {
          _adults = _maxAdults;
          _children = _maxChildren;
        }
      });
      _initGuests();
    }
  }

  void _initGuests() {
    final startDate = DateTime.now().add(const Duration(days: 1));
    final endDate = DateTime.now().add(const Duration(days: 2));
    _guestControllers = List.generate(_totalGuests, (index) {
      final isAdult = index == 0;
      return {
        'name': TextEditingController(),
        'idNumber': TextEditingController(),
        'dob': DateTime.now().subtract(
          Duration(days: isAdult ? 25 * 365 : 5 * 365),
        ),
        'startDate': startDate,
        'endDate': endDate,
        'isAdult': isAdult,
      };
    });
  }

  @override
  void dispose() {
    for (final guest in _guestControllers) {
      guest['name']?.dispose();
      guest['idNumber']?.dispose();
    }
    super.dispose();
  }

  void _updateGuests() {
    for (final guest in _guestControllers) {
      guest['name']?.dispose();
      guest['idNumber']?.dispose();
    }
    final startDate = DateTime.now().add(const Duration(days: 1));
    final endDate = DateTime.now().add(const Duration(days: 2));
    _guestControllers = List.generate(_totalGuests, (index) {
      final isAdult = index < _adults;
      return {
        'name': TextEditingController(),
        'idNumber': TextEditingController(),
        'dob': DateTime.now().subtract(
          Duration(days: isAdult ? 25 * 365 : 5 * 365),
        ),
        'startDate': startDate,
        'endDate': endDate,
        'isAdult': isAdult,
      };
    });
    setState(() {});
  }

  void _increaseAdults() {
    if (_adults < _maxAdults) {
      setState(() => _adults++);
      _updateGuests();
    }
  }

  void _decreaseAdults() {
    if (_adults > 1) {
      setState(() => _adults--);
      _updateGuests();
    }
  }

  void _increaseChildren() {
    if (_children < _maxChildren) {
      setState(() => _children++);
      _updateGuests();
    }
  }

  void _decreaseChildren() {
    if (_children > 0) {
      setState(() => _children--);
      _updateGuests();
    }
  }

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  double get _totalPrice => 4500000;

  Future<void> _selectCheckInDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _checkInDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        _checkInDate = picked;
        if (_checkOutDate.isBefore(picked) ||
            _checkOutDate.isAtSameMomentAs(picked)) {
          _checkOutDate = picked.add(const Duration(days: 1));
        }
      });
    }
  }

  Future<void> _selectCheckOutDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _checkOutDate,
      firstDate: _checkInDate.add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        _checkOutDate = picked;
      });
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _submitBooking() {
    if (!_formKey.currentState!.validate()) return;

    if (!_agreedToTerms) {
      _showError('Vui lòng đồng ý với điều khoản');
      return;
    }

    // Validate all guest cards
    for (int i = 0; i < _guestControllers.length; i++) {
      final guest = _guestControllers[i];
      final name = (guest['name'] as TextEditingController).text.trim();
      final idNumber = (guest['idNumber'] as TextEditingController).text.trim();

      if (name.isEmpty) {
        _showError('Vui lòng nhập họ tên khách ${i + 1}');
        return;
      }
      if (idNumber.isEmpty) {
        _showError('Vui lòng nhập CCCD/Hộ chiếu khách ${i + 1}');
        return;
      }
      // Validate CCCD format (9 or 12 digits)
      final cleanId = idNumber.replaceAll(RegExp(r'\s'), '');
      if (cleanId.length < 9 || cleanId.length > 12) {
        _showError('CCCD/Hộ chiếu khách ${i + 1} không hợp lệ (9-12 số)');
        return;
      }
    }

    // Build members list
    final members = _guestControllers.map((guest) {
      final dob = guest['dob'] as DateTime;
      final isAdult = guest['isAdult'] as bool;
      return {
        'fullName': (guest['name'] as TextEditingController).text
            .trim()
            .toUpperCase(),
        'identityNumber': (guest['idNumber'] as TextEditingController).text
            .trim(),
        'dateOfBirth':
            '${dob.year}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}',
        'memberType': isAdult ? 'ADULT' : 'CHILD',
      };
    }).toList();

    final startDateStr =
        '${_checkInDate.year}-${_checkInDate.month.toString().padLeft(2, '0')}-${_checkInDate.day.toString().padLeft(2, '0')}';
    final endDateStr =
        '${_checkOutDate.year}-${_checkOutDate.month.toString().padLeft(2, '0')}-${_checkOutDate.day.toString().padLeft(2, '0')}';
    const pricePerNight = 600000.0;
    const totalPrice = 1200000.0;
    const nights = 2;

    context.push(
      Routes.hotelBookingReview,
      extra: {
        'rooms': [
          {'roomTypeId': 'f1000000-0000-0000-0000-000000000117', 'quantity': 1},
        ],
        'startDate': startDateStr,
        'endDate': endDateStr,
        'members': members,
        'contactName': _contactName ?? '',
        'contactPhone': _contactPhone ?? '',
        'pricePerNight': pricePerNight,
        'totalPrice': totalPrice,
        'nights': nights,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: const HotelAppBar(title: 'Thông tin đặt phòng'),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildDateSection(),
                  const SizedBox(height: 16),
                  _buildGuestCountSection(),
                  const SizedBox(height: 16),
                  _buildGuestSection(),
                  const SizedBox(height: 16),
                  _buildTermsSection(),
                ],
              ),
            ),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildGuestCountSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Số lượng khách',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.person,
                  color: Color(0xFF007AFF),
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Người lớn',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      'Từ 12 tuổi trở lên',
                      style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                    ),
                  ],
                ),
              ),
              _buildCounterButtons(
                _adults,
                _decreaseAdults,
                _increaseAdults,
                atMax: _adults >= _maxAdults,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF3C7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.child_care,
                  color: Color(0xFFD97706),
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Trẻ em',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      'Từ 11 tuổi trở xuống',
                      style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                    ),
                  ],
                ),
              ),
              _buildCounterButtons(
                _children,
                _decreaseChildren,
                _increaseChildren,
                atMax: _children >= _maxChildren,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButtons(
    int count,
    VoidCallback onDecrease,
    VoidCallback onIncrease, {
    bool atMax = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.remove, size: 20),
            onPressed: count > 0 ? onDecrease : null,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            color: count > 0 ? const Color(0xFF007AFF) : Colors.grey,
          ),
          Container(
            constraints: const BoxConstraints(minWidth: 32),
            child: Text(
              '$count',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add, size: 20),
            onPressed: atMax ? null : onIncrease,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            color: atMax ? Colors.grey : const Color(0xFF007AFF),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ngày đặt',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: _selectCheckInDate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ngày nhận phòng',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFF),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE5E7EB)),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 16,
                              color: Color(0xFF6B7280),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _formatDate(_checkInDate),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: _selectCheckOutDate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ngày trả phòng',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFF),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE5E7EB)),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 16,
                              color: Color(0xFF6B7280),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _formatDate(_checkOutDate),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGuestSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Danh sách khách',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$_totalGuests khách',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF007AFF),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...List.generate(_guestControllers.length, (index) {
            return _GuestCard(
              index: index,
              controllers: _guestControllers[index],
              onRemove: _totalGuests > 1 ? () => _removeGuest(index) : null,
              onDobChanged: (dob, isAdult) {
                setState(() {
                  _guestControllers[index]['dob'] = dob;
                  _guestControllers[index]['isAdult'] = isAdult;
                });
              },
            );
          }),
        ],
      ),
    );
  }

  void _removeGuest(int index) {
    if (_totalGuests <= 1) return;

    final guest = _guestControllers[index];
    guest['name']?.dispose();
    guest['idNumber']?.dispose();

    setState(() {
      _guestControllers.removeAt(index);
      if (index < _adults) {
        _adults--;
      } else {
        _children--;
      }
    });
  }

  Widget _buildTermsSection() {
    return GestureDetector(
      onTap: () => setState(() => _agreedToTerms = !_agreedToTerms),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: _agreedToTerms,
            onChanged: (v) => setState(() => _agreedToTerms = v ?? false),
            activeColor: const Color(0xFF007AFF),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                  children: [
                    TextSpan(text: 'Tôi đồng ý với '),
                    TextSpan(
                      text: 'Điều khoản & Chính sách',
                      style: TextStyle(
                        color: Color(0xFF007AFF),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: ' của Travery và khách sạn.'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        12,
        16,
        MediaQuery.of(context).padding.bottom + 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tổng cộng',
                style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
              ),
              Text(
                _formatPrice(_totalPrice),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF007AFF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitBooking,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF007AFF),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Tiếp tục thanh toán',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GuestCard extends StatelessWidget {
  const _GuestCard({
    required this.index,
    required this.controllers,
    required this.onRemove,
    required this.onDobChanged,
  });

  final int index;
  final Map<String, dynamic> controllers;
  final VoidCallback? onRemove;
  final Function(DateTime dob, bool isAdult) onDobChanged;

  DateTime get _dob => controllers['dob'] as DateTime;
  bool get _isAdult => controllers['isAdult'] as bool;
  TextEditingController get _nameController =>
      controllers['name'] as TextEditingController;
  TextEditingController get _idController =>
      controllers['idNumber'] as TextEditingController;

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  Future<void> _selectDob(BuildContext context) async {
    final now = DateTime.now();
    DateTime firstDate;
    DateTime lastDate;

    if (_isAdult) {
      lastDate = now.subtract(const Duration(days: 12 * 365));
      firstDate = now.subtract(const Duration(days: 100 * 365));
    } else {
      lastDate = now.subtract(const Duration(days: 1));
      firstDate = now.subtract(const Duration(days: 11 * 365));
    }

    final picked = await showDatePicker(
      context: context,
      initialDate: _dob,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      final age = _calculateAge(picked);
      final isAdult = age >= 12;
      onDobChanged(picked, isAdult);
    }
  }

  int _calculateAge(DateTime dob) {
    final now = DateTime.now();
    int age = now.year - dob.year;
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: index < 999 ? 12 : 0),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: _isAdult
                      ? const Color(0xFFDBEAFE)
                      : const Color(0xFFFEF3C7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _isAdult ? Icons.person : Icons.child_care,
                      size: 14,
                      color: _isAdult
                          ? const Color(0xFF2563EB)
                          : const Color(0xFFD97706),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _isAdult ? 'Người lớn' : 'Trẻ em',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: _isAdult
                            ? const Color(0xFF2563EB)
                            : const Color(0xFFD97706),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              if (onRemove != null)
                GestureDetector(
                  onTap: onRemove,
                  child: const Icon(
                    Icons.delete_outline,
                    size: 20,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          _GuestTextField(
            controller: _nameController,
            label: 'Họ và tên',
            hint: 'VD: NGUYEN VAN A',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Vui lòng nhập họ tên';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _GuestTextField(
                  controller: _idController,
                  label: 'Số CCCD',
                  hint: '012345678',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Vui lòng nhập CCCD';
                    }
                    final cleanId = value.replaceAll(RegExp(r'\s'), '');
                    if (cleanId.length < 9 || cleanId.length > 12) {
                      return '9-12 số';
                    }
                    if (!RegExp(r'^\d+$').hasMatch(cleanId)) {
                      return 'Chỉ nhập số';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectDob(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ngày sinh',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _formatDate(_dob),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GuestTextField extends StatelessWidget {
  const _GuestTextField({
    required this.controller,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
            filled: true,
            fillColor: const Color(0xFFF8FAFF),
            errorStyle: const TextStyle(fontSize: 11, color: Colors.red),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFF007AFF),
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
