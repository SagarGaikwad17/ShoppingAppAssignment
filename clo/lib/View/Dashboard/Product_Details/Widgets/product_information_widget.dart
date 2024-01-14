import 'package:clo/Model/product_model.dart';
import 'package:clo/View/Dashboard/Product_Details/Widgets/color_widget.dart';
import 'package:clo/View/Dashboard/Product_Details/Widgets/size_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:readmore/readmore.dart';

class ProductInformationWidget extends StatelessWidget {
  final ProductModel item;
  String desc =
      ', Inc. is an American multinational association that is involved in the design, development, manufacturing and worldwide marketing and sales of apparel, footwear, accessories, equipment and services.';
  ProductInformationWidget(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
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
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.star, size: 14, color: Color(0XFFF6D31D)),
                Text(
                  " ${item.rating!} (1246 reviews)",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10.0,
                      color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              item.name!,
              style:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 19.0),
            ),
            SizedBox(
              height: 5,
            ),
            ReadMoreText(
              '${item.name}$desc',
              trimLines: 3,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: ' Show more',
              trimExpandedText: ' Show less',
              moreStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[500]),
              lessStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[500]),
            ),
            SizedBox(
              height: 20,
            ),
            ColorWidget(),
            SizedBox(
              height: 20,
            ),
            SizeWidget(),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
