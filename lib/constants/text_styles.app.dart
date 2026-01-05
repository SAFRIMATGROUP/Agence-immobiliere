import 'package:flutter/material.dart';
import 'colors.app.dart';

class AppTextStyles {
  // --- Typography ---
  static const String playfairDisplay = 'Playfair Display';
  static const String lato = 'Lato';

  // --- SECTION TITLES ---
  static const TextStyle sectionTitle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Color(0xFF0F172A),
    fontFamily: playfairDisplay,
    height: 1.2,
  );

  // --- BODY TEXT ---
  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: Colors.grey,
    fontFamily: lato,
    height: 1.6,
  );

  // --- CARD TITLES ---
  static const TextStyle cardTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color(0xFF0F172A),
    fontFamily: playfairDisplay,
    height: 1.2,
  );

  // --- BUTTONS ---
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.background,
    fontFamily: lato,
  );

  // --- HEADINGS ---
  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color(0xFF0F172A),
    fontFamily: playfairDisplay,
    height: 1.3,
  );

  // --- CAPTIONS ---
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: Colors.grey,
    fontFamily: lato,
    height: 1.4,
  );
}
