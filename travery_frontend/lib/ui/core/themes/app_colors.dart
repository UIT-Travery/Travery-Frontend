import 'package:flutter/material.dart';

class AppColors {
  // -----------------------------------------
  // Primary
  // -----------------------------------------

  /// HEX: #1A73E8
  /// Công dụng: Màu thương hiệu chính, nút bấm chính.
  static const Color primary = Color(0xFF1A73E8);

  /// HEX: #4D94F0
  /// Công dụng: Màu primary sáng, dùng cho highlight nhẹ.
  static const Color primaryLight = Color(0xFF4D94F0);

  static const Color primaryLightWhiteBlue = Color(0xFFE0E8FF);

  /// HEX: #1558B0
  /// Công dụng: Trạng thái khi nhấn giữ nút (Pressed).
  static const Color primaryDark = Color(0xFF1558B0);
  static const Color primaryDarkBlackBlue = Color(0xFF003D9B);

  // -----------------------------------------
  // Background
  // -----------------------------------------

  /// HEX: #F0F4FF
  /// Công dụng: Màu nền tổng thể của ứng dụng.
  static const Color background = Color(0xFFF0F4FF);

  /// HEX: #FFFFFF
  /// Công dụng: Màu nền của các thành phần nổi (Card, Dialog, BottomSheet).
  static const Color surface = Color(0xFFFFFFFF);

  // -----------------------------------------
  // Text
  // -----------------------------------------

  /// HEX: #1A1A2E
  /// Công dụng: Màu chữ chính, tiêu đề đậm.
  static const Color textPrimary = Color(0xFF1A1A2E);

  /// HEX: #6B7280
  /// Công dụng: Màu chữ phụ, đoạn văn bản mô tả.
  static const Color textSecondary = Color(0xFF6B7280);

  /// HEX: #ADB5BD
  /// Công dụng: Chữ gợi ý (Placeholder) trong ô nhập liệu.
  static const Color textHint = Color(0xFFADB5BD);

  /// HEX: #ADB5BD
  /// Công dụng: Màu nền cho trạng thái disabled của nút.
  static const Color disabled = Color(0xFFADB5BD);

  // -----------------------------------------
  // Input field
  // -----------------------------------------

  /// HEX: #F3F4F6
  /// Công dụng: Màu nền của ô nhập liệu (Input).
  static const Color inputBackground = Color(0xFFF3F4F6);

  /// HEX: #E5E7EB
  /// Công dụng: Viền mặc định của ô nhập liệu.
  static const Color inputBorder = Color(0xFFE5E7EB);

  /// HEX: #1A73E8
  /// Công dụng: Viền ô nhập liệu khi đang được trỏ vào (Focused).
  static const Color inputBorderFocused = Color(0xFF1A73E8);

  // -----------------------------------------
  // Button
  // -----------------------------------------

  /// HEX: #1A73E8
  /// Công dụng: Màu nền của nút bấm chính.
  static const Color buttonPrimary = Color(0xFF1A73E8);

  /// HEX: #FFFFFF
  /// Công dụng: Màu chữ trên nền nút bấm chính.
  static const Color buttonPrimaryText = Color(0xFFFFFFFF);

  // -----------------------------------------
  // Link / Action
  // -----------------------------------------

  /// HEX: #1A73E8
  /// Công dụng: Màu cho các đường link hoặc chữ có thể bấm được.
  static const Color link = Color(0xFF1A73E8);

  // -----------------------------------------
  // Error
  // -----------------------------------------

  /// HEX: #EF4444
  /// Công dụng: Thông báo lỗi, text cảnh báo, nút xóa.
  static const Color error = Color(0xFFEF4444);

  // -----------------------------------------
  // Success
  // -----------------------------------------

  /// HEX: #4CAF50
  /// Công dụng: Thông báo thành công, text xác nhận.
  static const Color success = Color(0xFF4CAF50);

  // -----------------------------------------
  // Icon
  // -----------------------------------------

  /// HEX: #ADB5BD
  /// Công dụng: Icon trạng thái mặc định/không hoạt động.
  static const Color icon = Color(0xFFADB5BD);

  /// HEX: #1A73E8
  /// Công dụng: Icon khi được chọn hoặc đang hoạt động.
  static const Color iconActive = Color(0xFF1A73E8);

  static const Color warning = Color(0xFFF2C94C);

  // Additional colors matching template design
  static const Color surfaceBlue = Color(0xFFF4F7FF);
  static const Color surfaceGray = Color(0xFFF4F5F7);
  static const Color surfaceContainerLow = Color(0xFFF0F3FF);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerHigh = Color(0xFFDEE9FF);
  static const Color surfaceContainerHighest = Color(0xFFD7E3FB);
  static const Color surfaceContainer = Color(0xFFE7EEFF);
  static const Color outline = Color(0xFF737685);
  static const Color outlineVariant = Color(0xFFC3C6D6);
  static const Color secondary = Color(0xFF5D5F5F);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color successLight = Color(0xFF36B37E);
  static const Color primaryContainer = Color(0xFF0052CC);
  static const Color primaryFixedDim = Color(0xFFB2C5FF);
  static const Color textDark = Color(0xFF172B4D);
}
