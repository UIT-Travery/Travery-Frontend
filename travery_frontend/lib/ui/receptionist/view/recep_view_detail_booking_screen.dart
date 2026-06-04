import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/domain/models/receptionist/recep_guest/recep_guest.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_guest_info_card.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/ui/receptionist/view_models/recep_view_detail_booking_view_model.dart';
import 'package:travery_frontend/utils/alert.dart';

class RecepViewDetailBookingScreen extends StatefulWidget {
  final bool isCheckIn;
  final String bookingId;

  const RecepViewDetailBookingScreen({
    super.key,
    this.isCheckIn = true,
    required this.bookingId,
  });

  @override
  State<RecepViewDetailBookingScreen> createState() =>
      _RecepViewDetailBookingScreenState();
}

class _RecepViewDetailBookingScreenState
    extends State<RecepViewDetailBookingScreen> {
  List<String> _selectedRoomIdsToAssign = [];

  @override
  void initState() {
    super.initState();
    final viewModel = context.read<RecepViewDetailBookingViewModel>();
    viewModel.loadBookingDetail.execute(widget.bookingId);
    viewModel.loadBookingDetail.addListener(_onResult);
    viewModel.checkIn.addListener(_onResult);
    viewModel.checkOutPreview.addListener(_onResult);
    viewModel.confirmCheckOut.addListener(_onResult);
  }

  @override
  void dispose() {
    final viewModel = context.read<RecepViewDetailBookingViewModel>();
    viewModel.loadBookingDetail.removeListener(_onResult);
    viewModel.checkIn.removeListener(_onResult);
    viewModel.checkOutPreview.removeListener(_onResult);
    viewModel.confirmCheckOut.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    final viewModel = context.read<RecepViewDetailBookingViewModel>();
    if (viewModel.loadBookingDetail.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            viewModel.loadBookingDetail.errorMessage ?? 'Có lỗi xảy ra',
          ),
        ),
      );
    }
    if (viewModel.checkIn.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            viewModel.checkIn.errorMessage ?? 'Có lỗi xảy ra khi nhận phòng',
          ),
        ),
      );
    } else if (viewModel.checkIn.completed) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Nhận phòng thành công')));
      Navigator.pop(context);
    }
    if (viewModel.checkOutPreview.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            viewModel.checkOutPreview.errorMessage ??
                'Có lỗi xảy ra khi tạo hóa đơn tạm tính',
          ),
        ),
      );
    } else if (viewModel.checkOutPreview.completed &&
        widget.isCheckIn == false) {
      viewModel.checkOutPreview.clearResult();
      context
          .push(
            Routes.recepBookingBill,
            extra: {
              'checkOutPreviewData': viewModel.checkOutPreviewData,
              'viewModel': viewModel,
            },
          )
          .then((_) {
            // Refresh detail when coming back
            viewModel.loadBookingDetail.execute(widget.bookingId);
          });
    }
    if (viewModel.confirmCheckOut.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            viewModel.confirmCheckOut.errorMessage ??
                'Có lỗi xảy ra khi hoàn tất trả phòng',
          ),
        ),
      );
    } else if (viewModel.confirmCheckOut.completed) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Trả phòng thành công')));
      Navigator.pop(context);
    }
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
            ),
            const SizedBox(height: 16),
            const Text(
              'Danh sách chi tiết',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Vui lòng đối chiếu thông tin hành khách trước khi hoàn tất thủ tục',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 24),
            Builder(
              builder: (context) {
                final viewModel = context
                    .watch<RecepViewDetailBookingViewModel>();
                return ListenableBuilder(
                  listenable: viewModel.loadBookingDetail,
                  builder: (context, child) {
                    if (viewModel.loadBookingDetail.running) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final detail = viewModel.bookingDetail;
                    if (detail == null) {
                      return const Center(
                        child: Text('Không có dữ liệu chi tiết'),
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Người đặt chính Card
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(16),
                            border: const Border(
                              left: BorderSide(
                                color: AppColors.primary,
                                width: 4,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'NGƯỜI ĐẶT CHÍNH',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                detail.guestName,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryLightWhiteBlue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.check_circle,
                                      size: 16,
                                      color: AppColors.primary,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${detail.checkInDate} - ${detail.checkOutDate}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryDarkBlackBlue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Thành viên đoàn',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryLightWhiteBlue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '${(detail.manifest ?? []).length} Khách',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ...(detail.manifest ?? []).map(
                          (guest) => Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: RecepGuestInfoCard(
                              guest: RecepGuest(
                                name: guest.fullName,
                                dateOfBirth: guest.dateOfBirth,
                                type: guest.memberType == 'ADULT'
                                    ? RecepGuestType.adult
                                    : RecepGuestType.child,
                                identityNumber: guest.identityNumber,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Yêu cầu loại phòng',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ...(detail.roomAllocations ?? []).map(
                          (alloc) => Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: _buildRoomRequestItem(
                              alloc.roomTypeName,
                              alloc.quantity,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Danh sách cụ thể',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            TextButton(
                              onPressed:
                                  (detail.status.toUpperCase() == 'PENDING' ||
                                      detail.status.toUpperCase() == 'PAID')
                                  ? () {
                                      context
                                          .push<List<String>>(
                                            Routes.recepRoomSelection
                                                .replaceFirst(
                                                  ':id',
                                                  widget.bookingId,
                                                ),
                                            extra: {
                                              'roomAllocations':
                                                  detail.roomAllocations ?? [],
                                            },
                                          )
                                          .then((selectedRoomIds) {
                                            if (selectedRoomIds != null) {
                                              setState(() {
                                                _selectedRoomIdsToAssign =
                                                    selectedRoomIds;
                                              });
                                            }
                                          });
                                    }
                                  : null,
                              child: Text(
                                'Chọn phòng',
                                style: TextStyle(
                                  color:
                                      (detail.status.toUpperCase() ==
                                              'PENDING' ||
                                          detail.status.toUpperCase() == 'PAID')
                                      ? AppColors.primary
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        if (_selectedRoomIdsToAssign.isNotEmpty)
                          const Padding(
                            padding: EdgeInsets.only(bottom: 12.0),
                            child: Text(
                              'Đã chọn xong phòng, vui lòng bấm Check-in để hoàn tất',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          )
                        else
                          ...(detail.roomAllocations ?? []).expand(
                            (alloc) => alloc.assignedRoomNumbers.map(
                              (roomNum) => Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: _buildRoomItem(
                                  roomNum,
                                  alloc.roomTypeName,
                                ),
                              ),
                            ),
                          ),

                        const SizedBox(height: 24),
                        const Text(
                          'Danh sách dịch vụ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: (detail.addOnOrders ?? [])
                              .map(
                                (order) => _buildServiceItem(order.serviceName),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 32),
                        Builder(
                          builder: (context) {
                            final isStatusDisabled =
                                detail.status.toUpperCase() == 'CHECKED_OUT' ||
                                detail.status.toUpperCase() == 'CANCELLED' ||
                                detail.status.toUpperCase() == 'NO_SHOW';
                            return Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed:
                                        (widget.isCheckIn && !isStatusDisabled)
                                        ? () {
                                            if (_selectedRoomIdsToAssign
                                                .isEmpty) {
                                              Utils.showErrorNotification(
                                                context,
                                                'Vui lòng chọn phòng trước khi Check-in!',
                                              );
                                              return;
                                            }
                                            viewModel.checkIn.execute(
                                              widget.bookingId,
                                              _selectedRoomIdsToAssign,
                                            );
                                          }
                                        : null,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          AppColors.primaryDarkBlackBlue,
                                      disabledBackgroundColor: Colors.grey[400],
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: viewModel.checkIn.running
                                        ? const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 2,
                                            ),
                                          )
                                        : const Text(
                                            'Check-in',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed:
                                        (!widget.isCheckIn && !isStatusDisabled)
                                        ? () {
                                            viewModel.checkOutPreview.execute(
                                              widget.bookingId,
                                            );
                                          }
                                        : null,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          AppColors.primaryDarkBlackBlue,
                                      disabledBackgroundColor: Colors.grey[400],
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: viewModel.checkOutPreview.running
                                        ? const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 2,
                                            ),
                                          )
                                        : Text(
                                            'Check-out',
                                            style: TextStyle(
                                              color: !widget.isCheckIn
                                                  ? Colors.white
                                                  : AppColors.textSecondary,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      ),
    );
  }

  Widget _buildRoomRequestItem(String type, int quantity) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            type,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          Text(
            'Số lượng: $quantity',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoomItem(String number, String type) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: Text(
        '$number - $type',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildServiceItem(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
