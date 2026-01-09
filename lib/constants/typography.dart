import 'package:flutter/material.dart';
import 'colors.dart';

// Typography avec styles Flutter par défaut (sans GoogleFonts)
class AppTypography {
  // --- SEMANTIC STYLES (User Defined Standard) ---

  // Taglines (Small, Uppercase/Spaced, Gold)
  static const TextStyle sectionTagline = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Colors.white, // Gold
    letterSpacing: 1.5,
  );

  static const TextStyle sectionTaglinePrimary = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: AppColors.primary, // Gold
    letterSpacing: 1.5,
  );

  // Hero Headers (Huge, Serif, White) - "heroTitle"
  static const TextStyle heroTitle = TextStyle(
    fontFamily: 'Playfair Display',
    fontWeight: FontWeight.bold,
    fontSize: 56,
    color: Colors.white,
    height: 1.2,
  );

  // Section Headers (Large, Serif, Dark Blue) - "sectionTitle"
  static const TextStyle sectionTitle = TextStyle(
    fontFamily: 'Playfair Display',
    fontWeight: FontWeight.bold,
    fontSize: 36,
    color: Color(0xFF0F172A), // Dark Blue
    height: 1.2,
  );

  // Card Headers / Subtitles (Medium, Serif, Dark Blue) - "cardTitle"
  static const TextStyle cardTitle = TextStyle(
    fontFamily: 'Playfair Display',
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: Color(0xFF0F172A),
    height: 1.2,
  );

  // Body Text / Descriptions (Regular, Sans-Serif, Slate/Grey)
  static const TextStyle sectionDescription = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Colors.white, // Modified by user to be white
    height: 1.5,
  );

  static const TextStyle sectionDescriptionBlack = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Colors.black, // Original Slate 500 for light backgrounds
    height: 1.5,
  );

  // Buttons (Bold, Medium size)
  static const TextStyle button = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Colors.white, // Default can be overridden
  );

  static const TextStyle buttonBlack = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Colors.black, // Default can be overridden
  );

  // Labels (Inputs, Small headings)
  static const TextStyle label = TextStyle(
    fontFamily: 'Lato',
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: Color(0xFF0F172A),
  );
}
