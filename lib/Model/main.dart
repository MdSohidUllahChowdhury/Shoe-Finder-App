import 'package:e_commerce_app/Controller/e_commerce.dart';
import 'package:e_commerce_app/Controller/provider_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp((ChangeNotifierProvider(
    create: (context) => CartProvider(),
    child: ScreenUtilInit(
      designSize: const Size(375, 725),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const DisplayPage(),
        theme: ThemeData(
            fontFamily: 'Lato_light',
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(254, 206, 1, 1),
              primary: const Color.fromRGBO(254, 206, 1, 1),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              prefixIconColor: Colors.grey,
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            useMaterial3: true),
      ),
    ),
  )));
}
