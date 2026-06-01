import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/tour/detail/view_models/tour_detail_view_model.dart';
import 'package:travery_frontend/data/models/tour/tour_detail_page_data.dart';
import 'package:travery_frontend/data/seed_models/tour_instance/tour_instance.dart';
import 'package:travery_frontend/ui/user/tour/widgets/tour_image_carousel.dart';
import 'package:travery_frontend/ui/user/tour/widgets/price_card.dart';
import 'package:travery_frontend/ui/user/tour/widgets/itinerary_day.dart';
import 'package:travery_frontend/ui/user/widgets/section_title.dart';
import 'package:travery_frontend/data/services/api/model/tour/refund_policy_response/refund_policy_response.dart';

class TourDetailScreen extends StatefulWidget {
  const TourDetailScreen({
    super.key,
    required this.viewModel,
    required this.tourId,
  });

  final TourDetailViewModel viewModel;
  final String tourId;

  @override
  State<TourDetailScreen> createState() => _TourDetailScreenState();
}

class _TourDetailScreenState extends State<TourDetailScreen> {
  TourInstance? _selectedInstance;
  String? _selectedTourId;

  @override
  void initState() {
    super.initState();
    _selectedInstance = null;
    _selectedTourId = null;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.loadTourDetail(widget.tourId);
      widget.viewModel.loadTourInstances(widget.tourId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFF),
      body: Consumer<TourDetailViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoadingDetail) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.error != null || vm.tourDetail == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.grey),
                  const SizedBox(height: 12),
                  const Text('Không thể tải chi tiết tour'),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => vm.loadTourDetail(widget.tourId),
                    child: const Text('Thử lại'),
                  ),
                ],
              ),
            );
          }

          final tour = vm.tourDetail!;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                backgroundColor: Colors.white,
                leading: GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF131B2E),
                    ),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: TourImageCarousel(images: tour.images ?? []),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tour.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF131B2E),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.orange,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  tour.averageRating!.toStringAsFixed(1),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF131B2E),
                                  ),
                                ),
                                if (tour.ratingCount != null)
                                  Text(
                                    ' (${tour.ratingCount} đánh giá)',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF414755),
                                    ),
                                  )
                                else
                                  const Text(
                                    ' (0 đánh giá)',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF414755),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (tour.durationDays != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8F4F8),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.schedule,
                                    size: 14,
                                    color: Color(0xFF0058BC),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    _formatDuration(tour.durationDays!),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF0058BC),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.trip_origin,
                            size: 14,
                            color: Color(0xFF414755),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'Điểm xuất phát: ',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF414755),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              tour.startLocation ?? 'N/A',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF131B2E),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 14,
                            color: Color(0xFF414755),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'Điểm đến: ',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF414755),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              tour.destination?.name ?? 'N/A',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF131B2E),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const SectionTitle(
                        title: 'Giá tour',
                        icon: Icons.payments,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: PriceCard(
                              label: 'Người lớn',
                              price: tour.pricePerAdult,
                              subtitle: 'Từ 12 tuổi trở lên',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: PriceCard(
                              label: 'Trẻ em',
                              price: tour.pricePerChild,
                              subtitle: 'Từ 11 tuổi trở xuống',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const SectionTitle(
                        title: 'Lịch khởi hành',
                        icon: Icons.calendar_month,
                      ),
                      const SizedBox(height: 12),
                      _buildScheduleList(vm),
                      const SizedBox(height: 24),
                      if (tour.itineraryList != null &&
                          tour.itineraryList!.isNotEmpty) ...[
                        const SectionTitle(
                          title: 'Lịch trình chi tiết',
                          icon: Icons.route,
                        ),
                        const SizedBox(height: 12),
                        _buildItinerary(tour.itineraryList!),
                        const SizedBox(height: 24),
                      ],
                      if (tour.description != null &&
                          tour.description!.isNotEmpty) ...[
                        const SectionTitle(
                          title: 'Mô tả',
                          icon: Icons.description,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          tour.description!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF414755),
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                      if (tour.refundPolicy != null) ...[
                        SectionTitle(
                          title:
                              tour.refundPolicy!.name ?? 'Chính sách hoàn hủy',
                          icon: Icons.policy,
                        ),
                        const SizedBox(height: 12),
                        _buildRefundPolicy(tour.refundPolicy!),
                      ],
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Consumer<TourDetailViewModel>(
        builder: (context, vm, _) {
          if (vm.instances.isEmpty) return const SizedBox.shrink();
          return Container(
            padding: EdgeInsets.fromLTRB(
              20,
              12,
              20,
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_selectedInstance != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${_formatDate(_selectedInstance!.startDate)} - ${_formatDate(_selectedInstance!.endDate)}',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          _selectedInstance!.availableSlots > 0
                              ? 'Còn ${_selectedInstance!.availableSlots} chỗ'
                              : 'Hết chỗ',
                          style: TextStyle(
                            fontSize: 12,
                            color: _selectedInstance!.availableSlots > 0
                                ? const Color(0xFF0058BC)
                                : const Color(0xFFBA1A1A),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ElevatedButton(
                  onPressed:
                      _selectedInstance != null &&
                          _selectedInstance!.availableSlots > 0
                      ? () {
                          context.push(
                            '/tour/${widget.tourId}/book',
                            extra: {
                              'instanceId': _selectedInstance!.id,
                              'tourName': vm.tourDetail?.name ?? '',
                              'destinationName':
                                  vm.tourDetail?.destination?.name ?? '',
                              // 'startLocation': vm.tourDetail?.startLocation ?? '',
                              'pricePerAdult':
                                  vm.tourDetail?.pricePerAdult ?? 0,
                              'pricePerChild':
                                  vm.tourDetail?.pricePerChild ?? 0,
                              'startDate': _formatDate(
                                _selectedInstance!.startDate,
                              ),
                              'endDate': _formatDate(
                                _selectedInstance!.endDate,
                              ),
                            },
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                    disabledBackgroundColor: Colors.grey[300],
                  ),
                  child: Text(
                    _selectedInstance == null
                        ? 'Không có lịch khả dụng'
                        : _selectedInstance!.availableSlots <= 0
                        ? 'Hết chỗ'
                        : 'Đặt Tour Ngay',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
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

  Widget _buildScheduleList(TourDetailViewModel vm) {
    if (vm.isLoadingInstances)
      return const Center(child: CircularProgressIndicator());
    if (vm.instances.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F3FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          'Hiện chưa có lịch khởi hành',
          style: TextStyle(color: Color(0xFF414755)),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_selectedInstance == null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F3FF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFC1C6D7), width: 1),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 18,
                  color: const Color(0xFF414755),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Chưa chọn ngày khởi hành',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF414755),
                  ),
                ),
              ],
            ),
          ),
        ...vm.instances.map((instance) {
          final isAvailable = instance.availableSlots > 0;
          final isSelected = _selectedInstance?.id == instance.id;
          return GestureDetector(
            onTap: () => setState(() {
              _selectedInstance = instance;
              _selectedTourId = widget.tourId;
            }),
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary.withValues(alpha: 0.06)
                    : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : const Color(0xFFC1C6D7).withValues(alpha: 0.3),
                  width: isSelected ? 1.5 : 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : const Color(0xFFC1C6D7),
                        width: 1.5,
                      ),
                      color: isSelected
                          ? AppColors.primary
                          : Colors.transparent,
                    ),
                    child: isSelected
                        ? const Icon(Icons.check, size: 12, color: Colors.white)
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_formatDate(instance.startDate)} - ${_formatDate(instance.endDate)}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isAvailable
                                ? const Color(0xFF131B2E)
                                : Colors.grey,
                          ),
                        ),
                        Text(
                          _getInstanceStatusLabel(instance.status),
                          style: TextStyle(
                            fontSize: 12,
                            color: _getInstanceStatusColor(instance.status),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: instance.availableSlots > 0
                          ? const Color(0xFFD2E1F7)
                          : const Color(0xFFFFDAD6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      instance.availableSlots > 0
                          ? 'Còn ${instance.availableSlots} chỗ'
                          : 'Hết chỗ',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: instance.availableSlots > 0
                            ? const Color(0xFF0058BC)
                            : const Color(0xFFBA1A1A),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildItinerary(List<TourItineraryPageData> itinerary) {
    return Column(
      children: itinerary.map((day) => ItineraryDay(day: day)).toList(),
    );
  }

  Widget _buildRefundPolicy(RefundPolicyResponse policy) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFC1C6D7).withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (policy.rules != null)
            ...policy.rules!.map((rule) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Trước ${rule.timeBefore?.toInt() ?? 0} ngày',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF414755),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Hoàn ${rule.refundPercentage?.toInt() ?? 0}%',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF131B2E),
                      ),
                    ),
                  ],
                ),
              );
            }),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) =>
      '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';

  String _formatDuration(int days) {
    if (days == 1) return '1N';
    final nights = days - 1;
    if (nights == 1) return '1N1Đ';
    return '${days}N${nights}Đ';
  }

  String _getInstanceStatusLabel(TourInstanceStatus status) {
    switch (status) {
      case TourInstanceStatus.PLANNING:
        return 'Đang lên kế hoạch';
      case TourInstanceStatus.OPEN:
        return 'Mở bán';
      case TourInstanceStatus.FULL:
        return 'Đã đầy';
      case TourInstanceStatus.IN_PROGRESS:
        return 'Đang diễn ra';
      case TourInstanceStatus.COMPLETED:
        return 'Đã hoàn thành';
      case TourInstanceStatus.CANCELLED:
        return 'Đã hủy';
      case TourInstanceStatus.POSTPONED:
        return 'Tạm hoãn';
    }
  }

  Color _getInstanceStatusColor(TourInstanceStatus status) {
    switch (status) {
      case TourInstanceStatus.OPEN:
        return AppColors.primary;
      case TourInstanceStatus.FULL:
        return Colors.orange;
      case TourInstanceStatus.CANCELLED:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
