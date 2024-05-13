import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:atmatias_exer6/provider/ShoppingCart.dart";

//this code is for completing the checkout process
class Checkout extends StatelessWidget {
  const Checkout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout"),),
      body: Center(
        child: Consumer<ShoppingCart>(
          builder: (context, prov, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Item Details"),
                Expanded(
                  //if cart is empty, display "no items to checkout"
                  //however if cart is not empty, display items
                  //this is similar to shopping cart
                  child: prov.cart.isEmpty 
                  ? const Text("No items to checkout!")
                  : ListView.builder(
                    itemCount: prov.cart.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.star),
                        title: Text(prov.cart[index].name),
                        trailing: Text(""),
                      );
                    }
                  )
                ),
                //if cart is empty, display nothing, but if cart has items, display total cost, and payment button
                (prov.cart.isEmpty) ? Text("") 
                //payment button
                : TextButton(
                  child: const Text("Checkout Payment"),
                  onPressed: () {
                    prov.removeAll();
                    Navigator.pushNamed(context, "/");
                    const snackBar = SnackBar(
                      content: Text("Payment Successful!"),
                    );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ), 
                  //displays total cost
                  Text("Total Cost: ${prov.getTotal()}")
              ],
            );
          },
        )
      )
    );
  }
}