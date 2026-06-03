import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/user/hotel/widgets/hotel_app_bar.dart';

class HotelBookingInputScreen extends StatefulWidget {
  const HotelBookingInputScreen({super.key});

  @override
  State<HotelBookingInputScreen> createState() =>
      _HotelBookingInputScreenState();
}

class _HotelBookingInputScreenState extends State<HotelBookingInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  int _adults = 1;
  int _children = 0;
  int get _totalGuests => _adults + _children;

  List<Map<String, dynamic>> _guestControllers = [];

  bool _agreedToTerms = false;

  @override
  void initState() {
    super.initState();
    _initGuests();
  }

  void _initGuests() {
    _guestControllers = List.generate(_totalGuests, (index) {
      final isAdult = index == 0;
      return {
        'name': TextEditingController(),
        'idNumber': TextEditingController(),
        'dob': DateTime.now().subtract(
          Duration(days: isAdult ? 25 * 365 : 5 * 365),
        ),
        'isAdult': isAdult,
      };
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
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

    _guestControllers = List.generate(_totalGuests, (index) {
      final isAdult = index < _adults;
      return {
        'name': TextEditingController(),
        'idNumber': TextEditingController(),
        'dob': DateTime.now().subtract(
          Duration(days: isAdult ? 25 * 365 : 5 * 365),
        ),
        'isAdult': isAdult,
      };
    });
    setState(() {});
  }

  void _increaseAdults() {
    setState(() => _adults++);
    _updateGuests();
  }

  void _decreaseAdults() {
    if (_adults > 1) {
      setState(() => _adults--);
      _updateGuests();
    }
  }

  void _increaseChildren() {
    setState(() => _children++);
    _updateGuests();
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

  double get _totalPrice => 4500000;

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _submitBooking() {
    if (!_formKey.currentState!.validate()) return;

    if (_nameController.text.trim().isEmpty) {
      _showError('Vui lòng nhập tên liên hệ');
      return;
    }
    if (_phoneController.text.trim().isEmpty) {
      _showError('Vui lòng nhập số điện thoại');
      return;
    }
    if (!_agreedToTerms) {
      _showError('Vui lòng đồng ý với điều khoản');
      return;
    }

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
    }

    context.push(Routes.hotelBookingReview);
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
                  _buildGuestCountSection(),
                  const SizedBox(height: 16),
                  _buildContactSection(),
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
              _buildCounterButtons(_adults, _decreaseAdults, _increaseAdults),
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
    VoidCallback onIncrease,
  ) {
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
            onPressed: onIncrease,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            color: const Color(0xFF007AFF),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
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
            'Thông tin liên hệ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _nameController,
            label: 'Họ và tên',
            hint: 'VD: Nguyễn Văn A',
            icon: Icons.person_outline,
          ),
          const SizedBox(height: 12),
          _buildTextField(
            controller: _phoneController,
            label: 'Số điện thoại',
            hint: 'VD: 0912345678',
            icon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
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
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, size: 20, color: const Color(0xFF9CA3AF)),
            filled: true,
            fillColor: const Color(0xFFF8FAFF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
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

  int _calculateAge(DateTime dob) {
    final now = DateTime.now();
    int age = now.year - dob.year;
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
      age--;
    }
    return age;
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
              const SizedBox(width: 8),
              Text(
                '$index tuổi',
                style: const TextStyle(fontSize: 11, color: Color(0xFF6B7280)),
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
          _buildField(
            controller: _nameController,
            label: 'Họ và tên',
            hint: 'VD: NGUYEN VAN A',
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _buildField(
                  controller: _idController,
                  label: 'Số CCCD/Hộ chiếu',
                  hint: '012345678',
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

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
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
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
            filled: true,
            fillColor: const Color(0xFFF8FAFF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
