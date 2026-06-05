import 'package:freezed_annotation/freezed_annotation.dart';

part 'recep_add_on_order_response.freezed.dart';
part 'recep_add_on_order_response.g.dart';

@freezed
class RecepAddOnOrderResponse with _$RecepAddOnOrderResponse {
  const factory RecepAddOnOrderResponse({
    required String id,
    required String serviceName,
    required String category,
    required int quantity,
    required int unitPrice,
    required int totalPrice,
    required String scheduledTime,
    required String status,
  }) = _RecepAddOnOrderResponse;

  factory RecepAddOnOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$RecepAddOnOrderResponseFromJson(json);
}
