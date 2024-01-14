import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: Text(
                    'Search shoes...',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0XFFF07835),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        left: 25, right: 25, top: 10, bottom: 10),
                    child: Text(
                      'Search',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
