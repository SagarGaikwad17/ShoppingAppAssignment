import 'package:clo/View/Dashboard/Home/widgets/banner_widget.dart';
import 'package:clo/View/Dashboard/Home/widgets/category_widget.dart';
import 'package:clo/View/Dashboard/Home/widgets/header_widget.dart';
import 'package:clo/View/Dashboard/Home/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: const Color(0XFFF1F1F1),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  color: const Color(0XFFF1F1F1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: HeaderWidget(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: SearchWidget(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: BannerWidget(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CategoryWidget(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
