// lib/presentation/product_overview_screen.dart
import 'package:flutter/material.dart';
import '../../domain/product.dart';
import 'product_detail_screen.dart';

// Bildschirm zur Produktübersicht
class ProductOverviewScreen extends StatelessWidget {
  ProductOverviewScreen({super.key});

  // Eine Liste von Produkten. Diese könnte auch von einem Service oder einer API stammen anstatt hier fest kodiert zu sein.
  final List<Product> products = [
    Product(
        title: 'Mackbook Pro', // Name des Produkts
        description: 'Leistungsstarker Laptop', // Beschreibung des Produkts
        price: 2400.00, // Preis des Produkts
        availability: 10), // Verfügbare Stückzahl des Produkts
    Product(
        title: 'Iphone 16 Pro Max',
        description: 'High-End Smartphone',
        price: 1449.00,
        availability: 10),
    Product(
        title: 'Kopfhörer',
        description: 'Geräuschunterdrückende Kopfhörer',
        price: 199.99,
        availability: 10),
    Product(
        title: 'Monitor',
        description: '4K Monitor',
        price: 399.99,
        availability: 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produkte"), // text in der AppBar
        actions: [
          // Schaltfläche für den Warenkorb oben rechts
          IconButton(
            icon: const Icon(Icons.shopping_cart), // Warenkorb-Icon
            onPressed: () {
              Navigator.pushNamed(
                  context, "/cart"); // Navigation zur Warenkorbseite
            },
          ),
        ],
      ),
      // Hauptteil des Bildschirms eine Liste von Produkten
      body: ListView.builder(
        itemCount: products.length, // Anzahl der Produkte in der Liste
        itemBuilder: (context, index) {
          // Baut für jedes Produkt in der Liste einen ListTile
          return ListTile(
            title: Text(products[index].title), // Titel des Produkts
            subtitle: Text(
                "${products[index].price.toStringAsFixed(2)} €"), // Preis des Produkts formatiert auf zwei Dezimalstellen
            onTap: () {
              // Navigation zur Detailseite des Produkts bei Auswahl
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                      product: products[
                          index]), // Übergibt das ausgewählte Produkt an die Detailseite
                ),
              );
            },
          );
        },
      ),
    );
  }
}
