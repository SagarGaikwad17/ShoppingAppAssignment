import 'package:clo/View_Model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartListWidget extends ConsumerWidget {
  const CartListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ref.watch(cartViewModelController).cartModelList.length != 0
                ? Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: List<Widget>.generate(
                        ref.watch(cartViewModelController).cartModelList.length,
                        (int idx) {
                          return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
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
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(8),
                                          ),
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
                                          padding: const EdgeInsets.all(5),
                                          child: Image.network(
                                            ref
                                                .watch(cartViewModelController)
                                                .cartModelList[idx]
                                                .image!,
                                            width: 100,
                                            height: 70,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 3, left: 20, right: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${ref.watch(cartViewModelController).cartModelList[idx].name}',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const Text(
                                                'Size: 40',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      '\$${ref.watch(cartViewModelController).cartModelList[idx].price}',
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  25)),
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color:
                                                              Colors.grey[300]!,
                                                          offset: const Offset(
                                                            2,
                                                            1,
                                                          ),
                                                          blurRadius: 4.0,
                                                          spreadRadius: 1.0,
                                                        ), //BoxShadow
                                                      ],
                                                    ),
                                                    child: InkWell(
                                                      onTap: () {
                                                        print('-minus');
                                                        ref
                                                            .watch(
                                                                cartViewModelController)
                                                            .removeCartItem(ref
                                                                .watch(
                                                                    cartViewModelController)
                                                                .cartModelList[idx]);
                                                      },
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.all(6),
                                                        child: Icon(
                                                          FontAwesomeIcons
                                                              .minus,
                                                          color: Colors.black,
                                                          size: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                      '${ref.watch(cartViewModelController).cartModelList[idx].qty}'),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  25)),
                                                      color: Colors.orange,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color:
                                                              Colors.grey[300]!,
                                                          offset: const Offset(
                                                            2,
                                                            1,
                                                          ),
                                                          blurRadius: 4.0,
                                                          spreadRadius: 1.0,
                                                        ), //BoxShadow
                                                      ],
                                                    ),
                                                    child: InkWell(
                                                      onTap: () {
                                                        print('-plus');
                                                        ref
                                                            .watch(
                                                                cartViewModelController)
                                                            .addCartItem(ref
                                                                .watch(
                                                                    cartViewModelController)
                                                                .cartModelList[idx]);
                                                      },
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.all(6),
                                                        child: Icon(
                                                          FontAwesomeIcons.plus,
                                                          color: Colors.white,
                                                          size: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        },
                      ).toList(),
                    ),
                  )
                : Center(
                    child: Container(
                    child: const Text('Empty Cart'),
                  )),
          ),
          Container(
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
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: const [
                      Expanded(
                          child: Text(
                        "Order info",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Expanded(
                          child: Text(
                        "Subtotal",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )),
                      Text("\$${ref.watch(cartViewModelController).subTotal}",
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: const [
                      Expanded(
                          child: Text(
                        "Shipping",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )),
                      Text("\$100",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: const [
                      Expanded(
                          child: Text(
                        "Discount",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )),
                      Text("\$0",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
