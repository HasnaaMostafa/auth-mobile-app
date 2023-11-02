import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/custom_cover.dart';
import 'login_view_details.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCover(),
            Padding(
              padding: EdgeInsets.only(top: 70, bottom: 22),
              child: Center(
                child: Text(
                  "Log in to your account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            LoginViewDetails()
          ],
        ),
      ),
    );
  }
}

// width: 308px
// height: 397.23px
// top: -109px
// left: 394.53px
// angle: -90 deg
