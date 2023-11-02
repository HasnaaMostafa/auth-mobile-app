import 'package:flutter/material.dart';
import 'package:task1/core/data/models/AuthModel.dart';
import 'package:task1/features/Profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, this.authModel});

  final AuthModel? authModel;
  @override
  Widget build(BuildContext context) {
    return ProfileViewBody(
      authModel: authModel!,
    );
  }
}
