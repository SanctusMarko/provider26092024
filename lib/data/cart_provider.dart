// lib/data/cart_provider.dart
import 'package:flutter/material.dart';
import '../domain/product.dart'; // Import für das Produkt-Modell

// CartProvider Klasse, die den Zustand des Warenkorbs verwaltet
class CartProvider with ChangeNotifier {
  // Eine Map, die die Produkte und ihre jeweilige Menge im Warenkorb speichert
  final Map<Product, int> _cartItems = {};

  // Getter, um den Inhalt des Warenkorbs nach außen zugänglich zu machen
  Map<Product, int> get cartItems => _cartItems;

  // Methode, um ein Produkt zum Warenkorb hinzuzufügen
  void addToCart(Product product) {
    if (product.availability > 0) {
      // Wenn das Produkt bereits im Warenkorb ist, erhöhe die Menge
      if (_cartItems.containsKey(product)) {
        _cartItems[product] = _cartItems[product]! + 1;
      } else {
        // Wenn das Produkt nicht im Warenkorb ist, füge es mit einer Menge von 1 hinzu
        _cartItems[product] = 1;
      }
      // Verringere die Verfügbarkeit des Produkts
      product.availability--;
      notifyListeners(); // Benachrichtigt alle listeners über die Änderung im Warenkorb
    }
  }

  // Methode, um ein Produkt aus dem Warenkorb zu entfernen
  void removeFromCart(Product product) {
    if (_cartItems.containsKey(product)) {
      if (_cartItems[product]! > 1) {
        // Wenn mehr als ein Produkt vorhanden ist, verringere die Menge
        _cartItems[product] = _cartItems[product]! - 1;
      } else {
        // Wenn nur ein Produkt vorhanden ist, entferne es aus dem Warenkorb
        _cartItems.remove(product);
      }
      // Erhöhe die Verfügbarkeit des Produkts
      product.availability++;
      notifyListeners(); // Benachrichtigt alle Listeners über die Änderung im Warenkorb
    }
  }

  // Methode, um den Gesamtpreis des Warenkorbs zu berechnen
  double get totalPrice {
    double total = 0.0;
    // Schleife über alle Produkte im Warenkorb und summiere die Preise. Preis * Menge
    _cartItems.forEach((product, quantity) {
      total += product.price * quantity;
    });
    return total;
  }
}
