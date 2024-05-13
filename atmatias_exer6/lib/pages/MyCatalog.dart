import "package:flutter/material.dart";
import "../model/Item.dart";
import "package:provider/provider.dart";
import "../provider/ShoppingCart.dart";

//this code displays a list of items that can be added to the cart
class MyCatalog extends StatefulWidget {
  const MyCatalog({super.key});
  @override
  State<MyCatalog> createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  List<Item> products = [
    //the format for this is in item.dart
    Item("Shampoo - 10.0", 10.0, 123),
    Item("Soap - 12.0", 12.0, 862),
    Item("Toothpaste - 40.0", 40.0, 532)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Catalog")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    //displays each product
                    leading: const Icon(Icons.shop),
                    title: Text(products[index].name),
                    trailing: TextButton(
                      child: const Text("Add"),
                      onPressed: () {
                        context.read<ShoppingCart>().addItem(products[index]);
                      },
                    ),
                  );
                }
              )
            ),
          ],
        ),
      ),
      //this is the cart icon in the button that when clicked, will go to the shopping cart screen
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.pushNamed(context, "/cart");
        }
      ),
    );
  }
}