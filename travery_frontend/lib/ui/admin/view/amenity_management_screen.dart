import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/data/services/api/model/hotel/amenity_response.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/admin/view_model/amenity_management_view_model.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'widgets/amenity_card.dart';
import 'widgets/small_button.dart';

class AmenityManagementScreen extends StatefulWidget {
  final AmenityManagementViewModel viewModel;

  const AmenityManagementScreen({super.key, required this.viewModel});

  @override
  State<AmenityManagementScreen> createState() =>
      _AmenityManagementScreenState();
}

class _AmenityManagementScreenState extends State<AmenityManagementScreen> {
  String _selectedFilter = 'Tất cả';
  final List<String> _filters = ['Tất cả', 'Phòng', 'Khách sạn'];

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadAmenities.addListener(_onLoadResult);
    widget.viewModel.deleteAmenity.addListener(_onDeleteResult);
    widget.viewModel.loadAmenities.execute();
  }

  @override
  void didUpdateWidget(AmenityManagementScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.loadAmenities.removeListener(_onLoadResult);
      oldWidget.viewModel.deleteAmenity.removeListener(_onDeleteResult);
      widget.viewModel.loadAmenities.addListener(_onLoadResult);
      widget.viewModel.deleteAmenity.addListener(_onDeleteResult);
      widget.viewModel.loadAmenities.execute();
    }
  }

  @override
  void dispose() {
    widget.viewModel.loadAmenities.removeListener(_onLoadResult);
    widget.viewModel.deleteAmenity.removeListener(_onDeleteResult);
    super.dispose();
  }

  void _onLoadResult() {
    final cmd = widget.viewModel.loadAmenities;
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
    final cmd = widget.viewModel.deleteAmenity;
    if (cmd.completed) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đã xóa cơ sở vật chất'),
          backgroundColor: Colors.green,
        ),
      );
      widget.viewModel.loadAmenities.execute();
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

  List<AmenityResponse> _filtered(List<AmenityResponse> all) {
    if (_selectedFilter == 'Tất cả') return all;
    final typeFilter = _selectedFilter == 'Phòng'
        ? 'ROOM_AMENITY'
        : 'HOTEL_AMENITY';
    return all.where((a) => a.type == typeFilter).toList();
  }

  IconData _iconForAmenity(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('wifi')) return Icons.wifi;
    if (lower.contains('hồ bơi') || lower.contains('pool')) return Icons.pool;
    if (lower.contains('gym') || lower.contains('thể dục'))
      return Icons.fitness_center;
    if (lower.contains('spa')) return Icons.spa;
    if (lower.contains('ăn') ||
        lower.contains('bếp') ||
        lower.contains('restaurant'))
      return Icons.restaurant;
    if (lower.contains('bãi') || lower.contains('parking'))
      return Icons.local_parking;
    if (lower.contains('bồn tắm') || lower.contains('bathtub'))
      return Icons.bathtub;
    if (lower.contains('giặt') || lower.contains('laundry'))
      return Icons.local_laundry_service;
    return Icons.category_outlined;
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
                  'Cơ sở vật chất',
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
                    await context.push(Routes.adminCreateAmenity);
                    // Reload after returning from create screen
                    widget.viewModel.loadAmenities.execute();
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Danh sách các cơ sở vật chất',
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
                listenable: widget.viewModel.loadAmenities,
                builder: (context, _) {
                  final cmd = widget.viewModel.loadAmenities;
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
                                widget.viewModel.loadAmenities.execute(),
                            child: const Text('Thử lại'),
                          ),
                        ],
                      ),
                    );
                  }
                  final result = cmd.result;
                  final all = result is Ok<List<AmenityResponse>> ? result.value : <AmenityResponse>[];
                  final filtered = _filtered(all);
                  if (filtered.isEmpty) {
                    return Center(
                      child: Text(
                        'Chưa có cơ sở vật chất nào',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final item = filtered[index];
                      return AmenityCard(
                        title: item.name,
                        subtitle: item.type == 'HOTEL_AMENITY'
                            ? 'Khách sạn'
                            : 'Phòng',
                        iconData: _iconForAmenity(item.name),
                        onEdit: () async {
                          await context.push(
                            Routes.adminUpdateAmenity,
                            extra: {
                              'amenityId': item.id,
                              'amenityType': item.type == 'HOTEL_AMENITY'
                                  ? 'Khách sạn'
                                  : 'Phòng',
                              'amenityName': item.name,
                              'iconData': _iconForAmenity(item.name),
                            },
                          );
                          widget.viewModel.loadAmenities.execute();
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
}
