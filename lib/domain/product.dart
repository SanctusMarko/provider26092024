// lib/domain/product.dart

// Die Produktklasse, die die Eigenschaften eines Produkts definiert
class Product {
  final String title; // Der Titel des Produkts
  final String description; // Die Beschreibung des Produkts
  final double price; // Der Preis des Produkts
  int availability; // Die Verfügbarkeit des Produkts (Anzahl auf Lager)

  // Konstruktor der Produktklasse, der alle notwendigen Eigenschaften erfordert
  Product({
    required this.title, // Titel muss beim Erstellen des Produkts angegeben werden
    required this.description, // Beschreibung muss beim Erstellen des Produkts angegeben werden
    required this.price, // Preis muss beim Erstellen des Produkts angegeben werden
    required this.availability, // Verfügbarkeit muss beim Erstellen des Produkts angegeben werden
  });
}
