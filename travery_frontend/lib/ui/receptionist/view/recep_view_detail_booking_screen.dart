import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/domain/models/receptionist/recep_guest/recep_guest.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_guest_info_card.dart';

class RecepViewDetailBookingScreen extends StatelessWidget {
  final bool isCheckIn; // True if check-in, False if check-out

  const RecepViewDetailBookingScreen({super.key, this.isCheckIn = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
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
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            // Người đặt chính Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: const Border(left: BorderSide(color: AppColors.primary, width: 4))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('NGƯỜI ĐẶT CHÍNH', style: TextStyle(fontSize: 12, color: AppColors.textSecondary, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text('Nguyễn Văn Tùng', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(color: AppColors.primaryLightWhiteBlue, borderRadius: BorderRadius.circular(20)),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check_circle, size: 16, color: AppColors.primary),
                        SizedBox(width: 8),
                        Text('22/05/2026 - 25/05/2026', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primaryDarkBlackBlue)),
                      ],
                    )
                  )
                ],
              )
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Thành viên đoàn', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                Container(
                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                   decoration: BoxDecoration(color: AppColors.primaryLightWhiteBlue, borderRadius: BorderRadius.circular(20)),
                   child: const Text('3 Khách', style: TextStyle(fontSize: 14, color: AppColors.textSecondary, fontWeight: FontWeight.bold)),
                )
              ]
            ),
            const SizedBox(height: 16),
            const RecepGuestInfoCard(
              guest: RecepGuest(name: 'Nguyễn Văn Tùng', dateOfBirth: '12/05/1985', type: RecepGuestType.adult, identityNumber: '079085001234')
            ),
            const SizedBox(height: 12),
            const RecepGuestInfoCard(
              guest: RecepGuest(name: 'Trần Thị Mai', dateOfBirth: '20/08/1988', type: RecepGuestType.adult, identityNumber: '079088005678')
            ),
            const SizedBox(height: 12),
            const RecepGuestInfoCard(
              guest: RecepGuest(name: 'Nguyễn Trần Bảo Nam', dateOfBirth: '10/10/2015', type: RecepGuestType.child)
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Danh sách phòng', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                TextButton(onPressed: () {}, child: const Text('Chọn phòng', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 16)))
              ]
            ),
            const SizedBox(height: 8),
            _buildRoomItem('101', 'Standard', '1 Giường đôi'),
            const SizedBox(height: 12),
            _buildRoomItem('102', 'Standard', '1 Giường đôi'),

            const SizedBox(height: 24),
            const Text('Danh sách dịch vụ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildServiceItem('Spa')),
                const SizedBox(width: 12),
                Expanded(child: _buildServiceItem('Bữa sáng')),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildServiceItem('Giặt ủi')),
                const SizedBox(width: 12),
                const Expanded(child: SizedBox()),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: isCheckIn ? () {} : null,
                    style: ElevatedButton.styleFrom(
                       backgroundColor: AppColors.primaryDarkBlackBlue,
                       disabledBackgroundColor: Colors.grey[400],
                       padding: const EdgeInsets.symmetric(vertical: 16),
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                    ),
                    child: const Text('Check-in', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  )
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: !isCheckIn ? () {} : null,
                    style: ElevatedButton.styleFrom(
                       backgroundColor: AppColors.primaryDarkBlackBlue,
                       disabledBackgroundColor: Colors.grey[400],
                       padding: const EdgeInsets.symmetric(vertical: 16),
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                    ),
                    child: Text('Check-out', style: TextStyle(color: !isCheckIn ? Colors.white : AppColors.textSecondary, fontSize: 16, fontWeight: FontWeight.bold)),
                  )
                )
              ]
            ),
            const SizedBox(height: 24),
          ],
        )
      )
    );
  }

  Widget _buildRoomItem(String number, String type, String bed) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.inputBorder)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$number - $type', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          Row(
            children: [
               const Icon(Icons.bed, size: 18, color: AppColors.textSecondary),
               const SizedBox(width: 4),
               Text(bed, style: const TextStyle(fontSize: 14, color: AppColors.textSecondary)),
            ]
          )
        ]
      )
    );
  }

  Widget _buildServiceItem(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.inputBorder)
      ),
      child: Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
    );
  }
}
