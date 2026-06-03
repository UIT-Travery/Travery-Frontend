import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:travery_frontend/data/services/guide/guide_mission_service.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/guide/mission/check_in/guide_checkin_view_model.dart';
import 'package:travery_frontend/ui/guide/mission/check_in/widgets/member_attendance_tile.dart';

class GuideCheckinScreen extends StatefulWidget {
  const GuideCheckinScreen({super.key, required this.missionId});

  final String missionId;

  @override
  State<GuideCheckinScreen> createState() => _GuideCheckinScreenState();
}

class _GuideCheckinScreenState extends State<GuideCheckinScreen> {
  late GuideCheckinViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = GuideCheckinViewModel(
      missionService: context.read<GuideMissionService>(),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.fetchMission(widget.missionId);
    });
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceBlue,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: ListenableBuilder(
              listenable: _viewModel.loadMission,
              builder: (context, _) {
                if (_viewModel.loadMission.running) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                }

                if (_viewModel.loadMission.error) {
                  return _buildErrorState();
                }

                final mission = _viewModel.loadMission.value;
                if (mission == null) {
                  return _buildEmptyState();
                }

                return _buildContent(mission);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: AppColors.surface,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 6, 12, 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.primary,
                      size: 20,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 36,
                      minHeight: 36,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Expanded(
                    child: Text(
                      'Điểm danh',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  ListenableBuilder(
                    listenable: _viewModel.attendanceChanges,
                    builder: (context, _) {
                      return Text(
                        '${_viewModel.checkedInCount}/${_viewModel.totalCount}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            // Progress bar
            ListenableBuilder(
              listenable: _viewModel.attendanceChanges,
              builder: (context, _) {
                final progress = _viewModel.totalCount > 0
                    ? _viewModel.checkedInCount / _viewModel.totalCount
                    : 0.0;
                return LinearProgressIndicator(
                  value: progress,
                  backgroundColor: AppColors.surfaceGray,
                  valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                  minHeight: 4,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(GuideMissionDetail mission) {
    final allMembers = mission.bookings.expand((b) => b.members).toList();
    final isEditable = _isEditableStatus(mission.status);

    return Column(
      children: [
        if (!isEditable) _buildReadOnlyBanner(),
        Expanded(
          child: allMembers.isEmpty
              ? _buildEmptyMemberList()
              : ListenableBuilder(
                  listenable: _viewModel.attendanceChanges,
                  builder: (context, _) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      itemCount: allMembers.length,
                      itemBuilder: (context, index) {
                        final member = allMembers[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: MemberAttendanceTile(
                            member: member,
                            currentStatus: _viewModel.getAttendanceStatus(
                              member.id,
                            ),
                            onStatusChanged: (status) {
                              _viewModel.updateAttendance(member.id, status);
                            },
                            isEditable: isEditable,
                          ),
                        );
                      },
                    );
                  },
                ),
        ),
        // Bottom action buttons
        if (isEditable) _buildBottomActions(),
      ],
    );
  }

  bool _isEditableStatus(String status) {
    return status == 'FULL' || status == 'IN_PROGRESS';
  }

  Widget _buildReadOnlyBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: const Color(0xFFfef3c7),
      child: const Row(
        children: [
          Icon(Icons.info_outline, size: 16, color: Color(0xFFd97706)),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Chỉ có thể điểm danh khi tour ở trạng thái FULL hoặc ĐANG DIỄN RA',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFFd97706),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyMemberList() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_outline, color: AppColors.textSecondary, size: 48),
          SizedBox(height: 12),
          Text(
            'Chưa có hành khách nào',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: AppTextTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: ListenableBuilder(
          listenable: Listenable.merge([
            _viewModel.attendanceChanges,
            _viewModel.isSaving,
            _viewModel.saveError,
          ]),
          builder: (context, _) {
            return Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Hủy',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: _viewModel.isSaving.value
                        ? null
                        : _saveAttendance,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _viewModel.isSaving.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          )
                        : const Text(
                            'Lưu thay đổi',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _saveAttendance() async {
    final success = await _viewModel.saveAttendance();
    if (!mounted) return;

    final messenger = ScaffoldMessenger.of(context);
    if (success) {
      messenger.showSnackBar(
        SnackBar(
          content: const Text('Điểm danh đã được lưu'),
          backgroundColor: AppColors.success,
          duration: const Duration(seconds: 1),
          onVisible: () {
            if (mounted) Navigator.pop(context);
          },
        ),
      );
    } else {
      messenger.showSnackBar(
        SnackBar(
          content: Text(_viewModel.saveError.value ?? 'Lưu thất bại'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: AppColors.error, size: 48),
          const SizedBox(height: 12),
          const Text(
            'Đã xảy ra lỗi khi tải dữ liệu',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: AppTextTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => _viewModel.fetchMission(widget.missionId),
            child: const Text('Thử lại'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, color: AppColors.textSecondary, size: 48),
          SizedBox(height: 12),
          Text(
            'Không tìm thấy thông tin nhiệm vụ',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: AppTextTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
