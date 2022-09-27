import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:machinetask/home/model/model.dart';
import 'package:machinetask/services/get_products.dart';

class HomeProvider with ChangeNotifier {
  bool isLoading = false;
  List<String> categoryNames = [
    'furniture',
    'shoes',
    'clothes',
    'electronics',
    'other'
  ];
  int selectedIndex = 0;
  List<List<GetPostModel>> categoryItems = [];
  List<GetPostModel> furniture = [];
  List<GetPostModel> shoes = [];
  List<GetPostModel> clothes = [];
  List<GetPostModel> other = [];
  List<GetPostModel> electronics = [];
  changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future getPost() async {
    isLoading = true;
    notifyListeners();
    await GetPosts().getTimelinePosts().then((value) {
      value!.map((e) {
        if (e.category.name == Name.furniture) {
          furniture.add(e);
        } else if (e.category.name == Name.clothes) {
          clothes.add(e);
        } else if (e.category.name == Name.electronics) {
          electronics.add(e);
        } else if (e.category.name == Name.shoes) {
          shoes.add(e);
        } else {
          other.add(e);
        }
      }).toList();
      categoryItems.add(furniture);

      categoryItems.add(shoes);
      categoryItems.add(clothes);
      categoryItems.add(electronics);
      categoryItems.add(other);
    });
    isLoading = false;
    log(categoryItems.toString());
    notifyListeners();
  }
}
