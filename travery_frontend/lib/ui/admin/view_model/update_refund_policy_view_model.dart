import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/services/api/model/admin/refund_policy_request.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class UpdateRefundPolicyViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  UpdateRefundPolicyViewModel({required AdminRepository adminRepository})
      : _adminRepository = adminRepository {
    updatePolicy = Command2<void, String, RefundPolicyRequest>(_updatePolicy);
  }

  late final Command2<void, String, RefundPolicyRequest> updatePolicy;

  Future<Result<void>> _updatePolicy(String id, RefundPolicyRequest request) async {
    final rulesMapList = request.rules.map((rule) => {
      'timeBefore': rule.timeBefore,
      'timeUnit': rule.timeUnit,
      'refundPercentage': rule.refundPercentage,
    }).toList();

    final result = await _adminRepository.updateRefundPolicy(
      id: id,
      name: request.name,
      serviceType: request.serviceType,
      rules: rulesMapList,
    );

    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
