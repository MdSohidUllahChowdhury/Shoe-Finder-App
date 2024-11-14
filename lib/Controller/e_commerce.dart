import 'package:e_commerce_app/View/cart.dart';
import 'package:e_commerce_app/View/home_ui.dart';
import 'package:flutter/material.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({super.key});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  int navigationindex = 0;
  List<Widget> page = [
    const HomeUI(),
    const Cart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: navigationindex,
        children: page,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xffE1E1E1),
          elevation: 0,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          currentIndex: navigationindex,
          onTap: (value) {
            setState(() {
              navigationindex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          ]),
    );
  }
}
