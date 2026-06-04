import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travery_frontend/utils/alert.dart';
import 'package:travery_frontend/utils/core_result.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_theme.dart';
import 'package:travery_frontend/domain/models/admin/business_account/business_account.dart';
import '../view_model/view_detail_account_view_model.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Screen
// ─────────────────────────────────────────────────────────────────────────────

class ViewDetailAccountScreen extends StatefulWidget {
  const ViewDetailAccountScreen({
    super.key,
    required this.viewModel,
    required this.accountId,
  });

  final ViewDetailAccountViewModel viewModel;
  final String accountId;

  @override
  State<ViewDetailAccountScreen> createState() =>
      _ViewDetailAccountScreenState();
}

class _ViewDetailAccountScreenState extends State<ViewDetailAccountScreen> {
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadAccount.addListener(_onLoadResult);
    widget.viewModel.deleteAccount.addListener(_onDeleteResult);
    widget.viewModel.banAccount.addListener(_onBanResult);
    widget.viewModel.unbanAccount.addListener(_onUnbanResult);
    widget.viewModel.updateReceptionistProfile.addListener(_onUpdateResult);
    widget.viewModel.updateGuideProfile.addListener(_onUpdateResult);
    widget.viewModel.updateCoordinatorProfile.addListener(_onUpdateResult);
    widget.viewModel.updateAvatar.addListener(_onUpdateResult);
    widget.viewModel.loadAccount.execute(widget.accountId);
  }

  @override
  void didUpdateWidget(covariant ViewDetailAccountScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.loadAccount.removeListener(_onLoadResult);
    widget.viewModel.loadAccount.addListener(_onLoadResult);
    oldWidget.viewModel.deleteAccount.removeListener(_onDeleteResult);
    widget.viewModel.deleteAccount.addListener(_onDeleteResult);
    oldWidget.viewModel.banAccount.removeListener(_onBanResult);
    widget.viewModel.banAccount.addListener(_onBanResult);
    oldWidget.viewModel.unbanAccount.removeListener(_onUnbanResult);
    widget.viewModel.unbanAccount.addListener(_onUnbanResult);
    oldWidget.viewModel.updateReceptionistProfile.removeListener(_onUpdateResult);
    widget.viewModel.updateReceptionistProfile.addListener(_onUpdateResult);
    oldWidget.viewModel.updateGuideProfile.removeListener(_onUpdateResult);
    widget.viewModel.updateGuideProfile.addListener(_onUpdateResult);
    oldWidget.viewModel.updateCoordinatorProfile.removeListener(_onUpdateResult);
    widget.viewModel.updateCoordinatorProfile.addListener(_onUpdateResult);
    oldWidget.viewModel.updateAvatar.removeListener(_onUpdateResult);
    widget.viewModel.updateAvatar.addListener(_onUpdateResult);
  }

  @override
  void dispose() {
    widget.viewModel.loadAccount.removeListener(_onLoadResult);
    widget.viewModel.deleteAccount.removeListener(_onDeleteResult);
    widget.viewModel.banAccount.removeListener(_onBanResult);
    widget.viewModel.unbanAccount.removeListener(_onUnbanResult);
    widget.viewModel.updateReceptionistProfile.removeListener(_onUpdateResult);
    widget.viewModel.updateGuideProfile.removeListener(_onUpdateResult);
    widget.viewModel.updateCoordinatorProfile.removeListener(_onUpdateResult);
    widget.viewModel.updateAvatar.removeListener(_onUpdateResult);
    super.dispose();
  }

  // ── Result handlers ────────────────────────────────────────────────────────

  void _onLoadResult() {
    if (mounted) setState(() {});
  }

  void _onDeleteResult() {
    final cmd = widget.viewModel.deleteAccount;
    if (cmd.running) return;
    if (cmd.error) {
      final msg = cmd.result is Error
          ? (cmd.result as Error).error.toString().replaceAll('HttpException: ', '')
          : 'Không thể xóa tài khoản';
      cmd.clearResult();
      if (mounted) Utils.showErrorNotification(context, msg);
    } else if (cmd.completed) {
      cmd.clearResult();
      if (mounted) {
        Utils.showSuccessNotification(context, 'Đã xóa tài khoản thành công');
        context.pop();
      }
    }
  }

  void _onBanResult() {
    final cmd = widget.viewModel.banAccount;
    if (cmd.running) return;
    if (cmd.error) {
      final msg = cmd.result is Error
          ? (cmd.result as Error).error.toString().replaceAll('HttpException: ', '')
          : 'Không thể cấm tài khoản';
      cmd.clearResult();
      if (mounted) Utils.showErrorNotification(context, msg);
    } else if (cmd.completed) {
      cmd.clearResult();
      if (mounted) {
        Utils.showSuccessNotification(context, 'Tài khoản đã bị cấm');
        // Reload to get updated status from server.
        widget.viewModel.loadAccount.execute(widget.accountId);
      }
    }
  }

  void _onUnbanResult() {
    final cmd = widget.viewModel.unbanAccount;
    if (cmd.running) return;
    if (cmd.error) {
      final msg = cmd.result is Error
          ? (cmd.result as Error).error.toString().replaceAll('HttpException: ', '')
          : 'Không thể bỏ cấm tài khoản';
      cmd.clearResult();
      if (mounted) Utils.showErrorNotification(context, msg);
    } else if (cmd.completed) {
      cmd.clearResult();
      if (mounted) {
        Utils.showSuccessNotification(context, 'Tài khoản đã được bỏ cấm');
        widget.viewModel.loadAccount.execute(widget.accountId);
      }
    }
  }

  void _onUpdateResult() {
    // Any of the three update commands or avatar completed.
    final cmds = [
      widget.viewModel.updateReceptionistProfile,
      widget.viewModel.updateGuideProfile,
      widget.viewModel.updateCoordinatorProfile,
      widget.viewModel.updateAvatar,
    ];

    // If any command is still running, wait for it to finish.
    for (final cmd in cmds) {
      if (cmd.running) return;
    }

    bool hasError = false;
    bool hasCompleted = false;
    String errorMessage = 'Không thể cập nhật thông tin';

    for (final cmd in cmds) {
      if (cmd.error) {
        hasError = true;
        errorMessage = cmd.result is Error
            ? (cmd.result as Error).error.toString().replaceAll('HttpException: ', '')
            : errorMessage;
        cmd.clearResult();
      } else if (cmd.completed) {
        hasCompleted = true;
        cmd.clearResult();
      }
    }

    if (hasError) {
      if (mounted) Utils.showErrorNotification(context, errorMessage);
    } else if (hasCompleted) {
      if (mounted) {
        Utils.showSuccessNotification(context, 'Cập nhật thông tin thành công');
        widget.viewModel.loadAccount.execute(widget.accountId);
      }
    }
  }

  // ── Role display text ──────────────────────────────────────────────────────

  String _roleDisplayLabel(AccountRole role) {
    switch (role) {
      case AccountRole.coordinator:
        return 'Điều phối viên';
      case AccountRole.guide:
        return 'Hướng dẫn viên';
      case AccountRole.receptionist:
        return 'Lễ tân';
      case AccountRole.tourist:
        return 'Khách hàng';
      case AccountRole.admin:
        return 'Quản trị viên';
    }
  }

  // ── Handlers ──────────────────────────────────────────────────────────────

  void _onBan() {
    widget.viewModel.banAccount.execute(widget.accountId);
  }

  void _onUnban() {
    widget.viewModel.unbanAccount.execute(widget.accountId);
  }

  void _onDelete(String accountName) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Xóa tài khoản'),
        content: Text(
          'Bạn có chắc muốn xóa tài khoản của $accountName? '
          'Hành động này không thể hoàn tác.',
        ),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Hủy')),
          TextButton(
            onPressed: () {
              context.pop();
              widget.viewModel.deleteAccount.execute(widget.accountId);
            },
            child: Text('Xóa', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
  }

  void _onEditProfile(BusinessAccount account) {
    switch (account.role) {
      case AccountRole.receptionist:
        _showEditReceptionistSheet(account);
        break;
      case AccountRole.guide:
        _showEditGuideSheet(account);
        break;
      case AccountRole.coordinator:
        _showEditCoordinatorSheet(account);
        break;
      default:
        if (mounted) {
          Utils.showErrorNotification(
            context,
            'Chỉ có thể chỉnh sửa thông tin nhân viên',
          );
        }
    }
  }

  Widget _buildAvatarPicker(
    BusinessAccount account,
    String? localAvatarPath,
    VoidCallback onTap,
  ) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: localAvatarPath != null
                  ? Image.file(
                      File(localAvatarPath),
                      width: 88,
                      height: 88,
                      fit: BoxFit.cover,
                    )
                  : (account.avatarUrl != null && account.avatarUrl!.isNotEmpty
                      ? Image.network(
                          account.avatarUrl!,
                          width: 88,
                          height: 88,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => _defaultAvatar(),
                        )
                      : _defaultAvatar()),
            ),
            Positioned(
              bottom: -4,
              right: -4,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.edit, size: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditReceptionistSheet(BusinessAccount account) {
    final nameCtrl = TextEditingController(text: account.name);
    final phoneCtrl = TextEditingController(text: account.phoneNumber ?? '');
    String? localAvatarPath;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (context, setModalState) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 24,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Cập nhật thông tin Lễ tân',
                  style: TextStyle(
                    fontSize: AppTextTheme.headlineSmall,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildAvatarPicker(account, localAvatarPath, () async {
                  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setModalState(() {
                      localAvatarPath = image.path;
                    });
                  }
                }),
                const SizedBox(height: 16),
                _EditField(label: 'Họ tên', controller: nameCtrl),
                const SizedBox(height: 12),
                _EditField(label: 'Số điện thoại', controller: phoneCtrl, keyboardType: TextInputType.phone),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(ctx);
                    if (localAvatarPath != null) {
                      widget.viewModel.updateAvatar.execute((
                        id: widget.accountId,
                        filePath: localAvatarPath!,
                      ));
                    }
                    widget.viewModel.updateReceptionistProfile.execute((
                      id: widget.accountId,
                      fullName: nameCtrl.text.trim().isEmpty ? null : nameCtrl.text.trim(),
                      phoneNumber: phoneCtrl.text.trim().isEmpty ? null : phoneCtrl.text.trim(),
                      shiftType: null,
                      hotelId: null,
                    ));
                  },
                  child: const Text('Lưu thay đổi'),
                ),
              ],
            ),
          );
        }
      ),
    );
  }

  void _showEditGuideSheet(BusinessAccount account) {
    final nameCtrl = TextEditingController(text: account.name);
    final phoneCtrl = TextEditingController(text: account.phoneNumber ?? '');
    String? localAvatarPath;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (context, setModalState) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 24,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Cập nhật thông tin Hướng dẫn viên',
                  style: TextStyle(
                    fontSize: AppTextTheme.headlineSmall,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildAvatarPicker(account, localAvatarPath, () async {
                  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setModalState(() {
                      localAvatarPath = image.path;
                    });
                  }
                }),
                const SizedBox(height: 16),
                _EditField(label: 'Họ tên', controller: nameCtrl),
                const SizedBox(height: 12),
                _EditField(label: 'Số điện thoại', controller: phoneCtrl, keyboardType: TextInputType.phone),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(ctx);
                    if (localAvatarPath != null) {
                      widget.viewModel.updateAvatar.execute((
                        id: widget.accountId,
                        filePath: localAvatarPath!,
                      ));
                    }
                    widget.viewModel.updateGuideProfile.execute((
                      id: widget.accountId,
                      fullName: nameCtrl.text.trim().isEmpty ? null : nameCtrl.text.trim(),
                      phoneNumber: phoneCtrl.text.trim().isEmpty ? null : phoneCtrl.text.trim(),
                      guideLicense: null,
                      yearsExperience: null,
                      languages: null,
                    ));
                  },
                  child: const Text('Lưu thay đổi'),
                ),
              ],
            ),
          );
        }
      ),
    );
  }

  void _showEditCoordinatorSheet(BusinessAccount account) {
    final nameCtrl = TextEditingController(text: account.name);
    final phoneCtrl = TextEditingController(text: account.phoneNumber ?? '');
    String? localAvatarPath;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (context, setModalState) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 24,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Cập nhật thông tin Điều phối viên',
                  style: TextStyle(
                    fontSize: AppTextTheme.headlineSmall,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildAvatarPicker(account, localAvatarPath, () async {
                  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setModalState(() {
                      localAvatarPath = image.path;
                    });
                  }
                }),
                const SizedBox(height: 16),
                _EditField(label: 'Họ tên', controller: nameCtrl),
                const SizedBox(height: 12),
                _EditField(label: 'Số điện thoại', controller: phoneCtrl, keyboardType: TextInputType.phone),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(ctx);
                    if (localAvatarPath != null) {
                      widget.viewModel.updateAvatar.execute((
                        id: widget.accountId,
                        filePath: localAvatarPath!,
                      ));
                    }
                    widget.viewModel.updateCoordinatorProfile.execute((
                      id: widget.accountId,
                      fullName: nameCtrl.text.trim().isEmpty ? null : nameCtrl.text.trim(),
                      phoneNumber: phoneCtrl.text.trim().isEmpty ? null : phoneCtrl.text.trim(),
                      department: null,
                    ));
                  },
                  child: const Text('Lưu thay đổi'),
                ),
              ],
            ),
          );
        }
      ),
    );
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        widget.viewModel.loadAccount,
        widget.viewModel.banAccount,
        widget.viewModel.unbanAccount,
        widget.viewModel.deleteAccount,
      ]),
      builder: (context, _) {
        final cmd = widget.viewModel.loadAccount;
        final isActionRunning =
            widget.viewModel.banAccount.running ||
            widget.viewModel.unbanAccount.running ||
            widget.viewModel.deleteAccount.running ||
            widget.viewModel.updateReceptionistProfile.running ||
            widget.viewModel.updateGuideProfile.running ||
            widget.viewModel.updateCoordinatorProfile.running ||
            widget.viewModel.updateAvatar.running;

        if (cmd.running) {
          return const Scaffold(
            backgroundColor: AppColors.surface,
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (cmd.error) {
          return Scaffold(
            backgroundColor: AppColors.surface,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(child: Text('Lỗi tải thông tin tài khoản')),
                ElevatedButton(
                  onPressed: () => context.pop(),
                  child: const Text('Quay lại'),
                ),
              ],
            ),
          );
        }

        if (cmd.result is! Ok<BusinessAccount>) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(child: Text('Không tìm thấy tài khoản')),
                ElevatedButton(
                  onPressed: () => context.pop(),
                  child: const Text('Quay lại'),
                ),
              ],
            ),
          );
        }

        final account = (cmd.result as Ok<BusinessAccount>).value;

        return Stack(
          children: [
            Scaffold(
              backgroundColor: AppColors.surface,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                scrolledUnderElevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
                  onPressed: () => Navigator.pop(context),
                ),
                title: Text(
                  'Chi tiết tài khoản',
                  style: TextStyle(
                    fontSize: AppTextTheme.headlineMedium,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      _buildProfileCard(account),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            _InfoTile(
                              icon: Icons.badge_outlined,
                              label: 'TÊN',
                              value: account.name.isEmpty ? '—' : account.name,
                            ),
                            if (account.phoneNumber != null &&
                                account.phoneNumber!.isNotEmpty) ...[
                              const SizedBox(height: 10),
                              _InfoTile(
                                icon: Icons.phone,
                                label: 'SỐ ĐIỆN THOẠI',
                                value: account.phoneNumber!,
                              ),
                            ],
                            const SizedBox(height: 10),
                            _InfoTile(
                              icon: Icons.email,
                              label: 'EMAIL',
                              value: account.email,
                            ),
                            if (account.createdAt != null) ...[
                              const SizedBox(height: 10),
                              _InfoTile(
                                icon: Icons.calendar_today_outlined,
                                label: 'NGÀY TẠO',
                                value: _formatDate(account.createdAt!),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (isActionRunning)
              Container(
                color: Colors.black26,
                child: const Center(child: CircularProgressIndicator()),
              ),
          ],
        );
      },
    );
  }

  String _formatDate(String isoDate) {
    try {
      final dt = DateTime.parse(isoDate).toLocal();
      return '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';
    } catch (_) {
      return isoDate;
    }
  }

  // ── App bar ───────────────────────────────────────────────────────────────

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.background,
                border: Border.all(color: AppColors.inputBorder),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: AppColors.textPrimary,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Chi tiết tài khoản',
            style: TextStyle(
              fontSize: AppTextTheme.headlineMedium,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  // ── Profile card ──────────────────────────────────────────────────────────

  Widget _buildProfileCard(BusinessAccount account) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildAvatar(account),
          const SizedBox(height: 14),
          Text(
            account.name,
            style: TextStyle(
              fontSize: AppTextTheme.headlineSmall,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _roleDisplayLabel(account.role),
            style: TextStyle(
              fontSize: AppTextTheme.bodyMedium,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 12),
          _StatusPill(status: account.status),
          const SizedBox(height: 20),
          _buildActionButtons(account),
        ],
      ),
    );
  }

  Widget _buildAvatar(BusinessAccount account) {
    if (account.avatarUrl != null && account.avatarUrl!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          account.avatarUrl!,
          width: 88,
          height: 88,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _defaultAvatar(),
        ),
      );
    }
    return _defaultAvatar();
  }

  Widget _defaultAvatar() {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        color: const Color(0xFF1C3A5E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(Icons.person_rounded, color: Colors.white, size: 48),
    );
  }

  // ── Action buttons ────────────────────────────────────────────────────────

  Widget _buildActionButtons(BusinessAccount account) {
    final isBanned = account.status == AccountStatus.banned;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Edit profile — only for staff roles
        if (account.role == AccountRole.receptionist ||
            account.role == AccountRole.guide ||
            account.role == AccountRole.coordinator)
          ElevatedButton.icon(
            onPressed: () => _onEditProfile(account),
            icon: const Icon(Icons.edit_outlined, size: 18),
            label: const Text('Chỉnh sửa thông tin'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 13),
              textStyle: TextStyle(
                fontSize: AppTextTheme.bodyLarge,
                fontWeight: FontWeight.w600,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),

        if (account.role == AccountRole.receptionist ||
            account.role == AccountRole.guide ||
            account.role == AccountRole.coordinator)
          const SizedBox(height: 10),

        // Ban / Unban
        OutlinedButton.icon(
          onPressed: isBanned ? _onUnban : _onBan,
          icon: Icon(
            isBanned ? Icons.lock_open_rounded : Icons.block_rounded,
            size: 18,
          ),
          label: Text(isBanned ? 'Bỏ cấm tài khoản' : 'Cấm tài khoản'),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primaryDarkBlackBlue,
            side: BorderSide(color: AppColors.primaryDarkBlackBlue),
            padding: const EdgeInsets.symmetric(vertical: 13),
            textStyle: TextStyle(
              fontSize: AppTextTheme.bodyLarge,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        // Delete
        if (account.role != AccountRole.tourist) ...[
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: () => _onDelete(account.name),
            icon: Icon(
              Icons.delete_outline_rounded,
              size: 18,
              color: AppColors.error,
            ),
            label: Text(
              'Xóa tài khoản',
              style: TextStyle(color: AppColors.error),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.error,
              side: BorderSide(color: AppColors.error),
              padding: const EdgeInsets.symmetric(vertical: 13),
              textStyle: TextStyle(
                fontSize: AppTextTheme.bodyLarge,
                fontWeight: FontWeight.w600,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Edit field widget
// ─────────────────────────────────────────────────────────────────────────────

class _EditField extends StatelessWidget {
  const _EditField({
    required this.label,
    required this.controller,
    this.keyboardType,
  });

  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: AppTextTheme.bodySmall,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.inputBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.inputBorder),
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Status pill badge
// ─────────────────────────────────────────────────────────────────────────────

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.status});

  final AccountStatus status;

  @override
  Widget build(BuildContext context) {
    final (label, dotColor, bgColor) = switch (status) {
      AccountStatus.active => (
          'ĐANG HOẠT ĐỘNG',
          AppColors.success,
          const Color(0xFFE8F5E9),
        ),
      AccountStatus.banned => (
          'BỊ CẤM',
          AppColors.error,
          const Color(0xFFFFEBEE),
        ),
      AccountStatus.pending => (
          'CHỜ XÁC NHẬN',
          AppColors.warning,
          const Color(0xFFFFF8E1),
        ),
      AccountStatus.deleted => (
          'ĐÃ XÓA',
          AppColors.textSecondary,
          const Color(0xFFF5F5F5),
        ),
      AccountStatus.inactive => (
          'NGỪNG HOẠT ĐỘNG',
          AppColors.textSecondary,
          const Color(0xFFF0F4FF),
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: AppTextTheme.bodySmall,
              fontWeight: FontWeight.w700,
              color: AppColors.textSecondary,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Info tile card
// ─────────────────────────────────────────────────────────────────────────────

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, size: 18, color: AppColors.textSecondary),
              Text(
                label,
                style: TextStyle(
                  fontSize: AppTextTheme.bodySmall,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.6,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: AppTextTheme.bodyLarge,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
