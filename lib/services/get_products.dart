import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../home/model/model.dart';

class GetPosts {
  Future<List<GetPostModel>?> getTimelinePosts() async {
    try {
      Response response = await Dio().get(
        "https://api.escuelajs.co/api/v1/products",
      );
      if (response.statusCode! > 199 || response.statusCode! < 300) {
        return getPostModelFromJson(jsonEncode(response.data));
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }
}
