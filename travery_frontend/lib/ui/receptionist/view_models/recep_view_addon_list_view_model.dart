import 'package:travery_frontend/data/repositories/receptionist/receptionist_repository.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_add_on_order_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class RecepViewAddonListViewModel {
  final ReceptionistRepository _repository;

  List<RecepAddOnOrderResponse> addOnOrders = [];

  RecepViewAddonListViewModel({required ReceptionistRepository repository})
      : _repository = repository {
    loadAddOnOrders = Command0<List<RecepAddOnOrderResponse>>(_loadAddOnOrders);
    updateOrderStatus = Command1<void, (String orderId, String status)>(_updateOrderStatus);
  }

  late final Command0<List<RecepAddOnOrderResponse>> loadAddOnOrders;
  late final Command1<void, (String, String)> updateOrderStatus;

  Future<Result<List<RecepAddOnOrderResponse>>> _loadAddOnOrders() async {
    final result = await _repository.getAddOnOrders();
    switch (result) {
      case Ok<List<RecepAddOnOrderResponse>>():
        addOnOrders = result.value;
        return Result.ok(result.value);
      case Error<List<RecepAddOnOrderResponse>>():
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _updateOrderStatus((String, String) input) async {
    final (orderId, status) = input;
    final result = await _repository.updateAddOnOrderStatus(orderId, status);
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
