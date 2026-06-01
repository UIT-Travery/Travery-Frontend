import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';

class HotelAddonListScreen extends StatefulWidget {
  const HotelAddonListScreen({super.key});

  @override
  State<HotelAddonListScreen> createState() => _HotelAddonListScreenState();
}

class _HotelAddonListScreenState extends State<HotelAddonListScreen> {
  int _selectedTab = 0;
  final Map<String, int> _quantities = {};

  final List<String> _tabs = ['TẤT CẢ', 'ĐỒ ĂN', 'SPA', 'GIẶT ỦI', 'Khác'];

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }

  double get _totalPrice {
    return _dummyAddons.fold<double>(0, (sum, addon) {
      final qty = _quantities[addon['id']] ?? 1;
      return sum + (addon['price'] as double) * qty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      body: Column(
        children: [
          _buildHeader(),
          _buildTabs(),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _dummyAddons.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final addon = _dummyAddons[index];
                return _AddonCard(
                  addon: addon,
                  quantity: _quantities[addon['id']] ?? 1,
                  formatPrice: _formatPrice,
                  onQuantityChanged: (qty) {
                    setState(() => _quantities[addon['id']] = qty);
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(
        4,
        MediaQuery.of(context).padding.top + 8,
        16,
        8,
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
          const Expanded(
            child: Text(
              'Thêm dịch vụ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2937),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(_tabs.length, (index) {
            final isActive = index == _selectedTab;
            return GestureDetector(
              onTap: () => setState(() => _selectedTab = index),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isActive
                          ? const Color(0xFF0056B3)
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  _tabs[index],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                    color: isActive
                        ? const Color(0xFF0056B3)
                        : const Color(0xFF6B7280),
                  ),
                ),
              ),
            );
          }),
        ),
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
        border: const Border(top: BorderSide(color: Color(0xFFE5E7EB))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              context.push(Routes.hotelAddonPayment);
            },
            icon: const Icon(Icons.shopping_cart),
            label: const Text('Thêm vào đơn'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0056B3),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
          ),
        ),
      ),
    );
  }

  static final List<Map<String, dynamic>> _dummyAddons = [
    {
      'id': 'addon1',
      'name': 'Floating Breakfast',
      'description':
          'Trải nghiệm bữa sáng đẳng cấp ngay tại hồ bơi riêng của bạn với đầy đủ các món',
      'price': 550000.0,
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuB_920TuGqtWdaevysr2YvGs4E703Z4TbwANDMwJv-hYuv7L3BVeWPT8-VHPEJuSAGyfjFYyUE3R-O5xjh1VESvMmRaj73na1wMqtH6rh3IB0sH8iynpem2e-9Rp8kSCXrKafDkVz3lDHftWbZXz-b8TUnIlG6zDTpIAj4vs6NObwQepxcgHfyRFZDmXHtvFhuyPi7rUyknQdobRKfQpluLdrU-dzcqrQgbLLaNuQqC_m_Mbgdfe0GTR9U2fucroMTT0T-3sbs5NQ',
      'category': 'ĐỒ ĂN',
      'emoji': '🍽️',
      'unit': '/set',
    },
    {
      'id': 'addon2',
      'name': 'Deep Tissue Massage',
      'description':
          '60 phút massage sâu giúp giải tỏa căng thẳng cơ bắp và phục hồi năng lượng tối',
      'price': 1200000.0,
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAefxYI2SusAkxrWdJi324JVls2C7S7VHxqZHJ2aR0aa5ZqlDZ_C9G_8Ir4SsuaVKZfy460szCcSqwr36ajuHgiWlBcFOFtLmzAX3pGwDmpG9nzlm5uq0FDtjhfREcQAhX0ogwI2k6hcre8zdX6y4lPpfVNUh68IvmqbK9fa5avQjHUauDvp_A1Wagpr5xgX9xi696zNDgvIEFa3JVNJLT4FD3uOFx44t2IXbE_C5tOkDplMKKh8W5QH4KZNiIuu02b2O_3Qyv6Kg',
      'category': 'SPA',
      'emoji': '💆',
      'unit': '',
    },
    {
      'id': 'addon3',
      'name': 'Afternoon Tea',
      'description':
          'Set trà chiều sang trọng với các loại bánh ngọt thủ công và trà đặc sản tại Lounge.',
      'price': 350000.0,
      'imageUrl':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuB3feblgKV1p2pwvpI3JbGbM6kOJ8G-8eyANuJ1vz6jPDitxbvgNGdWMBBNyBmyWN9nEbIfwyLA5URC2uNOU7IbjkmnqRwN1HPBW7l0Ad00TJIDx_XdSwo6hYdRx0knUiQ2jvQuofV6UlhBlphzO9tLsVumQFv9r493fWTeAQ1SG7gnumYEi23jVRqUZ9d2bIVJ053lxR4ObAAIihX3aH5anY43h1LjrvRcKd3ZmfM6M-W6SNkHalh8-jQL4fDPZgu56s_gtOUsCQ',
      'category': 'ĐỒ ĂN',
      'emoji': '🍽️',
      'unit': '/set',
    },
  ];
}

class _AddonCard extends StatelessWidget {
  const _AddonCard({
    required this.addon,
    required this.quantity,
    required this.formatPrice,
    required this.onQuantityChanged,
  });

  final Map<String, dynamic> addon;
  final int quantity;
  final String Function(double) formatPrice;
  final ValueChanged<int> onQuantityChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  addon['imageUrl'] as String,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: const Color(0xFFF0F7FF),
                    child: const Center(
                      child: Icon(
                        Icons.restaurant,
                        size: 48,
                        color: Color(0xFFBFDBFE),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        addon['emoji'] as String,
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        addon['category'] as String,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0056B3),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  addon['name'] as String,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0056B3),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  addon['description'] as String,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${formatPrice(addon['price'] as double)}${addon['unit']}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0056B3),
                      ),
                    ),
                    _QuantitySelector(
                      quantity: quantity,
                      onChanged: onQuantityChanged,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantitySelector extends StatelessWidget {
  const _QuantitySelector({required this.quantity, required this.onChanged});

  final int quantity;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              if (quantity > 1) onChanged(quantity - 1);
            },
            child: Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              child: Icon(
                Icons.remove,
                size: 16,
                color: quantity > 1
                    ? const Color(0xFF0056B3)
                    : const Color(0xFFD1D5DB),
              ),
            ),
          ),
          SizedBox(
            width: 32,
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2937),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onChanged(quantity + 1),
            child: Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              child: const Icon(Icons.add, size: 16, color: Color(0xFF0056B3)),
            ),
          ),
        ],
      ),
    );
  }
}
