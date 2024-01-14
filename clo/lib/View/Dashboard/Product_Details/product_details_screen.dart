import 'package:clo/Model/product_model.dart';
import 'package:clo/View/Dashboard/Product_Details/Widgets/custome_bottom_bar.dart';
import 'package:clo/View/Dashboard/Product_Details/Widgets/image_slider_widget.dart';
import 'package:clo/View/Dashboard/Product_Details/Widgets/product_details_header_widget.dart';
import 'package:clo/View/Dashboard/Product_Details/Widgets/product_information_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel item;

  const ProductDetailScreen({super.key, required this.item});

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ProductDetailsHeaderWidget(name: widget.item.name),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ImageSliderWidget(widget.item.image),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ProductInformationWidget(widget.item)
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomeBottomBarWidget(widget.item));
  }
}
