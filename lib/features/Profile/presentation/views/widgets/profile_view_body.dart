import 'package:flutter/material.dart';
import 'package:task1/core/data/models/AuthModel.dart';
import 'package:task1/core/utils/widgets/custom_cover.dart';
import 'package:task1/features/Profile/presentation/views/widgets/profile_view_details.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, required this.authModel});
  final AuthModel authModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomCover(
              image: CircleAvatar(
                radius: MediaQuery.of(context).size.height * 0.065,
                child: Image.network(
                  "${authModel.image}",
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.height * 0.2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70, bottom: 22),
              child: Center(
                child: Text(
                  "${authModel.firstName} ${authModel.lastName}",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ProfileViewDetails(
              authModel: authModel,
            )
          ],
        ),
      ),
    );
  }
}
