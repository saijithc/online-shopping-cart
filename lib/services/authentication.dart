import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:machinetask/helper_function/helper_function.dart';

class Auth {
  Future<String?> signIn(user) async {
    try {
      Response response = await Dio()
          .post("https://fakestoreapi.com/auth/login", data: user.toJson());
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log(response.toString());
        HelperFuction.saveUserLogged(true);

        log(user.toString());
        return "sucess";
      } else {
        log(response.statusCode.toString());
        log(response.data.toString());
        log(response.toString());
        log(user.toString());
      }
    } on DioError catch (e) {
      log(e.response!.data!.toString());
      if (e.message.startsWith("SocketException")) {
        return "please check your internet connection";
      }
      if (e.response?.data is Map && e.response!.data['error'] != null) {
        return e.response!.data['error'];
      }
      return 'something went wrong';
    }
    return "error 2";
  }
}
