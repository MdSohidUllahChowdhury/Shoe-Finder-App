import 'package:e_commerce_app/Model/provider_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  Widget build(BuildContext context) {

   final cart = context.watch<CartProvider>().cart;

    return Scaffold(
      appBar: AppBar(
        title:const Text('Cart Items',
          style: TextStyle(
           fontWeight: FontWeight.w300,
           fontSize: 25),
           ),
        centerTitle: true,
        ),
      
      body: ListView.builder(
              itemCount: cart.length ,
              itemBuilder:(context,index){
                final cartItems = cart[index];
                
                return ListTile(
                  leading: SizedBox(
                    height: 100,
                    width: 50,
                    child: Image(image: AssetImage(cartItems['imageUrl']as String)),
                  ),
                  
                  title: Text(cartItems['title'].toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                    ),

                  subtitle: Text('Size: ${cartItems['sizes']}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
                    ),

                  trailing: IconButton(
                    onPressed: (){
                    showDialog(
                      context: context,
                      builder:(context){
                      return AlertDialog(
                        title: const Text('Delete Item'),
                        content: const Text('Are You Sure You Wanna Delete the Item?'),
                        actions: [
                          
                          TextButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, 
                          child: const Text('NO',
                          style: TextStyle(color: Colors.blue),
                          )
                          ),
                          
                          TextButton(onPressed: (){
                            Provider.of<CartProvider>(context,listen: false).deleteFromtheCart(cartItems);
                            Navigator.of(context).pop();
                          }, 
                          child: const Text('YES',
                          style: TextStyle(color: Colors.red),
                          )
                          )
                       
                        ],
                      );
                    },
                  );
                }, 
                  icon:const Icon(
                    Icons.delete,
                    size: 25,
                    color: Colors.red,
                    )
                    )
                );
              }
              ),
    );
  }
}