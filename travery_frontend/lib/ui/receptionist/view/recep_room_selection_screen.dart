import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/widgets/loading_overlay.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_large_button.dart';
import 'package:travery_frontend/ui/receptionist/view_models/recep_room_selection_view_model.dart';
import 'package:travery_frontend/utils/alert.dart';
import 'package:travery_frontend/utils/core_result.dart' as core;

class RecepRoomSelectionScreen extends StatefulWidget {
  final RecepRoomSelectionViewModel viewModel;
  final String roomTypeId;

  const RecepRoomSelectionScreen({
    super.key,
    required this.viewModel,
    required this.roomTypeId,
  });

  @override
  State<RecepRoomSelectionScreen> createState() => _RecepRoomSelectionScreenState();
}

class _RecepRoomSelectionScreenState extends State<RecepRoomSelectionScreen> {
  final List<String> selectedRoomIds = [];

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadAvailableRooms.addListener(_onResult);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.loadAvailableRooms.execute(widget.roomTypeId);
    });
  }

  @override
  void didUpdateWidget(covariant RecepRoomSelectionScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.loadAvailableRooms.removeListener(_onResult);
    widget.viewModel.loadAvailableRooms.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.loadAvailableRooms.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    if (widget.viewModel.loadAvailableRooms.error) {
      final result = widget.viewModel.loadAvailableRooms.result;
      String errorMessage = 'Không thể tải danh sách phòng';
      if (result is core.Error) {
        errorMessage = result.error.toString().replaceAll('HttpException: ', '');
      }
      widget.viewModel.loadAvailableRooms.clearResult();
      Utils.showErrorNotification(context, errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel.loadAvailableRooms,
      builder: (context, child) {
        final rooms = widget.viewModel.availableRooms;
        return LoadingOverlay(
          isLoading: widget.viewModel.loadAvailableRooms.running,
          child: Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              backgroundColor: AppColors.surface,
              title: const Row(
                children: [
                  Icon(Icons.home_outlined, color: AppColors.primaryDarkBlackBlue),
                  SizedBox(width: 8),
                  Text('Lễ tân', style: TextStyle(color: AppColors.primaryDarkBlackBlue, fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: GestureDetector(
                    onTap: () => context.push(Routes.recepProfile),
                    child: const CircleAvatar(
                      backgroundColor: AppColors.primaryDarkBlackBlue,
                      child: Icon(Icons.person, color: Colors.white, size: 20),
                    ),
                  ),
                )
              ],
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Chọn phòng',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Vui lòng chọn 3 phòng theo yêu cầu của hành khách',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.primaryDarkBlackBlue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.filter_alt_outlined, color: Colors.white, size: 16),
                            SizedBox(width: 4),
                            Text('Lọc', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: rooms.isEmpty && !widget.viewModel.loadAvailableRooms.running
                        ? const Center(child: Text('Không có phòng trống cho loại phòng này'))
                        : ListView.builder(
                            itemCount: rooms.length,
                            itemBuilder: (context, index) {
                              final room = rooms[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: _buildRoomSelectCard(
                                  room.id ?? '',
                                  room.roomNumber ?? '',
                                  room.roomTypeName ?? '',
                                  '1 Giường', // You might need to adjust this depending on API
                                  room.status == 'AVAILABLE',
                                ),
                              );
                            },
                          ),
                  ),
                  const SizedBox(height: 16),
                  RecepLargeButton(
                    label: 'Xác nhận chọn phòng',
                    onTap: () {
                      // Implement confirm logic
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRoomSelectCard(String roomId, String roomNumber, String type, String bed, bool isAvailable) {
    bool isSelected = selectedRoomIds.contains(roomId);

    return GestureDetector(
      onTap: () {
        if (!isAvailable) return;
        setState(() {
          if (isSelected) {
            selectedRoomIds.remove(roomId);
          } else {
            selectedRoomIds.add(roomId);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primaryDarkBlackBlue : AppColors.inputBorder,
            width: isSelected ? 2 : 1,
          )
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  roomNumber,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  type,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.bed, size: 16, color: AppColors.textSecondary),
                        const SizedBox(width: 4),
                        Text(
                          bed,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryDarkBlackBlue, // Note color from image
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          isAvailable ? 'Trống' : 'Đã đặt',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: isAvailable ? AppColors.textPrimary : AppColors.error,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            if (isSelected)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.primaryDarkBlackBlue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
