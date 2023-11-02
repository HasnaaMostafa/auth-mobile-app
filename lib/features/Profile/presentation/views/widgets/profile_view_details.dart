import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/core/cubit/auth_cubit.dart';
import 'package:task1/core/data/models/AuthModel.dart';

import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../Login/presentation/views/login_view.dart';

class ProfileViewDetails extends StatelessWidget {
  const ProfileViewDetails({super.key, required this.authModel});

  final AuthModel authModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginView()),
              (route) => false);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Username",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff808194)),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                enabled: false,
                hintN: "${authModel.username}",
              ),
              const SizedBox(
                height: 22,
              ),
              const Text(
                "Email",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff808194)),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                enabled: false,
                hintN: "${authModel.email}",
              ),
              const SizedBox(
                height: 22,
              ),
              const Text(
                "Gender",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff808194)),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                enabled: false,
                hintN: "${authModel.gender}",
              ),
              const SizedBox(
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 22),
                child: CustomButton(
                  onTap: () {
                    BlocProvider.of<AuthCubit>(context).logOut();
                  },
                  text: "Log out",
                  color: const Color(0xffDC3545),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
