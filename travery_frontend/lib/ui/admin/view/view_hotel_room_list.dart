import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/ui/admin/view_model/view_hotel_room_list_view_model.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/admin/view/widgets/input_text_field.dart';
import 'package:travery_frontend/ui/admin/view/widgets/dropdown_button.dart';
import 'package:travery_frontend/ui/admin/view/widgets/large_button.dart';
import 'package:travery_frontend/ui/admin/view/widgets/small_button.dart';

class ViewHotelRoomListScreen extends StatelessWidget {
  final String hotelId;

  const ViewHotelRoomListScreen({super.key, required this.hotelId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewHotelRoomListViewModel(
        adminRepository: context.read<AdminRepository>(),
      ),
      child: _ViewHotelRoomListScreenContent(hotelId: hotelId),
    );
  }
}

class _ViewHotelRoomListScreenContent extends StatefulWidget {
  final String hotelId;

  const _ViewHotelRoomListScreenContent({required this.hotelId});

  @override
  State<_ViewHotelRoomListScreenContent> createState() =>
      _ViewHotelRoomListScreenState();
}

class _ViewHotelRoomListScreenState
    extends State<_ViewHotelRoomListScreenContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vm = context.read<ViewHotelRoomListViewModel>();
      vm.loadRooms.execute(widget.hotelId);
      vm.loadRoomTypes.execute(widget.hotelId);
      vm.updateRoom.addListener(_onRoomUpdate);
      vm.createRoom.addListener(_onCreateRoom);
      vm.deleteRoom.addListener(_onDeleteRoom);
    });
  }

  @override
  void dispose() {
    final vm = context.read<ViewHotelRoomListViewModel>();
    vm.updateRoom.removeListener(_onRoomUpdate);
    vm.createRoom.removeListener(_onCreateRoom);
    vm.deleteRoom.removeListener(_onDeleteRoom);
    super.dispose();
  }

  void _onRoomUpdate() {
    final cmd = context.read<ViewHotelRoomListViewModel>().updateRoom;
    if (cmd.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Không thể cập nhật thông tin phòng.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else if (cmd.completed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cập nhật phòng thành công!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      if (mounted && context.canPop()) {
        context.pop();
      }
      context.read<ViewHotelRoomListViewModel>().loadRooms.execute(
        widget.hotelId,
      );
    }
  }

  void _onCreateRoom() {
    final cmd = context.read<ViewHotelRoomListViewModel>().createRoom;
    if (cmd.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Không thể thêm phòng mới.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else if (cmd.completed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Thêm phòng thành công!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      if (mounted && context.canPop()) {
        context.pop();
      }
      context.read<ViewHotelRoomListViewModel>().loadRooms.execute(
        widget.hotelId,
      );
    }
  }

  void _onDeleteRoom() {
    final cmd = context.read<ViewHotelRoomListViewModel>().deleteRoom;
    if (cmd.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Không thể xóa phòng.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else if (cmd.completed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Xóa phòng thành công!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      if (mounted && context.canPop()) {
        context.pop();
      }
      context.read<ViewHotelRoomListViewModel>().loadRooms.execute(
        widget.hotelId,
      );
    }
  }

  void _showUpdateRoomSheet(
    BuildContext context,
    Map<String, dynamic> roomData,
  ) {
    final vm = context.read<ViewHotelRoomListViewModel>();
    final roomTypes = vm.roomTypes
        .map((e) => e as Map<String, dynamic>)
        .toList();
    final roomTypesList = roomTypes.map((e) => e['name'] as String).toList();

    final roomNumberController = TextEditingController(
      text: roomData['roomNumber']?.toString(),
    );
    final floorController = TextEditingController(
      text: roomData['floor']?.toString(),
    );

    // Find initial room type
    String? currentRoomTypeName = roomData['roomTypeName'] as String?;
    String? selectedRoomTypeName = currentRoomTypeName;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 24,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Cập nhật phòng',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => context.pop(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    InputTextField(
                      label: "Số phòng",
                      textholder: "Nhập số phòng",
                      controller: roomNumberController,
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(height: 16),
                    InputTextField(
                      label: "Tầng",
                      textholder: "Nhập số tầng",
                      controller: floorController,
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    CustomDropdownButton(
                      label: "Loại phòng",
                      textholder: "Chọn loại phòng",
                      items: roomTypesList,
                      value: selectedRoomTypeName,
                      onChanged: (val) {
                        setModalState(() {
                          selectedRoomTypeName = val;
                        });
                      },
                    ),
                    const SizedBox(height: 32),
                    LargeButton(
                      text: 'Lưu thay đổi',
                      onTap: () {
                        final roomNumber = roomNumberController.text.trim();
                        final floorText = floorController.text.trim();
                        final floor = int.tryParse(floorText) ?? 0;

                        String roomTypeId = '';
                        if (selectedRoomTypeName != null) {
                          final selectedType = roomTypes.firstWhere(
                            (e) => e['name'] == selectedRoomTypeName,
                            orElse: () => <String, dynamic>{},
                          );
                          roomTypeId = selectedType['id'] as String? ?? '';
                        }

                        vm.updateRoom.execute((
                          roomId: roomData['id'] as String,
                          roomNumber: roomNumber,
                          floor: floor,
                          roomTypeId: roomTypeId,
                        ));
                      },
                    ),
                    const SizedBox(height: 16),
                    LargeButton(
                      text: 'Xóa phòng',
                      color: Colors.red,
                      onTap: () {
                        vm.deleteRoom.execute(roomData['id'] as String);
                      },
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showCreateRoomSheet(BuildContext context) {
    final vm = context.read<ViewHotelRoomListViewModel>();
    final roomTypes = vm.roomTypes
        .map((e) => e as Map<String, dynamic>)
        .toList();
    final roomTypesList = roomTypes.map((e) => e['name'] as String).toList();

    final roomNumberController = TextEditingController();
    final floorController = TextEditingController();

    String? selectedRoomTypeName = roomTypesList.isNotEmpty
        ? roomTypesList.first
        : null;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 24,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Thêm phòng mới',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryDarkBlackBlue,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    InputTextField(
                      label: "Tên phòng/Số phòng",
                      textholder: "Nhập tên hoặc số phòng (VD: 101, VIP 1)",
                      controller: roomNumberController,
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(height: 16),
                    InputTextField(
                      label: "Tầng",
                      textholder: "Nhập số tầng (VD: 1, 2)",
                      controller: floorController,
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    if (roomTypesList.isNotEmpty)
                      CustomDropdownButton(
                        label: "Loại phòng",
                        textholder: "Chọn loại phòng",
                        items: roomTypesList,
                        value: selectedRoomTypeName,
                        onChanged: (value) {
                          if (value != null) {
                            setModalState(() {
                              selectedRoomTypeName = value;
                            });
                          }
                        },
                      )
                    else
                      const Text(
                        'Chưa có loại phòng nào',
                        style: TextStyle(color: Colors.red),
                      ),
                    const SizedBox(height: 32),
                    ListenableBuilder(
                      listenable: vm.createRoom,
                      builder: (context, _) {
                        return LargeButton(
                          text: 'Thêm phòng',
                          onTap: vm.createRoom.running
                              ? null
                              : () {
                                  final roomNumber =
                                      roomNumberController.text.trim();
                            final floorText = floorController.text.trim();
                            final floor = int.tryParse(floorText) ?? 0;

                            if (roomNumber.isEmpty || floorText.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Vui lòng nhập đầy đủ thông tin phòng.',
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                              return;
                            }

                            String roomTypeId = '';
                            if (selectedRoomTypeName != null) {
                              final selectedType = roomTypes.firstWhere(
                                (e) => e['name'] == selectedRoomTypeName,
                                orElse: () => <String, dynamic>{},
                              );
                              roomTypeId = selectedType['id'] as String? ?? '';
                            }

                            if (roomTypeId.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Vui lòng chọn loại phòng.'),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                              return;
                            }

                            vm.createRoom.execute((
                              hotelId: widget.hotelId,
                              roomNumber: roomNumber,
                              floor: floor,
                              roomTypeId: roomTypeId,
                            ));
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ViewHotelRoomListViewModel>();

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
                        'Danh sách phòng',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Quản lý các phòng của khách sạn',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  SmallButton(
                    label: 'Thêm',
                    onTap: () => _showCreateRoomSheet(context),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListenableBuilder(
                  listenable: vm.loadRooms,
                  builder: (context, _) {
                    if (vm.loadRooms.running) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (vm.loadRooms.error) {
                      return const Center(
                        child: Text('Lỗi khi tải danh sách phòng'),
                      );
                    }

                    final cmdResult = vm.loadRooms.result;
                    final rooms = (cmdResult as dynamic)?.value ?? [];
                    if (rooms.isEmpty) {
                      return const Center(
                        child: Text('Khách sạn chưa có phòng nào'),
                      );
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.only(bottom: 16),
                      itemCount: rooms.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final room = rooms[index] as Map<String, dynamic>;

                        return InkWell(
                          onTap: () => _showUpdateRoomSheet(context, room),
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.primaryDarkBlackBlue,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Phòng ${room['roomNumber'] ?? ''}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryDarkBlackBlue,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: Colors.black54,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text('Tầng: ${room['floor'] ?? '-'}'),
                                const SizedBox(height: 4),
                                Text(
                                  'Loại phòng: ${room['roomTypeName'] ?? '-'}',
                                ),
                              ],
                            ),
                          ),
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
