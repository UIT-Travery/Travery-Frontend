import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/models/tour/tour_filter_options.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/tour/list/view_models/tour_list_view_model.dart';
import 'package:travery_frontend/ui/user/widgets/tour_card.dart';
import 'package:travery_frontend/ui/user/widgets/empty_state.dart';
import 'package:travery_frontend/ui/user/widgets/error_state.dart';
import 'package:travery_frontend/ui/user/widgets/user_app_bar.dart';

class TourListScreen extends StatefulWidget {
  const TourListScreen({super.key, required this.viewModel, this.keyword});

  final TourListViewModel viewModel;
  final String? keyword;

  @override
  State<TourListScreen> createState() => _TourListScreenState();
}

class _TourListScreenState extends State<TourListScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.keyword ?? '';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.loadTours(keyword: widget.keyword);
    });
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      widget.viewModel.loadMore();
    }
  }

  void _onSearchChanged(String value) {
    widget.viewModel.setKeywordDebounced(value);
  }

  void _onSubmitSearch(String value) {
    widget.viewModel.searchNow();
  }

  void _clearSearch() {
    _searchController.clear();
    _searchFocus.unfocus();
    widget.viewModel.setKeywordImmediate('');
    widget.viewModel.searchNow();
  }

  void _showFilterSheet(BuildContext context) {
    final vm = widget.viewModel;
    RangeValues? tempPriceRange;
    int? tempMinRating;
    DateTime? tempStartDate;
    double minAllowed = 0;
    double maxAllowed = 20000000;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheetState) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.4,
              maxChildSize: 0.95,
              expand: false,
              builder: (_, scrollController) => ListView(
                controller: scrollController,
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Bộ lọc',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF131B2E),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setSheetState(() {
                            tempPriceRange = null;
                            tempMinRating = null;
                            tempStartDate = null;
                          });
                        },
                        child: const Text(
                          'Xóa lọc',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Price filter with RangeSlider
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Khoảng giá',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF131B2E),
                        ),
                      ),
                      Text(
                        tempPriceRange != null
                            ? '${_formatPriceShort(tempPriceRange!.start)} - ${_formatPriceShort(tempPriceRange!.end)}'
                            : 'Tất cả',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  RangeSlider(
                    values:
                        tempPriceRange ?? RangeValues(minAllowed, maxAllowed),
                    min: minAllowed,
                    max: maxAllowed,
                    divisions: 40,
                    labels: RangeLabels(
                      _formatPriceShort(tempPriceRange?.start ?? minAllowed),
                      _formatPriceShort(tempPriceRange?.end ?? maxAllowed),
                    ),
                    activeColor: AppColors.primary,
                    inactiveColor: AppColors.primary.withValues(alpha: 0.2),
                    onChanged: (values) {
                      setSheetState(() {
                        if (values.end == maxAllowed) {
                          tempPriceRange = RangeValues(
                            values.start,
                            maxAllowed,
                          );
                        } else {
                          tempPriceRange = values;
                        }
                      });
                    },
                    onChangeEnd: (values) {
                      setSheetState(() {
                        if (values.end == maxAllowed) {
                          tempPriceRange = RangeValues(
                            values.start,
                            maxAllowed,
                          );
                        } else {
                          tempPriceRange = values;
                        }
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatPriceShort(minAllowed),
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF717786),
                        ),
                      ),
                      Text(
                        _formatPriceShort(maxAllowed),
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF717786),
                        ),
                      ),
                    ],
                  ),

                  // Rating filter
                  const SizedBox(height: 20),
                  const Text(
                    'Đánh giá',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF131B2E),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: kRatingOptions.map((opt) {
                      final selected = tempMinRating == opt.minRating;
                      return FilterChip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(opt.label),
                            const SizedBox(width: 2),
                            const Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                        selected: selected,
                        onSelected: (_) {
                          setSheetState(() {
                            tempMinRating = selected ? null : opt.minRating;
                          });
                        },
                        selectedColor: AppColors.primary.withValues(
                          alpha: 0.15,
                        ),
                        checkmarkColor: AppColors.primary,
                        labelStyle: TextStyle(
                          fontSize: 13,
                          color: selected
                              ? AppColors.primary
                              : const Color(0xFF414755),
                          fontWeight: selected
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                        backgroundColor: const Color(0xFFF2F3FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: selected
                                ? AppColors.primary
                                : Colors.transparent,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                      );
                    }).toList(),
                  ),

                  // Date filter
                  const SizedBox(height: 20),
                  const Text(
                    'Ngày khởi hành',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF131B2E),
                    ),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton.icon(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: ctx,
                        initialDate:
                            tempStartDate ??
                            DateTime.now().add(const Duration(days: 1)),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                        builder: (ctx, child) => Theme(
                          data: Theme.of(ctx).copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: AppColors.primary,
                            ),
                          ),
                          child: child!,
                        ),
                      );
                      if (date != null) {
                        setSheetState(() => tempStartDate = date);
                      }
                    },
                    icon: const Icon(Icons.calendar_today, size: 18),
                    label: Text(
                      tempStartDate != null
                          ? '${tempStartDate!.day.toString().padLeft(2, '0')}/${tempStartDate!.month.toString().padLeft(2, '0')}/${tempStartDate!.year}'
                          : 'Chọn ngày',
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF414755),
                      side: const BorderSide(color: Color(0xFFC1C6D7)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final minPrice = tempPriceRange?.start;
                        final maxPrice = tempPriceRange?.end == maxAllowed
                            ? null
                            : tempPriceRange?.end;
                        vm.setFilters(
                          minPrice: minPrice,
                          maxPrice: maxPrice,
                          minRating: tempMinRating,
                          startDate: tempStartDate,
                          clearMinPrice:
                              tempPriceRange == null && vm.minPrice != null,
                          clearMaxPrice:
                              (tempPriceRange?.end == maxAllowed ||
                                  tempPriceRange == null) &&
                              vm.maxPrice != null,
                          clearMinRating:
                              tempMinRating == null && vm.minRating != null,
                          clearStartDate:
                              tempStartDate == null && vm.startDate != null,
                        );
                        vm.loadTours(
                          minPrice: minPrice,
                          maxPrice: maxPrice,
                          minRating: tempMinRating,
                          startDate: tempStartDate,
                          refresh: true,
                        );
                        Navigator.pop(ctx);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Áp dụng bộ lọc',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFF),
      appBar: const UserAppBar(title: 'Danh sách Tour'),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F3FF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Color(0xFF717786)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            focusNode: _searchFocus,
                            decoration: const InputDecoration(
                              hintText: 'Tìm kiếm tour...',
                              hintStyle: TextStyle(color: Color(0xFF717786)),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 14,
                              ),
                            ),
                            textInputAction: TextInputAction.search,
                            onChanged: _onSearchChanged,
                            onSubmitted: _onSubmitSearch,
                          ),
                        ),
                        if (_searchController.text.isNotEmpty)
                          GestureDetector(
                            onTap: _clearSearch,
                            child: const Icon(
                              Icons.clear,
                              color: Color(0xFF717786),
                              size: 20,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Consumer<TourListViewModel>(
                  builder: (context, vm, _) {
                    return Stack(
                      children: [
                        IconButton(
                          onPressed: () => _showFilterSheet(context),
                          icon: const Icon(
                            Icons.tune,
                            color: Color(0xFF131B2E),
                          ),
                          style: IconButton.styleFrom(
                            backgroundColor: const Color(0xFFF2F3FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(10),
                          ),
                        ),
                        if (vm.hasActiveFilters)
                          Positioned(
                            right: 6,
                            top: 6,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),

          // Active filters
          Consumer<TourListViewModel>(
            builder: (context, vm, _) {
              if (!vm.hasActiveFilters) return const SizedBox.shrink();
              return Container(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                color: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      if (vm.minPrice != null || vm.maxPrice != null)
                        _FilterChip(
                          label: _priceLabel(vm.minPrice, vm.maxPrice),
                          onRemove: () {
                            vm.setFilters(
                              clearMinPrice: true,
                              clearMaxPrice: true,
                            );
                            vm.loadTours(refresh: true);
                          },
                        ),
                      if (vm.minRating != null)
                        _FilterChip(
                          label: '${vm.minRating} sao',
                          onRemove: () {
                            vm.setFilters(clearMinRating: true);
                            vm.loadTours(refresh: true);
                          },
                        ),
                      if (vm.startDate != null)
                        _FilterChip(
                          label:
                              '${vm.startDate!.day.toString().padLeft(2, '0')}/${vm.startDate!.month.toString().padLeft(2, '0')}/${vm.startDate!.year}',
                          onRemove: () {
                            vm.setFilters(clearStartDate: true);
                            vm.loadTours(refresh: true);
                          },
                        ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          vm.clearAllFilters();
                          vm.loadTours(refresh: true);
                        },
                        child: const Text(
                          'Xóa tất cả',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 4),

          // Tour List
          Expanded(
            child: Consumer<TourListViewModel>(
              builder: (context, vm, _) {
                if (vm.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (vm.error != null) {
                  return ErrorState(
                    message: 'Không thể tải danh sách tour',
                    onRetry: () =>
                        vm.loadTours(keyword: widget.keyword, refresh: true),
                  );
                }

                if (vm.tours.isEmpty) {
                  return EmptyState(
                    icon: Icons.travel_explore,
                    title: vm.hasActiveFilters
                        ? 'Không tìm thấy tour phù hợp'
                        : 'Không có tour nào',
                    subtitle: vm.hasActiveFilters
                        ? 'Thử thay đổi bộ lọc để xem kết quả khác'
                        : null,
                  );
                }

                return RefreshIndicator(
                  onRefresh: () =>
                      vm.loadTours(keyword: widget.keyword, refresh: true),
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: vm.tours.length + (vm.isLoadingMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index >= vm.tours.length) {
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final tour = vm.tours[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: TourCard(
                          id: tour.id,
                          name: tour.name,
                          price: tour.price,
                          thumbnailUrl: tour.fullThumbnailUrl,
                          destinationName: tour.destinationName,
                          durationDays: tour.durationDays,
                          averageRating: tour.averageRating,
                          onTap: () => context.push('/tour/${tour.id}'),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _priceLabel(double? min, double? max) {
    if (min == null && max != null) return 'Dưới ${_formatPriceShort(max)}';
    if (min != null && max == null) return 'Trên ${_formatPriceShort(min)}';
    if (min != null && max != null)
      return '${_formatPriceShort(min)} - ${_formatPriceShort(max)}';
    return 'Giá';
  }

  String _formatPriceShort(double price) {
    if (price >= 1000000) {
      return '${(price / 1000000).toStringAsFixed(price % 1000000 == 0 ? 0 : 1)}Tr';
    }
    return '${(price / 1000).toStringAsFixed(0)}K';
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, required this.onRemove});

  final String label;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(Icons.close, size: 14, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
