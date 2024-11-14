import 'package:e_commerce_app/Controller/provider_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const DetailsPage({super.key, required this.product});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int sizeSelected = 0; //* <--

//!------------->>>>>>
  void onTap() {
    if (sizeSelected != 0) {
      Provider.of<CartProvider>(context, listen: false).addToCart({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
        'sizes': sizeSelected
      });

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully Added To The Cart')));
    } else {
      (ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Hey! Select Size!!!'))));
    }
  }
//!---------------<<<<<<<<<

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE1E1E1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            leading: InkWell(onTap: () => Navigator.pop(context),
              child: Chip(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(
                      color: Color(0xff292929), style: BorderStyle.solid),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35)),
                  label: const Icon(Icons.keyboard_double_arrow_left_rounded)),
            ),
            trailing: Chip(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                backgroundColor: Colors.transparent,
                side: const BorderSide(
                    color: Color(0xff292929), style: BorderStyle.solid),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                label: const Icon(Icons.favorite)),
          ),
          Text(widget.product['title'] as String,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.3)),
          Image.asset(widget.product['imageUrl'] as String),
          ListTile(
            title: const Text(
              'Price',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '\$${widget.product['price']}',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (widget.product['sizes'] as List<int>).length,
              itemBuilder: (context, index) {
                final size = (widget.product['sizes'] as List<int>)[index];
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        sizeSelected = size;
                      });
                    },
                    child: Chip(
                      label: Text(size.toString(),
                          style: sizeSelected == size
                              ? const TextStyle(color: Colors.white)
                              : const TextStyle(color: Colors.black54)),
                      backgroundColor: sizeSelected == size
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  minimumSize: const Size(364, 80),
                  elevation: 6),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Add To Cart',
                    style: TextStyle(
                        fontFamily: 'Lato_light',
                        color: Colors.white,
                        fontSize: 24,
                        letterSpacing: 1.3),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  CircleAvatar(
                    radius: 31,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
