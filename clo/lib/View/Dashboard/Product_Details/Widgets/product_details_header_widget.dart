import 'package:clo/View_Model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductDetailsHeaderWidget extends ConsumerWidget {
  String? name;
  ProductDetailsHeaderWidget({super.key, this.name});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    offset: const Offset(
                      2,
                      1,
                    ),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                  ), //BoxShadow
                  //BoxShadow
                ],
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.black,
                    size: 22,
                  ),
                ),
              ),
            ),
          ],
        )),
        Expanded(
            child: Center(
                child: Text(
          "$name (${ref.watch(cartViewModelController).cartModelList.length})",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ))),
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    offset: const Offset(
                      2,
                      1,
                    ),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                  ), //BoxShadow
                  //BoxShadow
                ],
              ),
              child: InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    FontAwesomeIcons.heart,
                    color: Colors.black,
                    size: 22,
                  ),
                ),
              ),
            ),
          ],
        )),
      ],
    );
  }
}
