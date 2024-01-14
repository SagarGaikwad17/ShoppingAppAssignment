import 'package:clo/View/Dashboard/Home/widgets/product_view_widget.dart';
import 'package:clo/View_Model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryWidget extends ConsumerStatefulWidget {
  const CategoryWidget({super.key});

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends ConsumerState<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                    child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                )),
                Text("See all",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0XFFF07836),
                    ))
              ],
            ),
            SizedBox(
              height: 50,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                children: List<Widget>.generate(
                  ref.read(productViewModelController).shoesBrand.length,
                  growable: true,
                  (int idx) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                          padding: const EdgeInsets.all(0),
                          label: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              ref
                                  .watch(productViewModelController)
                                  .shoesBrand[idx],
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ref
                                              .watch(productViewModelController)
                                              .selectedCategorie ==
                                          idx
                                      ? Colors.white
                                      : const Color(0XFFF07836)),
                            ),
                          ),
                          selectedColor: const Color(0XFFF07836),
                          backgroundColor: Colors.white,
                          shape: const StadiumBorder(
                              side: BorderSide(color: Color(0XFFF07836))),
                          selected: ref
                                  .watch(productViewModelController)
                                  .selectedCategorie ==
                              idx,
                          onSelected: (bool selected) {
                            ref
                                .watch(productViewModelController)
                                .selectedCategorie = (selected ? idx : null)!;
                            ref
                                .read(productViewModelController)
                                .getProductByCategory((selected ? idx : null)!);

                            ref
                                .watch(productViewModelController)
                                .notifyListeners();
                          }),
                    );
                  },
                ).toList(),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.8),
              itemBuilder: (BuildContext context, int index) {
                return ProductViewWidget(
                  item: ref
                      .watch(productViewModelController)
                      .productModelList[index],
                );
              },
              itemCount:
                  ref.watch(productViewModelController).productModelList.length,
            ),
          ],
        ),
      ),
    );
  }
}
