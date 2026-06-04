import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';

class RecepViewReviews extends StatelessWidget {
  const RecepViewReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7FA),
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(
                Icons.home_outlined,
                color: Color(0xFF1E3A8A),
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Lễ tân',
              style: TextStyle(
                color: Color(0xFF1E3A8A),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () => context.push(Routes.recepProfile),
              child: const CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Đánh giá',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E232C),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Danh sách các đánh giá khách hàng',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 24),
            // Overall Rating Card
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      const Text(
                        '4.8',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF003B95),
                        ),
                      ),
                      Text(
                        '/5',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(
                          5,
                          (index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'DỰA TRÊN 124 ĐÁNH GIÁ',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Filter Button
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF003B95),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Lọc',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Review List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _mockReviews.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final review = _mockReviews[index];
                return _buildReviewCard(review);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> review) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (review['avatarUrl'] != null)
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(review['avatarUrl']),
                )
              else
                CircleAvatar(
                  radius: 20,
                  backgroundColor: const Color(0xFF003B95),
                  child: Text(
                    review['name'][0].toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF1E232C),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      review['date'],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < review['rating'] ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            review['content'],
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF4A4A4A),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> _mockReviews = [
  {
    'name': 'Trần Mai Phương',
    'date': '15 Tháng 10, 2023',
    'rating': 5,
    'avatarUrl': 'https://i.pravatar.cc/150?img=5',
    'content':
        'Tour tổ chức cực kỳ chuyên nghiệp. Hướng dẫn viên tên Nam rất nhiệt tình và am hiểu lịch sử địa phương. Khách sạn lưu trú sạch sẽ, đồ ăn ngon và hợp khẩu vị. Chắc chắn sẽ tiếp tục ủng hộ công ty trong những chuyến đi sắp tới.',
  },
  {
    'name': 'Lê Văn Quyết',
    'date': '10 Tháng 10, 2023',
    'rating': 4,
    'avatarUrl': 'https://i.pravatar.cc/150?img=11',
    'content':
        'Lịch trình sắp xếp hợp lý, không quá mệt mỏi. Tuy nhiên ngày thứ 2 có mưa nhẹ nên ảnh hưởng một chút đến trải nghiệm ngắm cảnh. Xe đưa đón đời mới, êm ái. Đánh giá chung là tốt và đáng tiền.',
  },
  {
    'name': 'Hoàng Anh Tâm',
    'date': '02 Tháng 10, 2023',
    'rating': 5,
    'avatarUrl': null, // uses initial 'H'
    'content':
        'Gia đình tôi đã có một kỷ niệm đáng nhớ. Các bé rất thích các hoạt động vui chơi được thiết kế riêng. Cảm ơn Travery đã mang đến dịch vụ chu đáo từ A đến Z!',
  },
];
