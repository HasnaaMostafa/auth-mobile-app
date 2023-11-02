import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/core/data/models/AuthModel.dart';
import 'package:task1/core/services/api_service.dart';

import '../helper/cache_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.apiService) : super(AuthInitial());

  final ApiService apiService;

  AuthModel? authModel;

  Future<void> registerUser(
      {required String email,
      required String password,
      required String userName}) async {
    emit(RegisterLoadingState());

    authModel = await apiService
        .authUser(email: email, password: password, userName: userName)
        .then((authModel) {
      emit(RegisterSuccessState(authModel));
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
      print(error.toString());
    });
  }

  Future<void> loginUser(
      {required String password, required String userName}) async {
    emit(LoginLoadingState());

    authModel = await apiService
        .authUser(password: password, userName: userName)
        .then((authModel) {
      emit(LoginSuccessState(authModel));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      print(error.toString());
    });
  }

  void logOut() {
    CacheHelper.removeData(key: "token").then((value) {
      if (value == true) {
        emit(LogoutSuccessState());
      }
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePasswordVisibilityStates());
  }
}
