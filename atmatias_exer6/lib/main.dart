import "package:flutter/material.dart";
import "package:provider/provider.dart";

//import packages
import "provider/ShoppingCart.dart";
import "pages/Checkout.dart";
import "pages/MyCart.dart";
import "pages/MyCatalog.dart";

//starts the app
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShoppingCart())
      ], 
      child: const MyApp(),
    )
  );
}

//root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //defines the pages that will be displayed based on the nav route
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          return MaterialPageRoute(builder: (context) => const MyCatalog());
        }
        else if (settings.name == "/cart") {
          return MaterialPageRoute(builder: (context) => const MyCart());
        } 
        else if (settings.name == "/checkout") {
          return MaterialPageRoute(builder: (context) => const Checkout());
        }
      },
    );
  }
}
