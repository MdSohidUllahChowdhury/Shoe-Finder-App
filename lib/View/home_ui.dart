import 'package:e_commerce_app/Widgets/brand_chips.dart';
import 'package:e_commerce_app/Widgets/utils_home_ui.dart';
import 'package:flutter/material.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

String xxooxx = '  New Collection';

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE1E1E1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Utils.customBar(),
            Text(
              xxooxx,
              style: const TextStyle(
                  fontFamily: 'Lato_Light',
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const BrandChips(),
            Utils.shoesDisplay()
          ],
        ),
      ),
    );
  }
}
