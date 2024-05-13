import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../provider/ShoppingCart.dart";

//this code displays the items in the shopping cart
class MyCart extends StatelessWidget {
  const MyCart({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart"),),
      body: Center(
        child: Consumer<ShoppingCart>(
          builder: (context, prov, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  //if the cart is t-empty, it will simply display that there are no products yet
                  child: prov.cart.isEmpty 
                  ? const Text("No Products Yet")
                  : ListView.builder(
                    //however, if the cart is not empty, it will display the list of items in the cart with a remove button for each item
                    itemCount: prov.cart.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.star),
                        title: Text(prov.cart[index].name),
                        trailing: TextButton(
                          child: const Text("Remove"),
                          onPressed: () {
                            context.read<ShoppingCart>().removeItem(prov.cart[index]);
                          }
                        ),
                      );
                    }
                  )
                ),
                //shows the total amount
                Text("Total: ${prov.getTotal()}"),
                //button for resetting
                TextButton(
                  child: const Text("Reset"),
                  onPressed: () 
                  {
                  prov.removeAll();
                  },
                ),
                //button for checking out
                TextButton(
                  child: const Text("Checkout"),
                  onPressed: () {
                  Navigator.pushNamed(context, "/checkout");
                  },
                )
              ],
            );
          },
        )
      ),
    );
  }
}