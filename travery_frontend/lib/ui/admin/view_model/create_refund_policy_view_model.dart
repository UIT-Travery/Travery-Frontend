import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/services/api/model/admin/refund_policy_request.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CreateRefundPolicyViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  CreateRefundPolicyViewModel({required AdminRepository adminRepository})
      : _adminRepository = adminRepository {
    createPolicy = Command1<void, RefundPolicyRequest>(_createPolicy);
  }

  late final Command1<void, RefundPolicyRequest> createPolicy;

  Future<Result<void>> _createPolicy(RefundPolicyRequest request) async {
    final rulesMapList = request.rules.map((rule) => {
      'timeBefore': rule.timeBefore,
      'timeUnit': rule.timeUnit,
      'refundPercentage': rule.refundPercentage,
    }).toList();

    final result = await _adminRepository.createRefundPolicy(
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
