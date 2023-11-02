import 'package:flutter/material.dart';
import 'package:task1/core/utils/widgets/custom_cover.dart';
import 'package:task1/features/Register/presentation/views/widgets/register_view_details.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomCover(),
            const Padding(
              padding: EdgeInsets.only(top: 70, bottom: 22),
              child: Center(
                child: Text(
                  "Create new account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            RegisterViewDetails()
          ],
        ),
      ),
    );
  }
}
