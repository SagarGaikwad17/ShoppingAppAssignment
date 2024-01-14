import 'package:clo/Model/product_model.dart';
import 'package:clo/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductViewModel extends ChangeNotifier {
  final List<String> shoesBrand = ['All', 'Nike', 'Adidas', 'Puma', 'Fila'];

  final List<String> shoesColor = ['Red', 'Green', 'Grey', 'Black', 'Blue'];
  final List<String> shoesSize = ['41', '42', '43', '44', '45','46','47'];

  int selectedCategorie = 0;
    int selectedShoesColor = 0;
  int selectedShoesSize = 0;


  List<ProductModel> productModelList = [];
  List<ProductModel> productModelListTemp = [];

  getProductItems() {
    int count = 1;
    data.forEach((element) {
      element['id'] = count;
      productModelList.add(ProductModel.fromJson(element));
      count++;
    });
    productModelListTemp.addAll(productModelList);
    notifyListeners();
  }

  getProductByCategory(int type) {
    productModelList.clear();

    if (type == 0) {
      productModelList.addAll(productModelListTemp);
      return;
    }

    productModelList = productModelListTemp.where((data) {
      print("${data.category == type}");
      return data.category == type;
    }).toList();

    print("=====>${productModelList.length}");

    notifyListeners();
  }
}

final productViewModelController =
    ChangeNotifierProvider<ProductViewModel>((ref) {
  return ProductViewModel();
});
