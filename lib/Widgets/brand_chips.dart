import 'package:flutter/material.dart';

class BrandChips extends StatefulWidget {
  const BrandChips({super.key});

  @override
  State<BrandChips> createState() => _BrandChipsState();
}

class _BrandChipsState extends State<BrandChips> {
  final List<String> brandname = [
    //* Brand Name Declear
    'All',
    'Runing',
    'Life Style',
    'Reguler',
    'GYM'
  ];

  String? selected;

  @override
  void initState() {
    selected = brandname[0];
    //* init here the dec variable by using brand name index
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: brandname.length,
          itemBuilder: (context, index) {
            final brand = brandname[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = brand;
                  });
                },
                child: Chip(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  backgroundColor: selected == brand
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  side: const BorderSide(color: Color(0xff292929)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  label: Text(brand,
                      style: selected == brand
                          ? const TextStyle(fontSize: 14, color: Colors.white)
                          : const TextStyle(fontSize: 14, color: Colors.black)),
                ),
              ),
            );
          }),
    );
  }
}
