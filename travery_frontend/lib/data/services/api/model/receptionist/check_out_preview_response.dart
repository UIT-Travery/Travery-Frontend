import 'package:freezed_annotation/freezed_annotation.dart';
import 'recep_add_on_order_response.dart';

part 'check_out_preview_response.freezed.dart';
part 'check_out_preview_response.g.dart';

@freezed
class CheckOutPreviewResponse with _$CheckOutPreviewResponse {
  const factory CheckOutPreviewResponse({
    required String bookingId,
    required num roomCharges,
    required num addOnCharges,
    required num lateFees,
    required num totalBill,
    required List<RecepAddOnOrderResponse> unpaidAddOns,
  }) = _CheckOutPreviewResponse;

  factory CheckOutPreviewResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckOutPreviewResponseFromJson(json);
}
