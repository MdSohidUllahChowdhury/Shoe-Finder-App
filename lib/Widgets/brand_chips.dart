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
    'Adidas',
    'Nike',
    'Bata',
    'Puma'
  ];

  String? selected;

  @override
  void initState() {
    selected =
        brandname[0]; //* init here the dec variable by using brand name index
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  label: Text(
                    brand,
                    style: const TextStyle(fontSize: 16),
                  ),
                  backgroundColor: selected == brand
                      ? Theme.of(context).primaryColor
                      : const Color.fromRGBO(245, 247, 249, 1),
                  side: const BorderSide(
                    color: Color.fromRGBO(245, 247, 249, 1),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            );
          }),
    );
  }
}
