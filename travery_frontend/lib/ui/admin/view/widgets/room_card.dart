import 'package:flutter/material.dart';
import '../../../../ui/core/themes/app_colors.dart';
import '../../../../ui/core/themes/app_text_theme.dart';
import 'input_text_field.dart';
import 'dropdown_button.dart';

class RoomCard extends StatelessWidget {
  final String roomName;
  final TextEditingController roomNumberController;
  final String? roomType;
  final List<String> roomTypes;
  final ValueChanged<String?>? onRoomTypeChanged;
  final VoidCallback? onClose;

  const RoomCard({
    super.key,
    required this.roomName,
    required this.roomNumberController,
    this.roomType,
    required this.roomTypes,
    this.onRoomTypeChanged,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFFE8F5FF)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          border: Border(
            left: BorderSide(color: AppColors.primaryDarkBlackBlue, width: 5),
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  roomName,
                  style: TextStyle(
                    fontSize: AppTextTheme.bodyMedium,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDarkBlackBlue,
                  ),
                ),
                if (onClose != null)
                  InkWell(
                    onTap: onClose,
                    child: const Icon(Icons.close, size: 20),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: InputTextField(
                    label: "Số phòng",
                    textholder: "Nhập số phòng",
                    controller: roomNumberController,
                    textInputType: TextInputType.text,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomDropdownButton(
                    label: "Loại phòng",
                    textholder: "Chọn loại phòng",
                    items: roomTypes,
                    value: roomType,
                    onChanged: onRoomTypeChanged,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
