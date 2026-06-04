import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/data/services/api/model/hotel/room_type_response.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/admin/view_model/room_type_list_view_model.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'widgets/small_button.dart';

class ViewRoomtypeListScreen extends StatefulWidget {
  final RoomTypeListViewModel viewModel;
  final String hotelId;

  const ViewRoomtypeListScreen({
    super.key,
    required this.viewModel,
    required this.hotelId,
  });

  @override
  State<ViewRoomtypeListScreen> createState() => _ViewRoomtypeListScreenState();
}

class _ViewRoomtypeListScreenState extends State<ViewRoomtypeListScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.loadRoomTypes.addListener(_onLoadResult);
    widget.viewModel.loadRoomTypes.execute(widget.hotelId);
  }

  @override
  void didUpdateWidget(ViewRoomtypeListScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.loadRoomTypes.removeListener(_onLoadResult);
      widget.viewModel.loadRoomTypes.addListener(_onLoadResult);
      widget.viewModel.loadRoomTypes.execute(widget.hotelId);
    }
  }

  @override
  void dispose() {
    widget.viewModel.loadRoomTypes.removeListener(_onLoadResult);
    super.dispose();
  }

  void _onLoadResult() {
    final cmd = widget.viewModel.loadRoomTypes;
    if (cmd.error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Không thể tải danh sách loại phòng'),
          backgroundColor: Colors.red,
          action: SnackBarAction(
            label: 'Thử lại',
            textColor: Colors.white,
            onPressed: () => widget.viewModel.loadRoomTypes.execute(widget.hotelId),
          ),
        ),
      );
    }
  }

  String _getBedTypeLabel(RoomBedType type) {
    switch (type) {
      case RoomBedType.single:
        return '1 Giường Single';
      case RoomBedType.double_:
        return '1 Giường Double';
      case RoomBedType.twin:
        return '2 Giường Twin';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        'Quản lý Loại phòng',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Danh sách các loại phòng',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
                SmallButton(
                  label: 'Thêm',
                  prefixIcon: const Icon(
                    Icons.add,
                    size: 16,
                    color: Colors.white,
                  ),
                  color: const Color(0xFF0055C3),
                  onTap: () async {
                    await context.push(
                      Routes.adminCreateRoomType,
                      extra: {'hotelId': widget.hotelId},
                    );
                    widget.viewModel.loadRoomTypes.execute(widget.hotelId);
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListenableBuilder(
                listenable: widget.viewModel.loadRoomTypes,
                builder: (context, _) {
                  final cmd = widget.viewModel.loadRoomTypes;

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
                          const Text(
                            'Không thể tải dữ liệu',
                            style: TextStyle(color: Color(0xFF64748B)),
                          ),
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: () =>
                                widget.viewModel.loadRoomTypes.execute(widget.hotelId),
                            child: const Text('Thử lại'),
                          ),
                        ],
                      ),
                    );
                  }

                  final result = cmd.result;
                  final roomTypes = result is Ok<List<RoomTypeResponse>>
                      ? result.value
                      : <RoomTypeResponse>[];

                  if (roomTypes.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bed_outlined, size: 64, color: Colors.grey[400]),
                          const SizedBox(height: 16),
                          Text(
                            'Chưa có loại phòng nào',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Nhấn "Thêm" để tạo loại phòng mới',
                            style: TextStyle(color: Colors.grey[400], fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  }

                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.1,
                    ),
                    itemCount: roomTypes.length,
                    itemBuilder: (context, index) {
                      final rt = roomTypes[index];
                      return _RoomTypeCard(
                        roomType: rt,
                        bedTypeLabel: _getBedTypeLabel(rt.bedType),
                        onTap: () async {
                          await context.push(
                            Routes.adminViewRoomtype,
                            extra: {
                              'roomTypeResponse': rt,
                              'hotelId': widget.hotelId,
                            },
                          );
                          if (mounted) {
                            widget.viewModel.loadRoomTypes.execute(widget.hotelId);
                          }
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
      ),
    );
  }
}

class _RoomTypeCard extends StatelessWidget {
  final RoomTypeResponse roomType;
  final String bedTypeLabel;
  final VoidCallback onTap;

  const _RoomTypeCard({
    required this.roomType,
    required this.bedTypeLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE2E8F0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFDBEAFE),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.bed_outlined, color: Color(0xFF0055C3), size: 22),
            ),
            const SizedBox(height: 10),
            Text(
              roomType.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Color(0xFF1E293B),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              bedTypeLabel,
              style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Text(
              '${(roomType.basePrice / 1000).toStringAsFixed(0)}K đ/đêm',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0055C3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
