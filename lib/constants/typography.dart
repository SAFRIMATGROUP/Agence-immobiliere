import 'package:flutter/material.dart';

// Typography avec styles Flutter par défaut (sans GoogleFonts)
class AppTypography {
  // Styles pour les titres de sections
  static const TextStyle sectionTitle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    height: 1.3,
    color: Colors.black,
  );

  static const TextStyle sectionSubtitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 1.3,
    color: Colors.black,
  );

  static const TextStyle sectionDescription = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: Colors.black87,
  );

  // Styles pour les cartes
  static const TextStyle cardSectionTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: Colors.black,
  );

  static const TextStyle cardSectionDescription = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: Colors.black54,
  );

  static const TextStyle cardSectionButton = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w100,
    color: Colors.black,
  );

  // Styles pour les statistiques
  static const TextStyle statsNumber = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.2,
    color: Colors.white,
  );

  static const TextStyle statsLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.3,
    color: Colors.white,
  );

  // Styles pour les boutons
  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 1.2,
    color: Colors.black,
  );

  // Styles pour la navbar
  static const TextStyle navText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  static const TextStyle navButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );

  // Méthode pour appliquer une couleur personnalisée
  static TextStyle withColor(TextStyle baseStyle, Color color) {
    return baseStyle.copyWith(color: color);
  }

  // Méthode pour appliquer une taille personnalisée
  static TextStyle withSize(TextStyle baseStyle, double fontSize) {
    return baseStyle.copyWith(fontSize: fontSize);
  }
}
