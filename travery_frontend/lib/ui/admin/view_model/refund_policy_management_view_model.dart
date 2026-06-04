import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/services/api/model/tour/refund_policy_response/refund_policy_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class RefundPolicyManagementViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  RefundPolicyManagementViewModel({required AdminRepository adminRepository})
      : _adminRepository = adminRepository {
    loadPolicies = Command0<List<RefundPolicyResponse>>(_loadPolicies);
    deletePolicy = Command1<void, String>(_deletePolicy);
  }

  late final Command0<List<RefundPolicyResponse>> loadPolicies;
  late final Command1<void, String> deletePolicy;

  Future<Result<List<RefundPolicyResponse>>> _loadPolicies() async {
    final result = await _adminRepository.getAllRefundPolicies();
    switch (result) {
      case Ok<List<dynamic>>():
        final list = result.value
            .map((e) => RefundPolicyResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return Result.ok(list);
      case Error<List<dynamic>>():
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _deletePolicy(String policyId) async {
    final result = await _adminRepository.deleteRefundPolicy(id: policyId);
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
