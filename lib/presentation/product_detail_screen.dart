// lib/presentation/product_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider26092024/presentation/custom_button.dart';
import '../../domain/product.dart';
import '../../data/cart_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    // Koristimo istu boju za AppBar i Scaffold
    const backgroundColor = Color(0xFF36393B); // Definiramo tamnu pozadinu

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor, // Tamna pozadina AppBar-a
        title: Text(product.title),
      ),
      backgroundColor: backgroundColor, // Tamna pozadina Scaffold-a
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.title, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text(product.description),
            const SizedBox(height: 10),
            Text("Preis: ${product.price.toStringAsFixed(2)} €"),
            const SizedBox(height: 10),
            Text("Verfügbarkeit: ${product.availability}"),
            const Spacer(),
            Center(
              child: CustomPressedInButton(
                icon: Icons.shopping_cart,
                label: "In den Warenkorb",
                onPressed: () {
                  cartProvider.addToCart(product);
                },
                backgroundColor: const Color(0xFF36393B), // Tamna siva za gumb
                textColor: Colors.grey, // Siva boja teksta
                iconColor: Colors.blue, // Plava ikona
                borderRadius: 30,
                iconPosition: IconPosition.left,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
