import 'package:flutter/material.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour/coordinator_tour.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_tour_info_field.dart';

class CoordinatorViewTourScreen extends StatefulWidget {
  final CoordinatorTour tour;

  const CoordinatorViewTourScreen({super.key, required this.tour});

  @override
  State<CoordinatorViewTourScreen> createState() =>
      _CoordinatorViewTourScreenState();
}

class _CoordinatorViewTourScreenState extends State<CoordinatorViewTourScreen> {
  // Collapse/Expand state flags
  bool _isDetailsExpanded = false;
  bool _isBookingsExpanded = false;
  bool _isItineraryExpanded = false;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final tour = widget.tour;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // ── App Bar ─────────────────────────────────
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16, statusBarHeight + 10, 16, 20),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const Text(
                  'Tour chi tiết',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // ── Scrollable Body ───────────────────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Tour Image Hero ────────────────────────────────────────
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary, width: 2),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://vnn-imgs-f.vgcloud.vn/2019/10/24/16/du-lich-dai-loan-tu-tuc-nhung-dieu-can-biet.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withValues(alpha: 0.8),
                            Colors.transparent
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Text(
                        tour.tourName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ── Date Info Fields ─────────────────────────
                  Row(
                    children: [
                      Expanded(
                        child: CoordinatorTourInfoField(
                          label: 'Ngày bắt đầu',
                          content: tour.startDate,
                          prefixIcon: Icons.calendar_today_outlined,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CoordinatorTourInfoField(
                          label: 'Ngày kết thúc',
                          content: tour.endDate,
                          prefixIcon: Icons.calendar_today_outlined,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // ── Location Info Fields ─────────────────────────
                  Row(
                    children: [
                      Expanded(
                        child: CoordinatorTourInfoField(
                          label: 'Nơi khởi hành',
                          content: tour.pickupLocation.isNotEmpty
                              ? tour.pickupLocation
                              : 'Tp.HCM',
                          prefixIcon: Icons.location_on_outlined,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CoordinatorTourInfoField(
                          label: 'Nơi đến',
                          content: tour.destinationName.isNotEmpty
                              ? tour.destinationName
                              : 'Tp.HCM',
                          prefixIcon: Icons.location_on_outlined,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // ── Participants Info Fields ─────────────────────────
                  Row(
                    children: [
                      Expanded(
                        child: CoordinatorTourInfoField(
                          label: 'Số người tối thiểu',
                          content: '${tour.minParticipants}',
                          prefixIcon: Icons.person_outline,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CoordinatorTourInfoField(
                          label: 'Số người tối đa',
                          content: '${tour.maxParticipants}',
                          prefixIcon: Icons.person_outline,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // ── Đơn giá (Price) ─────────────────────────
                  const Text(
                    'Đơn giá',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Người lớn',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Text(
                              '14.000.000 VNĐ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Trẻ em',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Text(
                              '14.000.000 VNĐ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ── Expandable Section: Thông tin chi tiết ──────────────────
                  _buildExpandableHeader(
                    title: 'Thông tin chi tiết',
                    isExpanded: _isDetailsExpanded,
                    onTap: () => setState(
                      () => _isDetailsExpanded = !_isDetailsExpanded,
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: _isDetailsExpanded
                        ? Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Column(
                              children: [
                                if (tour.guideName != null)
                                  _buildInfoCard(
                                    icon: Icons.person_outline,
                                    title: 'Hướng dẫn viên',
                                    lines: [
                                      tour.guideName!,
                                      if (tour.guidePhone != null)
                                        tour.guidePhone!,
                                    ],
                                  ),
                                if (tour.driverName != null)
                                  _buildInfoCard(
                                    icon: Icons.drive_eta_outlined,
                                    title: 'Tài xế',
                                    lines: [
                                      tour.driverName!,
                                      if (tour.driverPhone != null)
                                        tour.driverPhone!,
                                    ],
                                  ),
                                if (tour.coachLicensePlate != null)
                                  _buildInfoCard(
                                    icon: Icons.directions_bus_outlined,
                                    title: 'Xe',
                                    lines: [
                                      tour.coachLicensePlate!,
                                      if (tour.coachType != null)
                                        tour.coachType!,
                                    ],
                                  ),
                                if (tour.guideName == null &&
                                    tour.driverName == null &&
                                    tour.coachLicensePlate == null)
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text(
                                      'Chưa phân công nhân sự',
                                      style: TextStyle(
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),

                  // ── Expandable Section: Danh sách Booking ────────────────
                  _buildExpandableHeader(
                    title: 'Danh sách Booking',
                    isExpanded: _isBookingsExpanded,
                    onTap: () => setState(
                      () => _isBookingsExpanded = !_isBookingsExpanded,
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: _isBookingsExpanded
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              'Chức năng xem danh sách booking đang được phát triển.',
                              style: TextStyle(color: AppColors.textSecondary),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),

                  // ── Expandable Section: Lịch trình chi tiết ────────────────
                  _buildExpandableHeader(
                    title: 'Lịch trình chi tiết',
                    isExpanded: _isItineraryExpanded,
                    onTap: () => setState(
                      () => _isItineraryExpanded = !_isItineraryExpanded,
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: _isItineraryExpanded
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              'Chức năng xem lịch trình chi tiết đang được phát triển.',
                              style: TextStyle(color: AppColors.textSecondary),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required List<String> lines,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primary, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                ...lines.map(
                  (l) => Text(
                    l,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableHeader({
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            Icon(
              isExpanded
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
              color: AppColors.textPrimary,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
