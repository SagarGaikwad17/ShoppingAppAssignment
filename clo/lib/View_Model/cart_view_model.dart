import 'package:clo/Model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_alert/status_alert.dart';

class CartViewModel extends ChangeNotifier {
  List<ProductModel> cartModelList = [];
  double subTotal = 0.0;
  double total = 0.0;

  addToCart(ProductModel item, context) {
    int index = cartModelList.indexWhere((product) => product.id == item.id);
    if (index == -1) {
      item.qty = item.qty! + 1;
      cartModelList.add(item);
      addToAmount(item.price!);

      showPopup('Added', context);
    } else {
      addToAmount(cartModelList[index].price!);

      cartModelList[index].qty = cartModelList[index].qty! + 1;
      showPopup('Added', context);
    }
    notifyListeners();
  }

  addToAmount(double amt) {
    subTotal = subTotal + amt;
    total = subTotal + 100;
  }

  showPopup(String message, context) {
    StatusAlert.show(
      context,
      duration: Duration(seconds: 2),
      title: message,
      titleOptions:
          StatusAlertTextConfiguration(style: TextStyle(fontSize: 20)),
      configuration: IconConfiguration(icon: Icons.done, size: 50),
      maxWidth: 160,
    );
  }

  addCartItem(ProductModel item) {
    int index = cartModelList.indexWhere((product) => product.id == item.id);
    if (index != -1) {
      addToAmount(cartModelList[index].price!);

      cartModelList[index].qty = cartModelList[index].qty! + 1;

      print("in add cart");
    }
    notifyListeners();
  }

  removeCartItem(ProductModel item) {
    int index = cartModelList.indexWhere((product) => product.id == item.id);
    if (index != -1) {
      if (cartModelList[index].qty == 1) {
        removeAmount(cartModelList[index].price!);

        cartModelList.removeAt(index);
      } else {
        removeAmount(cartModelList[index].price!);

        cartModelList[index].qty = cartModelList[index].qty! - 1;
      }
      print("in remove cart");
    }
    notifyListeners();
  }

  removeAmount(double amt) {
    subTotal = subTotal - amt;

    if (subTotal == 0.0) {
      total = subTotal;
    } else {
      total = subTotal + 100;
    }
  }

  void clearCart() {
    cartModelList.clear();
    subTotal = 0.0;
    total = 0.0;
  }
}

final cartViewModelController = ChangeNotifierProvider<CartViewModel>((ref) {
  return CartViewModel();
});
