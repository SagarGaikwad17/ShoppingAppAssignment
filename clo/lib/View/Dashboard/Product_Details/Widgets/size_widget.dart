import 'package:clo/View_Model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SizeWidget extends ConsumerStatefulWidget {
  const SizeWidget({super.key});

  @override
  _SizeWidgetState createState() => _SizeWidgetState();
}

class _SizeWidgetState extends ConsumerState<SizeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Text(
              "Select Size",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            )),
            Text("Size guide",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0XFFF07836),
                ))
          ],
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 50,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            children: List<Widget>.generate(
              ref.read(productViewModelController).shoesSize.length,
              (int idx) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                      padding: const EdgeInsets.all(0),
                      label: Text(
                          '${ref.read(productViewModelController).shoesSize[idx]}'),
                      selectedColor: Colors.white,
                      backgroundColor: Colors.white,
                      side: BorderSide(
                          color: ref
                                      .watch(productViewModelController)
                                      .selectedShoesSize ==
                                  idx
                              ? Colors.orange
                              : Colors.grey[200]!),
                      shape: RoundedRectangleBorder(),
                      selected: ref
                              .watch(productViewModelController)
                              .selectedShoesSize ==
                          idx,
                      onSelected: (bool selected) {
                        ref
                            .watch(productViewModelController)
                            .selectedShoesSize = (selected ? idx : null)!;
                  
                        ref.watch(productViewModelController).notifyListeners();
                      }),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
