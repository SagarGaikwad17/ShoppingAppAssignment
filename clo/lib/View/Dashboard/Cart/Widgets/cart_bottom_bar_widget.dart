import 'package:clo/Model/product_model.dart';
import 'package:clo/View_Model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartBottomBarWidget extends ConsumerWidget {
  CartBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Container(
          margin: const EdgeInsets.only(bottom: 18.0),
          height: 70.0,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(color: Colors.grey.shade300, width: 1.0))),
          child: BottomAppBar(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 60,
            color: const Color(0xff212121),
            shape: const CircularNotchedRectangle(),
            notchMargin: 5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Price",
                            style:
                                TextStyle(fontSize: 10.0, color: Colors.white),
                          ),
                          Text("\$${ref.watch(cartViewModelController).total}",
                              style: const TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0XFFF07835),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          content:
                              Text('Your order has been placed successfully'),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                                Navigator.of(ctx).pop();
                                ref.watch(cartViewModelController).clearCart();
                              },
                              child: Text('OK'),
                            )
                          ],
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, top: 10, bottom: 10),
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
