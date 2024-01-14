import 'package:clo/View/Dashboard/Cart/cart_screen.dart';
import 'package:clo/View/Dashboard/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const Center(
      child: Text('Search Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ),
    const Center(
      child: Text('Favorite Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ),
    const Center(
      child: Text('Profile Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFEE7C3F),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const CartScreen()));
        },
        child: const Icon(FontAwesomeIcons.bagShopping),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        child: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          color: const Color(0xff212121),
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () {
                    _onItemTapped(0);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Icon(
                        _selectedIndex == 0
                            ? Icons.home_filled
                            : Icons.home_outlined,
                        color: _selectedIndex == 0 ? Colors.white : Colors.grey,
                        size: 23,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Icon(
                        Icons.circle,
                        color: _selectedIndex == 0
                            ? Colors.white
                            : const Color(0xff212121),
                        size: 5,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    _onItemTapped(1);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Icon(
                        _selectedIndex == 1
                            ? FontAwesomeIcons.searchengin
                            : FontAwesomeIcons.search,
                        color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                        size: 20,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Icon(
                        Icons.circle,
                        color: _selectedIndex == 1
                            ? Colors.white
                            : const Color(0xff212121),
                        size: 5,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    _onItemTapped(2);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Icon(
                        _selectedIndex == 2
                            ? FontAwesomeIcons.solidHeart
                            : FontAwesomeIcons.heart,
                        color: _selectedIndex == 2 ? Colors.white : Colors.grey,
                        size: 20,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Icon(
                        Icons.circle,
                        color: _selectedIndex == 2
                            ? Colors.white
                            : const Color(0xff212121),
                        size: 5,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: InkWell(
                    onTap: () {
                      _onItemTapped(3);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Icon(
                          _selectedIndex == 3
                              ? FontAwesomeIcons.solidUser
                              : FontAwesomeIcons.user,
                          color:
                              _selectedIndex == 3 ? Colors.white : Colors.grey,
                          size: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Icon(
                          Icons.circle,
                          color: _selectedIndex == 3
                              ? Colors.white
                              : const Color(0xff212121),
                          size: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
