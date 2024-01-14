import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Color(0XFF273460),
            borderRadius: BorderRadius.all(Radius.circular(28))),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    'New Collections',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: const [
                  Text(
                    'Discount 30% for the \n first transcation',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: const Padding(
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                      child: Text(
                        'Shop now',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0XFFF07835),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
