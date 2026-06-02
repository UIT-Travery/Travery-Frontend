import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_task_card.dart';

// Lightweight task data model for display purposes
class _TaskItem {
  final TaskUrgency urgency;
  final String urgencyLabel;
  final String departureDate;
  final String tourName;
  final String taskDescription;

  const _TaskItem({
    required this.urgency,
    required this.urgencyLabel,
    required this.departureDate,
    required this.tourName,
    required this.taskDescription,
  });
}

class CoordinatorViewTaskListScreen extends StatefulWidget {
  const CoordinatorViewTaskListScreen({super.key});

  @override
  State<CoordinatorViewTaskListScreen> createState() =>
      _CoordinatorViewTaskListScreenState();
}

class _CoordinatorViewTaskListScreenState
    extends State<CoordinatorViewTaskListScreen>
    with AutomaticKeepAliveClientMixin {
  // Mock summary counters — replace with ViewModel data
  static const int _needProcessCount = 12;
  static const int _nearDeadlineCount = 5;
  static const int _overdueCount = 2;

  // Mock task list — replace with ViewModel data
  static const List<_TaskItem> _tasks = [
    _TaskItem(
      urgency: TaskUrgency.overdue,
      urgencyLabel: 'QUÁ HẠN\n30P',
      departureDate: '25/12/2025',
      tourName: 'Tour Đà Lạt - 3 Ngày 2 Đêm',
      taskDescription: 'Phân công xe, tài xế và hướng dẫn viên',
    ),
    _TaskItem(
      urgency: TaskUrgency.nearDeadline,
      urgencyLabel: 'CÒN 2\nGIỜ',
      departureDate: '26/12/2025',
      tourName: 'Tp Hồ Chí Minh - Hòn Sơn',
      taskDescription: 'Phân công xe, tài xế và hướng dẫn viên',
    ),
    _TaskItem(
      urgency: TaskUrgency.upcoming,
      urgencyLabel: 'CÒN 2\nNGÀY',
      departureDate: '28/12/2025',
      tourName: 'City Tour Hồ Chí Minh Nửa Ngày',
      taskDescription: 'Phân công xe, tài xế và hướng dẫn viên',
    ),
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 16),
          _buildSummaryRow(),
          const SizedBox(height: 16),
          Expanded(child: _buildTaskList()),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16, statusBarHeight + 16, 16, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDarkBlackBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: const Center(
        child: Text(
          'Công việc',
          style: TextStyle(
            fontSize: AppTextTheme.headlineSmall,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildSummaryChip(
            label: 'CẦN XỬ\nLÝ',
            count: _needProcessCount,
            countColor: AppColors.textPrimary,
            borderColor: AppColors.inputBorder,
          ),
          const SizedBox(width: 8),
          _buildSummaryChip(
            label: 'SẮP HẾT\nHẠN',
            count: _nearDeadlineCount,
            countColor: AppColors.warning,
            borderColor: AppColors.warning,
          ),
          const SizedBox(width: 8),
          _buildSummaryChip(
            label: 'QUÁ\nHẠN',
            count: _overdueCount,
            countColor: AppColors.error,
            borderColor: AppColors.error,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryChip({
    required String label,
    required int count,
    required Color countColor,
    required Color borderColor,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: AppTextTheme.bodySmall,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '$count',
              style: TextStyle(
                fontSize: AppTextTheme.headlineSmall,
                fontWeight: FontWeight.bold,
                color: countColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskList() {
    if (_tasks.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.task_alt, color: AppColors.textSecondary, size: 48),
            SizedBox(height: 12),
            Text(
              'Không có công việc nào',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: AppTextTheme.bodyMedium,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      itemCount: _tasks.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final task = _tasks[index];
        return CoordinatorTaskCard(
          urgency: task.urgency,
          urgencyLabel: task.urgencyLabel,
          departureDate: task.departureDate,
          tourName: task.tourName,
          taskDescription: task.taskDescription,
          onAssign: () {
            // TODO: navigate to assignment screen
          },
        );
      },
    );
  }
}
