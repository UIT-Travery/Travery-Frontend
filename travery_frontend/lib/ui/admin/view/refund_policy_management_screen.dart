import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/data/services/api/model/tour/refund_policy_response/refund_policy_response.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/admin/view_model/refund_policy_management_view_model.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'widgets/refund_policy_card.dart';
import 'widgets/small_button.dart';

class RefundPolicyManagementScreen extends StatefulWidget {
  final RefundPolicyManagementViewModel viewModel;

  const RefundPolicyManagementScreen({super.key, required this.viewModel});

  @override
  State<RefundPolicyManagementScreen> createState() =>
      _RefundPolicyManagementScreenState();
}

class _RefundPolicyManagementScreenState extends State<RefundPolicyManagementScreen> {
  String _selectedFilter = 'Tất cả';
  final List<String> _filters = ['Tất cả', 'Khách sạn', 'Tour'];

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadPolicies.addListener(_onLoadResult);
    widget.viewModel.deletePolicy.addListener(_onDeleteResult);
    widget.viewModel.loadPolicies.execute();
  }

  @override
  void didUpdateWidget(RefundPolicyManagementScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.loadPolicies.removeListener(_onLoadResult);
      oldWidget.viewModel.deletePolicy.removeListener(_onDeleteResult);
      widget.viewModel.loadPolicies.addListener(_onLoadResult);
      widget.viewModel.deletePolicy.addListener(_onDeleteResult);
      widget.viewModel.loadPolicies.execute();
    }
  }

  @override
  void dispose() {
    widget.viewModel.loadPolicies.removeListener(_onLoadResult);
    widget.viewModel.deletePolicy.removeListener(_onDeleteResult);
    super.dispose();
  }

  void _onLoadResult() {
    final cmd = widget.viewModel.loadPolicies;
    if (cmd.error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi: ${cmd.error.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _onDeleteResult() {
    final cmd = widget.viewModel.deletePolicy;
    if (cmd.completed) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đã xóa chính sách hoàn tiền'),
          backgroundColor: Colors.green,
        ),
      );
      widget.viewModel.loadPolicies.execute();
    } else if (cmd.error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi: ${cmd.error.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  List<RefundPolicyResponse> _filtered(List<RefundPolicyResponse> all) {
    if (_selectedFilter == 'Tất cả') return all;
    final typeFilter = _selectedFilter == 'Khách sạn' ? 'HOTEL' : 'TOUR';
    return all.where((a) => a.serviceType == typeFilter).toList();
  }

  String _buildRulesSummary(List<RefundPolicyRuleResponse> rules) {
    if (rules.isEmpty) return 'Không có luật (Hoàn tiền 0%)';
    final summaries = rules.map((r) {
      final unit = (r.timeUnit == 'DAYS' || r.timeUnit == 'DAY') ? 'ngày' : 'giờ';
      return 'Trưóc ${r.timeBefore?.toInt()} $unit: ${r.refundPercentage?.toInt()}%';
    });
    return summaries.join('\n');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'CS Hoàn tiền',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
                SmallButton(
                  label: 'Thêm',
                  prefixIcon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  ),
                  onTap: () async {
                    await context.push(Routes.adminCreateRefundPolicy);
                    widget.viewModel.loadPolicies.execute();
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Danh sách các chính sách hoàn tiền',
              style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 16),
            Row(
              children: _filters.map((filter) {
                final isSelected = _selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedFilter = filter),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF003399)
                            : const Color(0xFFDCE6FB),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        filter,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF64748B),
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListenableBuilder(
                listenable: widget.viewModel.loadPolicies,
                builder: (context, _) {
                  final cmd = widget.viewModel.loadPolicies;
                  if (cmd.running) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (cmd.error) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Color(0xFFCC0000),
                            size: 48,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Không thể tải dữ liệu',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: () =>
                                widget.viewModel.loadPolicies.execute(),
                            child: const Text('Thử lại'),
                          ),
                        ],
                      ),
                    );
                  }
                  final result = cmd.result;
                  final all = result is Ok<List<RefundPolicyResponse>> ? result.value : <RefundPolicyResponse>[];
                  final filtered = _filtered(all);
                  if (filtered.isEmpty) {
                    return Center(
                      child: Text(
                        'Chưa có chính sách nào',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final item = filtered[index];
                      return RefundPolicyCard(
                        title: item.name ?? 'Không tên',
                        subtitle: item.serviceType == 'HOTEL' ? 'Khách sạn' : 'Tour',
                        rulesSummary: _buildRulesSummary(item.rules),
                        onEdit: () async {
                          await context.push(
                            Routes.adminUpdateRefundPolicy,
                            extra: item,
                          );
                          widget.viewModel.loadPolicies.execute();
                        },
                        onDelete: () {
                          _showDeleteConfirmDialog(item.id ?? '');
                        },
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

  void _showDeleteConfirmDialog(String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xác nhận xóa'),
        content: const Text('Bạn có chắc chắn muốn xóa chính sách này?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              widget.viewModel.deletePolicy.execute(id);
            },
            child: const Text('Xóa', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
