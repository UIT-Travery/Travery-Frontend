import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/domain/models/admin/business_account/business_account.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/admin/view_model/account_management_view_model.dart';
import 'package:travery_frontend/utils/alert.dart';
import 'package:travery_frontend/utils/core_result.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_theme.dart';
import 'widgets/account_card.dart';
import 'widgets/fliter_list.dart';
import 'widgets/search_bar.dart';

class AccountManagementScreen extends StatefulWidget {
  const AccountManagementScreen({super.key, required this.viewModel});
  final AccountManagementViewModel viewModel;
  @override
  State<AccountManagementScreen> createState() =>
      _AccountManagementScreenState();
}

class _AccountManagementScreenState extends State<AccountManagementScreen> {
  // Filter labels: index 0 = all, 1..n = specific roles
  static const _filterLabels = [
    'Tất cả',
    'Điều phối viên',
    'Hướng dẫn viên',
    'Lễ tân',
    'Khách hàng',
  ];
  static const _filterRoles = [
    null,
    'COORDINATOR',
    'GUIDE',
    'RECEPTIONIST',
    'TOURIST',
  ];

  int _selectedFilterIndex = 0;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadUsers.addListener(_onLoadResult);
    widget.viewModel.banUser.addListener(_onBanResult);
    widget.viewModel.unbanUser.addListener(_onUnbanResult);
    widget.viewModel.deleteUser.addListener(_onDeleteResult);
    _loadUsers();
  }

  @override
  void didUpdateWidget(covariant AccountManagementScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.loadUsers.removeListener(_onLoadResult);
    widget.viewModel.loadUsers.addListener(_onLoadResult);
    oldWidget.viewModel.banUser.removeListener(_onBanResult);
    widget.viewModel.banUser.addListener(_onBanResult);
    oldWidget.viewModel.unbanUser.removeListener(_onUnbanResult);
    widget.viewModel.unbanUser.addListener(_onUnbanResult);
    oldWidget.viewModel.deleteUser.removeListener(_onDeleteResult);
    widget.viewModel.deleteUser.addListener(_onDeleteResult);
  }

  @override
  void dispose() {
    widget.viewModel.loadUsers.removeListener(_onLoadResult);
    widget.viewModel.banUser.removeListener(_onBanResult);
    widget.viewModel.unbanUser.removeListener(_onUnbanResult);
    widget.viewModel.deleteUser.removeListener(_onDeleteResult);
    _searchController.dispose();
    super.dispose();
  }

  // ── Helpers ─────────────────────────────────────────────────────────────────

  void _loadUsers() {
    widget.viewModel.loadUsers.execute((
      role: _filterRoles[_selectedFilterIndex],
      status: null,
      page: 0,
      size: 100,
    ));
  }

  List<BusinessAccount> _parseAccounts() {
    final cmd = widget.viewModel.loadUsers;
    if (cmd.result is! Ok<Map<String, dynamic>>) return [];
    final data = (cmd.result as Ok<Map<String, dynamic>>).value;
    final contentRaw = data['content'] as List<dynamic>? ?? [];
    return contentRaw.map((e) {
      final map = e as Map<String, dynamic>;
      return BusinessAccount(
        id: map['id'] as String? ?? '',
        name: map['fullName'] as String? ?? '',
        email: map['email'] as String? ?? '',
        role: BusinessAccount.roleFromApi(map['role'] as String?),
        status: BusinessAccount.statusFromApi(map['status'] as String?),
        avatarUrl: map['avatarUrl'] as String?,
        phoneNumber: map['phoneNumber'] as String?,
        createdAt: map['createdAt'] as String?,
      );
    }).toList();
  }

  List<BusinessAccount> _applySearch(List<BusinessAccount> list) {
    if (_searchQuery.isEmpty) return list;
    final q = _searchQuery.toLowerCase();
    return list
        .where(
          (a) =>
              a.name.toLowerCase().contains(q) ||
              a.email.toLowerCase().contains(q),
        )
        .toList();
  }

  // ── Result handlers (initState/didUpdateWidget/dispose pattern) ─────────────

  void _onLoadResult() {
    if (widget.viewModel.loadUsers.error) {
      final result = widget.viewModel.loadUsers.result;
      var errorMessage = 'Không thể tải danh sách người dùng';
      if (result case Error(:final error)) {
        errorMessage = error.toString().replaceAll('HttpException: ', '');
      }
      widget.viewModel.loadUsers.clearResult();
      if (mounted) Utils.showErrorNotification(context, errorMessage);
    }
    if (mounted) setState(() {});
  }

  void _onBanResult() {
    final cmd = widget.viewModel.banUser;
    if (cmd.running) return;
    if (cmd.error) {
      final msg = cmd.result is Error
          ? (cmd.result as Error).error.toString().replaceAll(
              'HttpException: ',
              '',
            )
          : 'Không thể cấm người dùng';
      cmd.clearResult();
      if (mounted) Utils.showErrorNotification(context, msg);
    } else if (cmd.completed) {
      cmd.clearResult();
      if (mounted) {
        Utils.showSuccessNotification(context, 'Đã cấm tài khoản thành công');
        _loadUsers();
      }
    }
  }

  void _onUnbanResult() {
    final cmd = widget.viewModel.unbanUser;
    if (cmd.running) return;
    if (cmd.error) {
      final msg = cmd.result is Error
          ? (cmd.result as Error).error.toString().replaceAll(
              'HttpException: ',
              '',
            )
          : 'Không thể bỏ cấm người dùng';
      cmd.clearResult();
      if (mounted) Utils.showErrorNotification(context, msg);
    } else if (cmd.completed) {
      cmd.clearResult();
      if (mounted) {
        Utils.showSuccessNotification(
          context,
          'Đã bỏ cấm tài khoản thành công',
        );
        _loadUsers();
      }
    }
  }

  void _onDeleteResult() {
    final cmd = widget.viewModel.deleteUser;
    if (cmd.running) return;
    if (cmd.error) {
      final msg = cmd.result is Error
          ? (cmd.result as Error).error.toString().replaceAll(
              'HttpException: ',
              '',
            )
          : 'Không thể xóa tài khoản';
      cmd.clearResult();
      if (mounted) Utils.showErrorNotification(context, msg);
    } else if (cmd.completed) {
      cmd.clearResult();
      if (mounted) {
        Utils.showSuccessNotification(context, 'Đã xóa tài khoản thành công');
        _loadUsers();
      }
    }
  }

  // ── Build ────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AdminSearchBar(
                controller: _searchController,
                onChanged: (value) => setState(() => _searchQuery = value),
              ),
            ),
            const SizedBox(height: 14),
            FilterList(
              filters: _filterLabels,
              selectedIndex: _selectedFilterIndex,
              onSelected: (index) {
                setState(() => _selectedFilterIndex = index);
                _loadUsers();
              },
            ),
            const SizedBox(height: 14),
            Expanded(
              child: ListenableBuilder(
                listenable: widget.viewModel.loadUsers,
                builder: (context, _) {
                  final cmd = widget.viewModel.loadUsers;

                  if (cmd.running) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final allAccounts = _parseAccounts();
                  final filtered = _applySearch(allAccounts);

                  if (filtered.isEmpty) return _buildEmptyState();

                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 100),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final account = filtered[index];
                      return AccountCard(
                        name: account.name,
                        email: account.email,
                        role: account.role,
                        status: account.status,
                        avatarUrl: account.avatarUrl,
                        onTap: () => _onAccountTap(account),
                        onMenuTap: () => _showAccountMenu(context, account),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await context.push(Routes.adminCreateAccount);
          if (result == true && mounted) {
            _loadUsers();
          }
        },
        backgroundColor: AppColors.primaryDarkBlackBlue,
        child: const Icon(Icons.add_rounded, color: Colors.white),
      ),
    );
  }

  // ── Empty state ──────────────────────────────────────────────────────────────

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off_rounded, size: 56, color: AppColors.textHint),
          const SizedBox(height: 12),
          Text(
            'Không tìm thấy người dùng',
            style: TextStyle(
              fontSize: AppTextTheme.bodyLarge,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // ── Handlers ─────────────────────────────────────────────────────────────────

  void _onAccountTap(BusinessAccount account) async {
    await context.push(Routes.adminViewDetailAccountWithId(account.id));
    if (mounted) {
      _loadUsers();
    }
  }

  void _showAccountMenu(BuildContext context, BusinessAccount account) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => _AccountMenuSheet(
        account: account,
        onBan: () {
          Navigator.pop(context);
          widget.viewModel.banUser.execute(account.id);
        },
        onUnban: () {
          Navigator.pop(context);
          widget.viewModel.unbanUser.execute(account.id);
        },
        onDelete: () {
          Navigator.pop(context);
          _confirmDelete(account);
        },
        onViewDetail: () {
          Navigator.pop(context);
          _onAccountTap(account);
        },
      ),
    );
  }

  void _confirmDelete(BusinessAccount account) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Xóa tài khoản'),
        content: Text(
          'Bạn có chắc muốn xóa tài khoản của ${account.name}? '
          'Hành động này không thể hoàn tác.',
        ),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Hủy')),
          TextButton(
            onPressed: () {
              context.pop();
              widget.viewModel.deleteUser.execute(account.id);
            },
            child: Text('Xóa', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Bottom-sheet menu
// ─────────────────────────────────────────────────────────────────────────────

class _AccountMenuSheet extends StatelessWidget {
  const _AccountMenuSheet({
    required this.account,
    required this.onBan,
    required this.onUnban,
    required this.onDelete,
    required this.onViewDetail,
  });

  final BusinessAccount account;
  final VoidCallback onBan;
  final VoidCallback onUnban;
  final VoidCallback onDelete;
  final VoidCallback onViewDetail;

  @override
  Widget build(BuildContext context) {
    final isBanned = account.status == AccountStatus.banned;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.inputBorder,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                account.name,
                style: TextStyle(
                  fontSize: AppTextTheme.bodyLarge,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Divider(),
            _MenuOption(
              icon: Icons.person_outline_rounded,
              label: 'Xem chi tiết',
              onTap: onViewDetail,
            ),
            _MenuOption(
              icon: isBanned ? Icons.lock_open_rounded : Icons.block_rounded,
              label: isBanned ? 'Bỏ cấm tài khoản' : 'Cấm tài khoản',
              onTap: isBanned ? onUnban : onBan,
            ),
            _MenuOption(
              icon: Icons.delete_outline_rounded,
              label: 'Xóa tài khoản',
              color: AppColors.error,
              onTap: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuOption extends StatelessWidget {
  const _MenuOption({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? AppColors.textPrimary;
    return ListTile(
      leading: Icon(icon, color: effectiveColor, size: 22),
      title: Text(
        label,
        style: TextStyle(
          fontSize: AppTextTheme.bodyMedium,
          color: effectiveColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    );
  }
}
