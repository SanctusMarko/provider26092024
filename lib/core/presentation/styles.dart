// lib/core/presentation/styles.dart
import 'package:flutter/material.dart';

// Boje
const Color backgroundColor = Color(0xFF36393B); // Tamna pozadina
const Color textColor = Color(0xFF7C7C7A); // Boja teksta
const Color buttonTextColor = Color(0xFF908E7F); // Boja teksta na dugmetima
const Color borderColor = Color.fromARGB(255, 10, 158, 255); // Plavi obrub
const Color titleColor = Color(0xFF7C7C7A); // Boja naslova
const Color inputFieldColor =
    Color.fromRGBO(217, 217, 217, 1); // Boja za input polja

// Tema aplikacije
final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: backgroundColor, // Boja pozadine aplikacije
  primaryColor: backgroundColor, // Primarna boja
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: backgroundColor,
    secondary: borderColor, // Sekundarna boja za akcente
    error: Colors.red, // Boja za greške
    surface: backgroundColor, // Površina koja koristi tamnu boju
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: backgroundColor, // Tamna pozadina za AppBar
    titleTextStyle: TextStyle(
      color: titleColor, // Boja naslova
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: titleColor, // Boja za velike naslove
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: textColor, // Boja za tijelo teksta
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: borderColor, // Plava boja za dugmad
      foregroundColor: buttonTextColor, // Svijetlija boja za tekst na dugmetima
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: inputFieldColor, // Boja za input polja
    filled: true,
    border: OutlineInputBorder(),
  ),
);
