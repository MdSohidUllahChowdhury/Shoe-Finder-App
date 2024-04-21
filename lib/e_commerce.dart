import 'package:e_commerce_app/cart.dart';
import 'package:e_commerce_app/home_ui.dart';
import 'package:flutter/material.dart';

class Display_Page extends StatefulWidget {
  const Display_Page({super.key});

  @override
  State<Display_Page> createState() => _Display_PageState();
}

class _Display_PageState extends State<Display_Page> {
  
  int navigation_index = 0;
  List<Widget>page = [Home_UI(),Cart()];

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
     
      body: //navigation_index == 0? Home_UI() : Cart() 
         IndexedStack( //?j khane page reke onno page e gele abar return korle same jaygay thake
         index: navigation_index,
         children: page,
      ),

      bottomNavigationBar:
          BottomNavigationBar(
            selectedFontSize: 0,
            unselectedFontSize: 0,
          currentIndex: navigation_index,
          onTap: (value) {
            setState(() {
              navigation_index = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          ]
          ),
    );
  }
}
