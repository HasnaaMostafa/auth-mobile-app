import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task1/core/cubit/auth_cubit.dart';
import 'package:task1/features/Profile/presentation/views/profile_view.dart';
import 'package:task1/features/Register/presentation/views/register_view.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/helper/cache_helper.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_check_box.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';

class LoginViewDetails extends StatefulWidget {
  const LoginViewDetails({
    super.key,
  });

  @override
  State<LoginViewDetails> createState() => _LoginViewDetailsState();
}

class _LoginViewDetailsState extends State<LoginViewDetails> {
  var passController = TextEditingController();

  var userController = TextEditingController();
  bool saveLoginData = false;
  var formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    populateSavedCredentials();
  }

  void populateSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('username');
    final savedPassword = prefs.getString('password');

    if (savedUsername != null && savedPassword != null) {
      setState(() {
        userController.text = savedUsername;
        passController.text = savedPassword;
        rememberMe = true; // Ensure the checkbox is checked
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          CacheHelper.saveData(key: "token", value: state.authModel.id)
              .then((_) async {
            await CacheHelper.saveModel("myModelKey", state.authModel)
                .then((_) {
              token = state.authModel.id;
            });
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  ProfileView(authModel: state.authModel),
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formkey,
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
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return " Field is required";
                      } else {
                        return null;
                      }
                    },
                    controller: userController,
                    suffixIcon: IconButton(
                      onPressed: () {
                        userController.clear();
                      },
                      icon: const Icon(
                        Icons.cancel_outlined,
                        color: Color(0xff808194),
                      ),
                    )),
                const SizedBox(
                  height: 22,
                ),
                const Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff808194)),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return " Field is required";
                      } else {
                        return null;
                      }
                    },
                    isPassword: BlocProvider.of<AuthCubit>(context).isPassword,
                    controller: passController,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context)
                            .changePasswordVisibility();
                      },
                      icon: Icon(
                        BlocProvider.of<AuthCubit>(context).suffix,
                        color: const Color(0xff808194),
                      ),
                    )),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  children: [
                    customCheckBox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value ?? false;
                          });
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Remember me",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forget password?",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  child: CustomButton(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).loginUser(
                            password: passController.text,
                            userName: userController.text);
                        if (rememberMe) {
                          CacheHelper.saveCredentialsToSharedPreferences(
                              userController.text, passController.text);
                        }
                      }
                    },
                    text: "Log in",
                    color: Colors.blue,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "Don’t have an account?",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const RegisterView()));
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

///dpettegre6
//YVmhktgYVS
//dpettegre6@columbia.edu

//atuny0
//9uQFF1Lh
