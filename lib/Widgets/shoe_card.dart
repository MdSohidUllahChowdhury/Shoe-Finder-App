import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ShowCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color bgcolor;

  const ShowCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.bgcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        width: 190,
        height: 230,
        decoration: BoxDecoration(
            color: bgcolor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Animate(
                    child: Image.asset(image,
                        width: 160, height: 220, fit: BoxFit.fitHeight))
                .animate()
                .flipH(
                  delay: const Duration(seconds: 5),
                )
                .shake(
                  duration: const Duration(seconds: 5),
                  delay: const Duration(seconds: 2),
                ),
            const Divider(thickness: 4, color: Color(0xff292929)),
            const Expanded(child: SizedBox(height: 2)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                title,
                style: const TextStyle(fontSize: 12),
              ),
              const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xffFFF187),
                child: Center(
                    child: Icon(
                  Icons.favorite_border,
                  size: 14,
                )),
              )
            ]),
            const SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                '\$$price',
                style: const TextStyle(fontSize: 18),
              ),
              const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xff292929),
                child: Center(
                    child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 14,
                  color: Colors.white,
                )),
              )
            ]),
          ],
        ),
      ),
    )
        .animate()
        .flipV(
          duration: const Duration(seconds: 3),
        )
        .shimmer(color: Colors.white, duration: const Duration(seconds: 6));
  }
}
