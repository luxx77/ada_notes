import 'dart:developer';

import 'package:ada_notes/modal_product.dart';
import 'package:flutter/material.dart';

import '../sql_helper.dart';

class MainProvider with ChangeNotifier {
  DateTime selectedDate = DateTime.now();
  List<Map<String, Object>> getMap = [];
  List<ProductModal> productList = [];
  List<ProductModal> serachList = [];

  TextEditingController phoneNumController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();
  TextEditingController editController = TextEditingController();
  TextEditingController numEditController = TextEditingController();
 
  void updateState() {
    notifyListeners();
    log('State Updated');
  }

  Future<void> getProduct() async {
    List gettedProduct = await DBHelper.getData('user_favorites');
    productList.clear();
    for (int i = 0; i < gettedProduct.length; i++) {
      productList.add(
        ProductModal.fromMap(
          gettedProduct[i],
        ),
      );
    }
    updateState();
  }

  int forCount = 0;
  bool isSearching = false;
  String numForDialog = '';

  void doSearch() {
    serachList.clear();
    if (searchController.text.length == 1) {
      isSearching = true;
      notifyListeners();
    } else if (searchController.text == '') {
      isSearching = false;
      notifyListeners();
    }
    for (int i = 0; productList.length > i; i++) {
      if (productList[i].number!.contains(searchController.text)) {
        serachList.add(productList[i]);
        notifyListeners();
      }
    }
  }
}
