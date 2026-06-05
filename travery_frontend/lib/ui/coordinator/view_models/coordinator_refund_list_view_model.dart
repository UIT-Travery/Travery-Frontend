import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/data/services/api/model/coordinator/refund_response/refund_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CoordinatorRefundListViewModel extends ChangeNotifier {
  final CoordinatorRepository _coordinatorRepository;

  CoordinatorRefundListViewModel({
    required CoordinatorRepository coordinatorRepository,
  }) : _coordinatorRepository = coordinatorRepository {
    loadRefunds = Command0(_loadRefunds);
    processRefund = Command2(_processRefund);
    rejectRefund = Command2(_rejectRefund);
    loadRefunds.execute();
  }

  late final Command0<Map<String, dynamic>> loadRefunds;
  late final Command2<RefundResponse, String, double> processRefund;
  late final Command2<RefundResponse, String, String> rejectRefund;

  List<RefundResponse> get refunds {
    if (loadRefunds.completed) {
      final res = loadRefunds.result as Ok<Map<String, dynamic>>;
      return res.value['content'] as List<RefundResponse>? ?? [];
    }
    return [];
  }

  Future<Result<Map<String, dynamic>>> _loadRefunds() async {
    return await _coordinatorRepository.getRefunds(sort: "createdAt,desc");
  }

  Future<Result<RefundResponse>> _processRefund(String refundId, double amount) async {
    final result = await _coordinatorRepository.processRefund(
      refundId: refundId,
      actualRefunded: amount,
    );
    if (result is Ok) {
      loadRefunds.execute();
    }
    return result;
  }

  Future<Result<RefundResponse>> _rejectRefund(String refundId, String reason) async {
    final result = await _coordinatorRepository.rejectRefund(
      refundId: refundId,
      reason: reason,
    );
    if (result is Ok) {
      loadRefunds.execute();
    }
    return result;
  }
}
