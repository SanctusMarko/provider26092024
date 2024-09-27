// lib/presentation/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/cart_provider.dart'; // Import für den Warenkorb Provider

// Der Bildschirm für den Warenkorb
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ruft die Instanz des CartProviders ab, um auf die Warenkorbdaten zuzugreifen
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Warenkorb"), // Titel der AppBar für den Warenkorb-Bildschirm
      ),
      body: Column(
        children: [
          // Der Hauptteil des Bildschirms, der die Liste der Warenkorb-Artikel anzeigt
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider
                  .cartItems.length, // Anzahl der Artikel im Warenkorb
              itemBuilder: (context, index) {
                // Holt das aktuelle Produkt und die Menge aus dem Warenkorb
                final product = cartProvider.cartItems.keys.toList()[index];
                final quantity = cartProvider.cartItems.values.toList()[index];

                // Baut eine ListTile für jedes Produkt im Warenkorb
                return ListTile(
                  title: Text(product.title), // Zeigt den Titel des Produkts an
                  subtitle: Text(
                      "Menge: $quantity - ${product.price.toStringAsFixed(2)} €"), // Zeigt die Menge und den Preis des Produkts an
                  trailing: IconButton(
                    icon: const Icon(
                        Icons.delete), // Icon zum Entfernen des Produkts
                    onPressed: () {
                      // Entfernt ein Produkt oder reduziert seine Menge im Warenkorb
                      cartProvider.removeFromCart(product);
                    },
                  ),
                );
              },
            ),
          ),
          // Zeigt den Gesamtpreis des Warenkorbs an, im unteren Bereich des Bildschirms
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 20.0), // Padding oben und unten
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(
                    16.0), // Padding um den Text mit dem Gesamtpreis
                child: Text(
                    "Gesamtpreis: ${cartProvider.totalPrice.toStringAsFixed(2)} €", // Text zeigt den Gesamtpreis des Warenkorbs
                    style: const TextStyle(
                        fontSize: 18)), // Stil des Textes: Schriftgröße 18
              ),
            ),
          ),
        ],
      ),
    );
  }
}
