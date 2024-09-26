// lib/presentation/product_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/product.dart';
import '../../data/cart_provider.dart';

// Bildschirm für Produktdetails
class ProductDetailScreen extends StatelessWidget {
  final Product product; // Das Produkt, dessen Details angezeigt werden

  const ProductDetailScreen(
      {super.key,
      required this.product}); // Konstruktor, das Produkt muss übergeben werden

  @override
  Widget build(BuildContext context) {
    // Ruft die Instanz des CartProviders ab, um das Produkt zum Warenkorb hinzuzufügen
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        // Titel der AppBar wird auf den Produktnamen gesetzt
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding um den gesamten Inhalt
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Richtet den Text am Anfang (links) aus
          children: [
            // Zeigt den Titel des Produkts mit größerer Schriftgröße an
            Text(product.title, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10), // Abstand zwischen den Elementen
            // Zeigt die Beschreibung des Produkts an
            Text(product.description),
            const SizedBox(height: 10),
            // Zeigt den Preis des Produkts an, formatiert auf zwei Dezimalstellen
            Text("Preis: ${product.price.toStringAsFixed(2)} €"),
            const SizedBox(height: 10),
            // Zeigt die Verfügbarkeit des Produkts (wie viele noch verfügbar sind)
            Text("Verfügbarkeit: ${product.availability}"),
            const SizedBox(height: 20),
            // Überprüft, ob das Produkt verfügbar ist. Wenn ja, zeigt die Schaltfläche "In den Warenkorb" an
            if (product.availability > 0)
              ElevatedButton(
                onPressed: () {
                  // Fügt das Produkt dem Warenkorb hinzu, wenn es verfügbar ist
                  cartProvider.addToCart(product);
                },
                child: const Text("In den Warenkorb"),
              )
            // Wenn das Produkt nicht verfügbar ist, zeigt die Nachricht "ausverkauft" in roter Farbe an
            else
              const Text("Produkt ist ausverkauft",
                  style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
