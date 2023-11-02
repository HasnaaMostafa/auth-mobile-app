import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/core/services/api_service.dart';

import 'core/bloc_observer/bloc_observer.dart';
import 'core/constants/constants.dart';
import 'core/cubit/auth_cubit.dart';
import 'core/helper/cache_helper.dart';
import 'features/Login/presentation/views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  token = CacheHelper.getData(key: "token");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => AuthCubit(ApiService(Dio()))),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const LoginView(),
      ),
    );
  }
}
