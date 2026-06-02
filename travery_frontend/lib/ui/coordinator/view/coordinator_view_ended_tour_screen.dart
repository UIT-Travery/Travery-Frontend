import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'coordinator_view_reviews_screen.dart';

class CoordinatorViewEndedTourScreen extends StatelessWidget {
  const CoordinatorViewEndedTourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          'Đánh giá',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return _buildTourCard(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTourCard(BuildContext context, int index) {
    final List<Map<String, dynamic>> tours = [
      {
        'title': 'Hành Trình Di Sản Miền Trung 4N3Đ',
        'rating': 4.9,
        'count': 124,
        'date': '12/10/2023',
        'imageUrl':
            'https://images.unsplash.com/photo-1540483761890-a1f7be05ce34?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      },
      {
        'title': 'Du Thuyền Hạ Long 5 Sao Mới Nhất',
        'rating': 4.7,
        'count': 89,
        'date': '01/01/2025',
        'imageUrl':
            'https://images.unsplash.com/photo-1528127269322-539801943592?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      },
      {
        'title': 'Nghỉ Dưỡng Phú Quốc - Resort Tiêu Chuẩn...',
        'rating': 5.0,
        'count': 42,
        'date': '24/11/2023',
        'imageUrl':
            'https://images.unsplash.com/photo-1588668214407-6ea9a6d8c272?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      },
      {
        'title': 'Khám Phá Tokyo - Kyoto 6N5Đ',
        'rating': 4.8,
        'count': 215,
        'date': '25/12/2024',
        'imageUrl':
            'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      },
      {
        'title': 'Nghỉ Dưỡng Phú Quốc - Resort Tiêu Chuẩn...',
        'rating': 5.0,
        'count': 42,
        'date': '24/11/2023',
        'imageUrl':
            'https://images.unsplash.com/photo-1588668214407-6ea9a6d8c272?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      },
      {
        'title': 'Khám Phá Tokyo - Kyoto 6N5Đ',
        'rating': 4.8,
        'count': 215,
        'date': '25/12/2024',
        'imageUrl':
            'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      },
    ];

    final tour = tours[index];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CoordinatorViewReviewsScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(tour['imageUrl']),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withValues(alpha: 0.8)],
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.white, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '${tour['rating']} (${tour['count']})',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                tour['title'],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                'Kết thúc: ${tour['date']}',
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
