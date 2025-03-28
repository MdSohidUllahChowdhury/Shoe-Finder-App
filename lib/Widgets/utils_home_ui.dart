import 'package:e_commerce_app/Controller/product_list.dart';
import 'package:e_commerce_app/View/shoe_details.dart';
import 'package:e_commerce_app/Widgets/shoe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Utils {
  static customBar() {
    return Animate(
      child: Container(
        height: 318,
        width: 396,
        margin: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Color(0xff90CAF9),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.menu_rounded)),
              title: Image.asset('lib/Assets/images/barLogo.png'),
              trailing: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('lib/Assets/images/profile.jpg'),
              ),
            ),
            const ListTile(
                title: Text(
                  'Shoe Finder',
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.black54,
                      fontWeight: FontWeight.w200,
                      fontFamily: 'Lato_Light'),
                ),
                subtitle: Text(
                  'Experience Fashion with Our Shoe Lineup',
                  style: TextStyle(fontSize: 16, fontFamily: 'Lato_Light'),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: TextFormField(
                decoration: const InputDecoration(
                  fillColor: Color(0xffE5F4FF),
                  filled: true,
                  suffixIcon: Icon(Icons.search_outlined),
                  hintText: "Search",
                  hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lato_Light'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .flipH(duration: const Duration(seconds: 3))
        .shimmer(color: Colors.white, duration: const Duration(seconds: 6));
  }

  static shoesDisplay() {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return DetailsPage(product: product);
                }));
              },
              child: ShowCard(
                  title: product['title'] as String,
                  price: product['price'] as double,
                  image: product['imageUrl'] as String,
                  bgcolor: index.isEven
                      ? const Color(0xff61FC5F)
                      : const Color(0xffFF6E24)),
            );
          }),
    );
  }
}
