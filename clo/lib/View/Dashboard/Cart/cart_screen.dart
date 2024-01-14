import 'package:clo/View/Dashboard/Cart/Widgets/cart_bottom_bar_widget.dart';
import 'package:clo/View/Dashboard/Cart/Widgets/cart_list_widget.dart';
import 'package:clo/View/Dashboard/Product_Details/Widgets/product_details_header_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: const Color(0XFFF1F1F1),
                width: 1.0,
              ),
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ProductDetailsHeaderWidget(name: 'Bag'),
                ),
                const SizedBox(
                  height: 30,
                ),
               
                CartListWidget()
              ],
            ),
          ),
        ),
        bottomNavigationBar: CartBottomBarWidget());
  }
}
