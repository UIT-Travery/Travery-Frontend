import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/widgets/loading_overlay.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_large_button.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_app_bar_avatar.dart';
import 'package:travery_frontend/ui/receptionist/view_models/recep_room_selection_view_model.dart';
import 'package:travery_frontend/utils/alert.dart';
import 'package:travery_frontend/utils/core_result.dart' as core;

class RecepRoomSelectionScreen extends StatefulWidget {
  final RecepRoomSelectionViewModel viewModel;
  final String bookingId;
  final List<dynamic> roomAllocations;

  const RecepRoomSelectionScreen({
    super.key,
    required this.viewModel,
    required this.bookingId,
    required this.roomAllocations,
  });

  @override
  State<RecepRoomSelectionScreen> createState() =>
      _RecepRoomSelectionScreenState();
}

class _RecepRoomSelectionScreenState extends State<RecepRoomSelectionScreen> {
  // Map of roomTypeId to selected room IDs
  final Map<String, List<String>> selectedRoomIdsMap = {};

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadAvailableRooms.addListener(_onResult);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final List<String> roomTypeIds = widget.roomAllocations
          .map((e) => e.roomTypeId.toString())
          .toList();
      widget.viewModel.loadAvailableRooms.execute(roomTypeIds);
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
        errorMessage = result.error.toString().replaceAll(
          'HttpException: ',
          '',
        );
      }
      widget.viewModel.loadAvailableRooms.clearResult();
      Utils.showErrorNotification(context, errorMessage);
    }

    if (mounted) setState(() {});
  }

  int _getTotalRequestedRooms() {
    return widget.roomAllocations.fold<int>(
      0,
      (sum, alloc) => sum + (alloc.quantity as int),
    );
  }

  void _onConfirm() {
    bool isFullySelected = true;
    for (final alloc in widget.roomAllocations) {
      final roomTypeId = alloc.roomTypeId.toString();
      final quantity = alloc.quantity as int;
      final selectedForType = selectedRoomIdsMap[roomTypeId]?.length ?? 0;
      if (selectedForType < quantity) {
        isFullySelected = false;
        break;
      }
    }

    if (!isFullySelected) {
      Utils.showErrorNotification(
        context,
        'Vui lòng chọn đủ số lượng phòng yêu cầu cho mỗi loại phòng',
      );
      return;
    }

    final List<String> allSelectedRoomIds = selectedRoomIdsMap.values
        .expand((element) => element)
        .toList();

    Navigator.pop(context, allSelectedRoomIds);
  }

  @override
  Widget build(BuildContext context) {
    final totalRequested = _getTotalRequestedRooms();

    return ListenableBuilder(
      listenable: widget.viewModel.loadAvailableRooms,
      builder: (context, child) {
        final availableMap = widget.viewModel.availableRoomsMap;
        final isLoading = widget.viewModel.loadAvailableRooms.running;

        return LoadingOverlay(
          isLoading: isLoading,
          child: Scaffold(
            backgroundColor: AppColors.surface,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.surface,
              title: const Row(
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: AppColors.primaryDarkBlackBlue,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Lễ tân',
                    style: TextStyle(
                      color: AppColors.primaryDarkBlackBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: GestureDetector(
                    onTap: () => context.push(Routes.recepProfile),
                    child: const RecepAppBarAvatar(),
                  ),
                ),
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
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Chọn phòng',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Vui lòng chọn $totalRequested phòng theo yêu cầu của hành khách',
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryDarkBlackBlue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.filter_alt_outlined,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Lọc',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: widget.roomAllocations.isEmpty
                        ? const Center(
                            child: Text('Không có dữ liệu yêu cầu phòng'),
                          )
                        : ListView.builder(
                            itemCount: widget.roomAllocations.length,
                            itemBuilder: (context, index) {
                              final alloc = widget.roomAllocations[index];
                              final roomTypeId = alloc.roomTypeId.toString();
                              final roomTypeName = alloc.roomTypeName
                                  .toString();
                              final quantity = alloc.quantity as int;
                              final availableRoomsForType =
                                  availableMap[roomTypeId] ?? [];

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          roomTypeName,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textPrimary,
                                          ),
                                        ),
                                        Text(
                                          'Cần chọn: $quantity',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    if (availableRoomsForType.isEmpty &&
                                        !widget
                                            .viewModel
                                            .loadAvailableRooms
                                            .running)
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 8.0,
                                        ),
                                        child: Text(
                                          'Không có phòng trống cho loại phòng này',
                                          style: TextStyle(
                                            color: AppColors.textSecondary,
                                          ),
                                        ),
                                      )
                                    else
                                      ...availableRoomsForType.map(
                                        (room) => Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 12.0,
                                          ),
                                          child: _buildRoomSelectCard(
                                            room.id ?? '',
                                            room.roomNumber ?? '',
                                            room.roomTypeName ?? '',
                                            roomTypeId,
                                            quantity,
                                            '1 Giường', // Can adjust depending on API
                                            room.status == 'AVAILABLE',
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                  const SizedBox(height: 16),
                  RecepLargeButton(
                    label: 'Xác nhận chọn phòng',
                    onTap: _onConfirm,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRoomSelectCard(
    String roomId,
    String roomNumber,
    String type,
    String roomTypeId,
    int maxQuantity,
    String bed,
    bool isAvailable,
  ) {
    final selectedList = selectedRoomIdsMap[roomTypeId] ?? [];
    final bool isSelected = selectedList.contains(roomId);

    return GestureDetector(
      onTap: () {
        if (!isAvailable) return;
        setState(() {
          if (isSelected) {
            selectedList.remove(roomId);
          } else {
            if (selectedList.length < maxQuantity) {
              selectedList.add(roomId);
            } else {
              Utils.showErrorNotification(
                context,
                'Bạn đã chọn đủ $maxQuantity phòng cho loại này.',
              );
            }
          }
          selectedRoomIdsMap[roomTypeId] = selectedList;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryDarkBlackBlue
                : AppColors.inputBorder,
            width: isSelected ? 2 : 1,
          ),
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
                        const Icon(
                          Icons.bed,
                          size: 16,
                          color: AppColors.textSecondary,
                        ),
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
                            color: AppColors.primaryDarkBlackBlue,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          isAvailable ? 'Trống' : 'Đã đặt',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: isAvailable
                                ? AppColors.textPrimary
                                : AppColors.error,
                          ),
                        ),
                      ],
                    ),
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
