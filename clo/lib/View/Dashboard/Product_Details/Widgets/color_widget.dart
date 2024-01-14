import 'package:clo/View_Model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorWidget extends ConsumerStatefulWidget {
  const ColorWidget({super.key});

  @override
  _ColorWidgetState createState() => _ColorWidgetState();
}

class _ColorWidgetState extends ConsumerState<ColorWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
                child: Text(
              "Select Color",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            )),
          ],
        ),
        const SizedBox(height: 5,),
        SizedBox(
          height: 50,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            children: List<Widget>.generate(
              ref.read(productViewModelController).shoesColor.length,
              growable: true,
              (int idx) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                      padding: const EdgeInsets.all(0),
                      label: Image.network(
                        'https://rukminim1.flixcart.com/image/832/832/jao8uq80/shoe/3/r/q/sm323-9-sparx-white-original-imaezvxwmp6qz6tg.jpeg?q=70',
                       width: 40,
                       height: 40,
                      ),
                      selectedColor: Colors.white,
                      backgroundColor: Colors.white,
                      side : BorderSide(color:  ref
                              .watch(productViewModelController)
                              .selectedShoesColor ==
                          idx ?Colors.orange : Colors.grey[200]!),
                      shape:  const RoundedRectangleBorder(),
                      
                      selected: ref
                              .watch(productViewModelController)
                              .selectedShoesColor ==
                          idx,
                      onSelected: (bool selected) {
                        ref
                            .watch(productViewModelController)
                            .selectedShoesColor = (selected ? idx : null)!;

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
