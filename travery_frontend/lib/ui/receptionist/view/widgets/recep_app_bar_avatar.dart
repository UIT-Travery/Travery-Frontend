import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/ui/admin/view_model/admin_profile_view_model.dart';
import 'package:travery_frontend/data/services/api/model/profile/profile_response/profile_response.dart';
import 'package:travery_frontend/utils/core_result.dart';

class RecepAppBarAvatar extends StatelessWidget {
  const RecepAppBarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AdminProfileViewModel>();
    return ListenableBuilder(
      listenable: viewModel.loadProfile,
      builder: (context, child) {
        final result = viewModel.loadProfile.result;
        String? avatarUrl;
        if (result is Ok<ProfileData>) {
          avatarUrl = result.value.avatarUrl;
        }
        return CircleAvatar(
          radius: 16,
          backgroundImage: (avatarUrl != null && avatarUrl.isNotEmpty)
              ? NetworkImage(avatarUrl)
              : const NetworkImage('https://i.pravatar.cc/150?img=11'),
        );
      },
    );
  }
}
