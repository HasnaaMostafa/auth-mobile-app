import 'package:dio/dio.dart';

import '../data/models/AuthModel.dart';

class ApiService {
  final Dio dio;
  ApiService(this.dio);

  Future<AuthModel> authUser(
      {String? email,
      required String password,
      required String userName}) async {
    try {
      final response = await dio.post("https://dummyjson.com/auth/login",
          options: Options(
            contentType: Headers.jsonContentType,
          ),
          data: {'username': userName, 'password': password, 'email': email});

      if (response.statusCode == 200) {
        final authModel = AuthModel.fromJson(response.data);
        return authModel;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
