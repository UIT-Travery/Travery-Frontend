import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/domain/models/admin/business_account/business_account.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/admin/view_model/account_management_view_model.dart';
import 'package:travery_frontend/utils/core_result.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_theme.dart';
import 'widgets/account_card.dart';
import 'widgets/fliter_list.dart';
import 'widgets/search_bar.dart';

class AccountManagementScreen extends StatefulWidget {
  const AccountManagementScreen({super.key});

  @override
  State<AccountManagementScreen> createState() =>
      _AccountManagementScreenState();
}

class _AccountManagementScreenState extends State<AccountManagementScreen> {
  static const _filterLabels = [
    'Tất cả',
    'Điều phối viên',
    'Hướng dẫn viên',
    'Lễ tân',
  ];

  int _selectedFilterIndex = 0;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AccountManagementViewModel>().loadAccounts.execute();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // ── Derived list ──────────────────────────────────────────────────────────
  List<BusinessAccount> _applyFilters(List<BusinessAccount> all) {
    var list = all.toList();

    if (_selectedFilterIndex == 1) {
      list = list.where((a) => a.role == AccountRole.coordinator).toList();
    } else if (_selectedFilterIndex == 2) {
      list = list.where((a) => a.role == AccountRole.guide).toList();
    } else if (_selectedFilterIndex == 3) {
      list = list.where((a) => a.role == AccountRole.receptionist).toList();
    }

    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      list = list
          .where(
            (a) =>
                a.name.toLowerCase().contains(q) ||
                a.email.toLowerCase().contains(q),
          )
          .toList();
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<AccountManagementViewModel>();

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── App bar ────────────────────────────────────────────────────
            _buildAppBar(),

            const SizedBox(height: 16),

            // ── Search bar ─────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AdminSearchBar(
                controller: _searchController,
                onChanged: (value) => setState(() => _searchQuery = value),
              ),
            ),

            const SizedBox(height: 14),

            // ── Filter chips ───────────────────────────────────────────────
            FilterList(
              filters: _filterLabels,
              selectedIndex: _selectedFilterIndex,
              onSelected: (index) =>
                  setState(() => _selectedFilterIndex = index),
            ),

            const SizedBox(height: 14),

            // ── BusinessAccount list ───────────────────────────────────────────────
            Expanded(
              child: ListenableBuilder(
                listenable: vm.loadAccounts,
                builder: (context, _) {
                  final cmd = vm.loadAccounts;

                  if (cmd.running) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final allAccounts = cmd.result is Ok<List<BusinessAccount>>
                      ? (cmd.result as Ok<List<BusinessAccount>>).value
                      : <BusinessAccount>[];

                  final filtered = _applyFilters(allAccounts);

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
    );
  }

  // ── App bar ────────────────────────────────────────────────────────────────
  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.grid_view_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            'Travery Admin',
            style: TextStyle(
              fontSize: AppTextTheme.headlineMedium,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  // ── Empty state ────────────────────────────────────────────────────────────
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off_rounded, size: 56, color: AppColors.textHint),
          const SizedBox(height: 12),
          Text(
            'Không tìm thấy nhân viên',
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

  // ── Handlers ───────────────────────────────────────────────────────────────
  void _onAccountTap(BusinessAccount account) {
    context.push(Routes.adminViewDetailAccountWithId(account.id));
  }

  void _showAccountMenu(BuildContext context, BusinessAccount account) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => _AccountMenuSheet(account: account),
    );
  }
}

class _AccountMenuSheet extends StatelessWidget {
  const _AccountMenuSheet({required this.account});

  final BusinessAccount account;

  @override
  Widget build(BuildContext context) {
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
              icon: Icons.edit_outlined,
              label: 'Chỉnh sửa thông tin',
              onTap: () => Navigator.pop(context),
            ),
            _MenuOption(
              icon: Icons.lock_reset_rounded,
              label: 'Đặt lại mật khẩu',
              onTap: () => Navigator.pop(context),
            ),
            _MenuOption(
              icon: Icons.block_rounded,
              label: account.status == AccountStatus.active
                  ? 'Vô hiệu hóa tài khoản'
                  : 'Kích hoạt tài khoản',
              onTap: () => Navigator.pop(context),
            ),
            _MenuOption(
              icon: Icons.delete_outline_rounded,
              label: 'Xóa tài khoản',
              color: AppColors.error,
              onTap: () => Navigator.pop(context),
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
