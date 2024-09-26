// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/cart_provider.dart';
import 'presentation/product_overview_screen.dart';
import 'presentation/cart_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Warenkorb App",
      initialRoute: "/",
      routes: {
        "/": (context) => ProductOverviewScreen(),
        "/cart": (context) => const CartScreen(),
      },
    );
  }
}
