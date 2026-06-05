import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_room_response.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_room_card.dart';
import 'package:travery_frontend/ui/receptionist/view_models/recep_view_hotel_room_view_model.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_app_bar_avatar.dart';
import 'package:travery_frontend/ui/core/widgets/loading_overlay.dart';
import 'package:travery_frontend/utils/alert.dart';

class RecepViewHotelRoomScreen extends StatefulWidget {
  final RecepViewHotelRoomViewModel viewModel;

  const RecepViewHotelRoomScreen({super.key, required this.viewModel});

  @override
  State<RecepViewHotelRoomScreen> createState() =>
      _RecepViewHotelRoomScreenState();
}

class _RecepViewHotelRoomScreenState extends State<RecepViewHotelRoomScreen> {
  List<RecepRoomResponse> rooms = [];
  String? _selectedStatus;
  String? _selectedRoomType;

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadRooms.addListener(_onResult);
    widget.viewModel.updateRoomStatus.addListener(_onUpdateResult);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.loadRooms.execute();
    });
  }

  @override
  void didUpdateWidget(covariant RecepViewHotelRoomScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.loadRooms.removeListener(_onResult);
      widget.viewModel.loadRooms.addListener(_onResult);
      oldWidget.viewModel.updateRoomStatus.removeListener(_onUpdateResult);
      widget.viewModel.updateRoomStatus.addListener(_onUpdateResult);
    }
  }

  @override
  void dispose() {
    widget.viewModel.loadRooms.removeListener(_onResult);
    widget.viewModel.updateRoomStatus.removeListener(_onUpdateResult);
    super.dispose();
  }

  void _onResult() {
    if (widget.viewModel.loadRooms.completed) {
      setState(() {
        rooms = widget.viewModel.rooms;
      });
      widget.viewModel.loadRooms.clearResult();
    }
    if (widget.viewModel.loadRooms.error) {
      Utils.showErrorNotification(context, 'Lỗi tải danh sách phòng');
      widget.viewModel.loadRooms.clearResult();
    }
  }

  void _onUpdateResult() {
    if (widget.viewModel.updateRoomStatus.completed) {
      Utils.showSuccessNotification(context, 'Cập nhật trạng thái thành công');
      setState(() {
        rooms = widget.viewModel.rooms;
      });
      widget.viewModel.updateRoomStatus.clearResult();
    }
    if (widget.viewModel.updateRoomStatus.error) {
      Utils.showErrorNotification(context, 'Lỗi cập nhật trạng thái phòng');
      widget.viewModel.updateRoomStatus.clearResult();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<RecepRoomResponse> filteredRooms = rooms.where((room) {
      if (_selectedStatus != null &&
          room.status.toUpperCase() != _selectedStatus) {
        if (_selectedStatus == 'AVAILABLE' &&
            room.status.toUpperCase() == 'READY') {
          // Both are considered available
        } else {
          return false;
        }
      }
      if (_selectedRoomType != null && room.roomTypeName != _selectedRoomType) {
        return false;
      }
      return true;
    }).toList();

    // Group rooms by floor
    final Map<int, List<RecepRoomResponse>> groupedRooms = {};
    for (var room in filteredRooms) {
      int floor = room.floor ?? 0;
      if (!groupedRooms.containsKey(floor)) {
        groupedRooms[floor] = [];
      }
      groupedRooms[floor]!.add(room);
    }

    final sortedFloors = groupedRooms.keys.toList()..sort();

    return ListenableBuilder(
      listenable: Listenable.merge([
        widget.viewModel.loadRooms,
        widget.viewModel.updateRoomStatus,
      ]),
      builder: (context, child) {
        return LoadingOverlay(
          isLoading:
              widget.viewModel.loadRooms.running ||
              widget.viewModel.updateRoomStatus.running,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Danh sách phòng',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Chọn một hành khách để tiến hành check-in', // Follow the image text
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _showFilterBottomSheet(context),
                        child: Container(
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
                      ),
                    ],
                  ),
                  _buildLegendGrid(),
                  Expanded(
                    child:
                        sortedFloors.isEmpty &&
                            !widget.viewModel.loadRooms.running
                        ? const Center(
                            child: Text(
                              'Không có phòng nào trong khách sạn.',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: sortedFloors.length,
                            itemBuilder: (context, index) {
                              final floor = sortedFloors[index];
                              final rooms = groupedRooms[floor]!;
                              return _buildFloorSection(floor, rooms);
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFloorSection(int floor, List<RecepRoomResponse> rooms) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
        tilePadding: EdgeInsets.zero,
        title: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.primaryDarkBlackBlue,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Tầng $floor',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        iconColor: AppColors.textPrimary,
        collapsedIconColor: AppColors.textPrimary,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2.2, // To match image aspect ratio
              ),
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                return RecepRoomCard(
                  room: rooms[index],
                  onTap: () =>
                      _showUpdateStatusBottomSheet(context, rooms[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendGrid() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 5,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: [
          _buildLegendItem(Colors.green, 'Sẵn sàng'),
          _buildLegendItem(Colors.orange, 'Đang dọn'),
          _buildLegendItem(Colors.blue, 'Đang ở'),
          _buildLegendItem(Colors.red, 'Đang bảo trì'),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    final uniqueRoomTypes = widget.viewModel.rooms
        .map((e) => e.roomTypeName)
        .toSet()
        .toList();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Lọc danh sách phòng',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Trạng thái phòng',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      _buildFilterChip('Tất cả', _selectedStatus == null, () {
                        setModalState(() => _selectedStatus = null);
                        setState(() {});
                      }),
                      _buildFilterChip(
                        'Sẵn sàng',
                        _selectedStatus == 'AVAILABLE',
                        () {
                          setModalState(() => _selectedStatus = 'AVAILABLE');
                          setState(() {});
                        },
                      ),
                      _buildFilterChip(
                        'Đang dọn',
                        _selectedStatus == 'DIRTY',
                        () {
                          setModalState(() => _selectedStatus = 'DIRTY');
                          setState(() {});
                        },
                      ),
                      _buildFilterChip(
                        'Đang ở',
                        _selectedStatus == 'OCCUPIED',
                        () {
                          setModalState(() => _selectedStatus = 'OCCUPIED');
                          setState(() {});
                        },
                      ),
                      _buildFilterChip(
                        'Đang bảo trì',
                        _selectedStatus == 'MAINTENANCE',
                        () {
                          setModalState(() => _selectedStatus = 'MAINTENANCE');
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Loại phòng',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      _buildFilterChip('Tất cả', _selectedRoomType == null, () {
                        setModalState(() => _selectedRoomType = null);
                        setState(() {});
                      }),
                      ...uniqueRoomTypes.map(
                        (type) => _buildFilterChip(
                          type,
                          _selectedRoomType == type,
                          () {
                            setModalState(() => _selectedRoomType = type);
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryDarkBlackBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Áp dụng',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFilterChip(String label, bool isSelected, VoidCallback onTap) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
      selectedColor: AppColors.primaryDarkBlackBlue.withValues(alpha: 0.2),
      labelStyle: TextStyle(
        color: isSelected ? AppColors.primaryDarkBlackBlue : Colors.black87,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  void _showUpdateStatusBottomSheet(
    BuildContext context,
    RecepRoomResponse room,
  ) {
    String selectedStatus = room.status.toUpperCase();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cập nhật trạng thái - Phòng ${room.roomNumber}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    children: [
                      _buildFilterChip(
                        'Sẵn sàng',
                        selectedStatus == 'AVAILABLE' ||
                            selectedStatus == 'READY',
                        () {
                          setModalState(() => selectedStatus = 'AVAILABLE');
                        },
                      ),
                      _buildFilterChip(
                        'Đang dọn',
                        selectedStatus == 'CLEANING' ||
                            selectedStatus == 'DIRTY',
                        () {
                          setModalState(() => selectedStatus = 'CLEANING');
                        },
                      ),
                      _buildFilterChip(
                        'Đang ở',
                        selectedStatus == 'OCCUPIED',
                        () {
                          setModalState(() => selectedStatus = 'OCCUPIED');
                        },
                      ),
                      _buildFilterChip(
                        'Đang bảo trì',
                        selectedStatus == 'MAINTENANCE',
                        () {
                          setModalState(() => selectedStatus = 'MAINTENANCE');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        widget.viewModel.updateRoomStatus.execute(
                          room.id,
                          selectedStatus,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryDarkBlackBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Xác nhận',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
