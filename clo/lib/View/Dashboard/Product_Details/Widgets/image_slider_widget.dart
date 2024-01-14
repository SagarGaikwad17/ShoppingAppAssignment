import 'package:clo/Utils/Common_Widget/dot_widget.dart';
import 'package:flutter/material.dart';

class ImageSliderWidget extends StatefulWidget {
  String? image;
  ImageSliderWidget(this.image, {super.key});

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  late PageController pageController;
  int active = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.orange[100]!,
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
            padding: EdgeInsets.only(bottom: 15),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  print(index);
                  setState(() {
                    active = index;
                  });
                },
                children: <Widget>[
                  Image.network(
                    widget.image!,
                    height: 150.0,
                  ),
                  Image.network(
                    widget.image!,
                    height: 150.0,
                  ),
                  Image.network(
                    widget.image!,
                    height: 150.0,
                  ),
                  Image.network(
                    widget.image!,
                    height: 150.0,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DotWidget(
                activeIndex: active,
                dotIndex: 0,
              ),
              DotWidget(
                activeIndex: active,
                dotIndex: 1,
              ),
              DotWidget(
                activeIndex: active,
                dotIndex: 2,
              ),
              DotWidget(
                activeIndex: active,
                dotIndex: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
