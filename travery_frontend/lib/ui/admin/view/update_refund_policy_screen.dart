import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/data/services/api/model/admin/refund_policy_request.dart';
import 'package:travery_frontend/data/services/api/model/tour/refund_policy_response/refund_policy_response.dart';
import 'package:travery_frontend/ui/admin/view_model/update_refund_policy_view_model.dart';
import 'widgets/dropdown_button.dart';
import 'widgets/input_text_field.dart';
import 'widgets/large_button.dart';

class UpdateRefundPolicyScreen extends StatefulWidget {
  final UpdateRefundPolicyViewModel viewModel;
  final RefundPolicyResponse policy;

  const UpdateRefundPolicyScreen({
    super.key,
    required this.viewModel,
    required this.policy,
  });

  @override
  State<UpdateRefundPolicyScreen> createState() => _UpdateRefundPolicyScreenState();
}

class _UpdateRefundPolicyScreenState extends State<UpdateRefundPolicyScreen> {
  late TextEditingController _nameController;
  late String _selectedServiceType;
  final List<String> _serviceTypeLabels = ['Khách sạn', 'Tour'];
  
  late List<RefundPolicyRuleRequest> _rules;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.policy.name ?? '');
    _selectedServiceType = widget.policy.serviceType ?? 'HOTEL';
    
    _rules = widget.policy.rules.map((r) => RefundPolicyRuleRequest(
      timeBefore: r.timeBefore ?? 0,
      timeUnit: r.timeUnit ?? 'DAYS',
      refundPercentage: r.refundPercentage ?? 0,
    )).toList();

    widget.viewModel.updatePolicy.addListener(_onResult);
  }

  @override
  void didUpdateWidget(UpdateRefundPolicyScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.updatePolicy.removeListener(_onResult);
      widget.viewModel.updatePolicy.addListener(_onResult);
    }
  }

  @override
  void dispose() {
    widget.viewModel.updatePolicy.removeListener(_onResult);
    _nameController.dispose();
    super.dispose();
  }

  void _onResult() {
    final cmd = widget.viewModel.updatePolicy;
    if (cmd.completed) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đã cập nhật chính sách hoàn tiền'),
          backgroundColor: Colors.green,
        ),
      );
      context.pop();
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

  void _submit() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập tên chính sách')),
      );
      return;
    }

    final request = RefundPolicyRequest(
      name: name,
      serviceType: _selectedServiceType,
      rules: _rules,
    );

    widget.viewModel.updatePolicy.execute(widget.policy.id ?? '', request);
  }

  void _addRuleDialog() {
    final timeController = TextEditingController();
    final percentController = TextEditingController();
    String unit = 'DAYS';

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Thêm luật hoàn tiền'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: timeController,
                      decoration: const InputDecoration(labelText: 'Thời gian trước (số)'),
                      keyboardType: TextInputType.number,
                    ),
                    DropdownButton<String>(
                      value: unit,
                      isExpanded: true,
                      items: const [
                        DropdownMenuItem(value: 'DAYS', child: Text('Ngày')),
                        DropdownMenuItem(value: 'HOURS', child: Text('Giờ')),
                      ],
                      onChanged: (val) {
                        if (val != null) setDialogState(() => unit = val);
                      },
                    ),
                    TextField(
                      controller: percentController,
                      decoration: const InputDecoration(labelText: 'Phần trăm hoàn (0-100)'),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Hủy'),
                ),
                TextButton(
                  onPressed: () {
                    final timeBefore = double.tryParse(timeController.text) ?? 0;
                    final percent = double.tryParse(percentController.text) ?? 0;
                    setState(() {
                      _rules.add(RefundPolicyRuleRequest(
                        timeBefore: timeBefore,
                        timeUnit: unit,
                        refundPercentage: percent,
                      ));
                    });
                    Navigator.pop(context);
                  },
                  child: const Text('Thêm'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sửa Chính sách',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 24),
            CustomDropdownButton(
              label: 'Loại dịch vụ',
              textholder: 'Chọn loại dịch vụ',
              prefixIcon: const Icon(Icons.category_outlined, color: Colors.black54),
              items: _serviceTypeLabels,
              value: _selectedServiceType == 'HOTEL' ? 'Khách sạn' : 'Tour',
              onChanged: (value) {
                setState(() {
                  _selectedServiceType = value == 'Khách sạn' ? 'HOTEL' : 'TOUR';
                });
              },
            ),
            const SizedBox(height: 16),
            InputTextField(
              label: 'Tên chính sách',
              textholder: 'VD: Hoàn 100% trước 7 ngày',
              prefixIcon: const Icon(Icons.text_format, color: Colors.black54),
              controller: _nameController,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Các luật (Rules)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton.icon(
                  onPressed: _addRuleDialog,
                  icon: const Icon(Icons.add),
                  label: const Text('Thêm'),
                )
              ],
            ),
            if (_rules.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text('Chưa có luật nào, hoàn tiền mặc định 0%'),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _rules.length,
                itemBuilder: (context, index) {
                  final rule = _rules[index];
                  final unitStr = rule.timeUnit == 'DAYS' ? 'Ngày' : 'Giờ';
                  return Card(
                    child: ListTile(
                      title: Text('Hoàn ${rule.refundPercentage.toInt()}%'),
                      subtitle: Text('Trước ${rule.timeBefore.toInt()} $unitStr'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _rules.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            const SizedBox(height: 48),
            ListenableBuilder(
              listenable: widget.viewModel.updatePolicy,
              builder: (context, _) {
                final running = widget.viewModel.updatePolicy.running;
                return LargeButton(
                  text: running ? 'Đang xử lý...' : 'Xác nhận',
                  onTap: running ? () {} : _submit,
                );
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
