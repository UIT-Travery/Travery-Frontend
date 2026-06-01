import 'package:flutter/material.dart';
import 'package:travery_frontend/data/models/tour/tour_detail_page_data.dart';

class TourImageCarousel extends StatefulWidget {
  const TourImageCarousel({super.key, required this.images});

  final List<TourImagePageData> images;

  @override
  State<TourImageCarousel> createState() => _TourImageCarouselState();
}

class _TourImageCarouselState extends State<TourImageCarousel> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return Container(
        color: const Color(0xFFEAEDFF),
        child: const Center(
          child: Icon(Icons.image, size: 60, color: Color(0xFF717786)),
        ),
      );
    }

    return Stack(
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: widget.images.length,
          itemBuilder: (context, index) {
            return Image.network(
              widget.images[index].url,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: const Color(0xFFEAEDFF),
                child: const Center(
                  child: Icon(Icons.image, size: 60, color: Color(0xFF717786)),
                ),
              ),
            );
          },
        ),
        if (widget.images.length > 1)
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.images.length,
                (index) => ListenableBuilder(
                  listenable: _controller,
                  builder: (context, _) {
                    double page = 0;
                    try {
                      page = _controller.page ?? 0;
                    } catch (_) {
                      page = 0;
                    }
                    final isActive = (page.round() == index);
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: isActive ? 20 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: isActive
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.5),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }
}
