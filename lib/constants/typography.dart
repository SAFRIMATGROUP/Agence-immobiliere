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

  // Styles avec Serif (Playfair Display)
  static const TextStyle serifTitle = TextStyle(
    fontFamily: 'Playfair Display',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Color(0xFF0C1D36),
    height: 1.2,
  );

  static const TextStyle serifSection = TextStyle(
    fontFamily: 'Playfair Display',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color(0xFF0C1D36),
    height: 1.3,
  );

  static const TextStyle serifSubtitle = TextStyle(
    fontFamily: 'serif',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.3,
  );

  static const TextStyle priceText = TextStyle(
    fontFamily: 'Playfair Display',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Color(0xFFD4A017),
    height: 1.2,
  );

  // Styles pour la navbar
  static const TextStyle navText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  static const TextStyle navTextBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    height: 1.2,
  );

  static const TextStyle navButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );

  // --- HOME PAGE STYLES ---

  // Hero Section
  static const TextStyle homeHeroTagline = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    height: 1.2,
  );

  static const TextStyle homeHeroTitle = TextStyle(
    fontSize: 56,
    fontWeight: FontWeight.bold,
    height: 1.2,
    color: Colors.white,
    shadows: [
      Shadow(offset: Offset(0, 2), blurRadius: 4, color: Colors.black45),
    ],
  );

  static const TextStyle homeHeroDescription = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    height: 1.5,
  );

  static const TextStyle homeHeroButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.2,
  );

  static const TextStyle homeHeroButtonOutline = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    height: 1.2,
  );

  // Search Section
  static const TextStyle searchDropdownNormal = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static const TextStyle searchDropdownSelected = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle searchButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors
        .black, // Default color, usually overridden explicitly if needed or context based
  );

  // Statistics Section
  static const TextStyle homeStatNumber = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: Color(
      0xFFD4A017,
    ), // AppColors.primary (hardcoded to avoid import loop if needed, or use const)
    height: 1.0,
  );

  static const TextStyle homeStatLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white70,
    height: 1.4,
  );

  // Property Cards
  static const TextStyle propertyStatusBadge = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle propertyFeaturedBadge = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle propertyPriceOverlay = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'serif',
    color: Colors.white,
    shadows: [Shadow(offset: Offset(0, 1), blurRadius: 2, color: Colors.black)],
  );

  // --- EXPERTISE SECTION STYLES ---
  static const TextStyle expertiseTagline = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.3,
  );

  static const TextStyle expertiseTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.3,
  );

  static const TextStyle expertiseDescription = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
    height: 1.4,
  );

  static const TextStyle expertiseCardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color(
      0xFF0F172A,
    ), // Default color, handles hover logic in widget if needed or via separate type
  );

  static const TextStyle expertiseCardDescription = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black54,
    height: 1.5,
  );

  static const TextStyle expertiseCardLearnMore = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Color(0xFFD4A017), // AppColors.primary
  );

  // --- WHY CHOOSE US SECTION STYLES ---
  static const TextStyle whyChooseUsTagline = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5,
    fontSize: 14,
  );

  static const TextStyle whyChooseUsTitle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'Serif',
  );

  static const TextStyle whyChooseUsButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black, // Assuming button text is black on white button
  );

  static const TextStyle featureCardTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    height: 1.2,
  );

  static const TextStyle featureCardDescription = TextStyle(
    fontSize: 14,
    color: Colors.white70,
    height: 1.6,
  );

  // --- TESTIMONIALS SECTION STYLES ---
  static const TextStyle testimonialTagline = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Color(0xFFD4A017), // AppColors.primary
  );

  static const TextStyle testimonialTitle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle testimonialQuote = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.black87, // Assuming body color
    height: 1.5,
  );

  static const TextStyle testimonialName = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle testimonialRole = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.grey, // Assuming grey color
  );

  // --- READY TO BEGIN SECTION STYLES ---
  static const TextStyle readyToBeginTitle = TextStyle(
    fontSize: 56, // Same as Hero
    fontWeight: FontWeight.bold,
    height: 1.2,
    color: Colors.white,
  );

  static const TextStyle readyToBeginDescription = TextStyle(
    fontSize: 16, // Or 18 depending on design
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle readyToBeginButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // --- FOOTER STYLES ---
  static const TextStyle footerLogoText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Color(0xFF1A3263),
  );

  static const TextStyle footerBrandName = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle footerDescription = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle footerColumnTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle footerLink = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle footerCopyright = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  // --- REAL ESTATE PAGE STYLES ---
  static const TextStyle realEstateHeroTitle = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: Colors.white, // AppColors.secondary
  );

  static const TextStyle realEstateHeroBody = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    height: 1.5,
  );

  static const TextStyle filterButtonText = TextStyle(
    fontSize: 14, // Implicit default
    fontWeight: FontWeight.w500, // Medium? Or normal
    color: Colors
        .black, // Or grey depending on state, handled by widget logic usually, but base style here
  );

  static const TextStyle filterLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static const TextStyle filterValue = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const TextStyle searchHint = TextStyle(
    fontSize: 16,
    color: Colors.grey, // shade500
  );

  static const TextStyle dropdownItem = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static const TextStyle dropdownSelected = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle dropdownValue = TextStyle(
    fontSize: 14,
    color: Colors.black,
  );

  static const TextStyle resultsCount = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black87, // body color
  );

  static const TextStyle cardStatusText = TextStyle(
    color: Colors.white,
    fontSize: 10,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle cardFeaturedText = TextStyle(
    color: Colors.black,
    fontSize: 10,
    fontWeight: FontWeight.bold,
  );

  // Note: Reuse propertyPriceOverlay for cardPrice if identical,
  // but real_estate.dart has specific shadows and serif font.
  // Let's ensure propertyPriceOverlay matches or create a specific one if different.
  // Real Estate Page uses fontSize 20. Home Page might use different.
  // Let's define specific to be safe and strictly standardized.
  static const TextStyle cardPrice = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'Serif',
    shadows: [Shadow(offset: Offset(0, 1), blurRadius: 2, color: Colors.black)],
  );

  // --- RENTAL PROPERTY PAGE STYLES ---
  static const TextStyle rentalHeroTagline = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Color(0xFFDAA520), // Gold/Amber similar to image
    letterSpacing: 1.2,
  );

  static const TextStyle rentalHeroTitle = TextStyle(
    fontSize: 56,
    fontWeight: FontWeight.bold,
    fontFamily: 'Playfair Display', // Serif font as seen in image
    color: Colors.white,
    height: 1.2,
  );

  static const TextStyle rentalHeroDescription = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.white70, // Slightly transparent white for description
    height: 1.5,
  );

  static const TextStyle rentalServiceTagline = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Color(0xFFDAA520), // Gold
    letterSpacing: 1.2,
  );

  static const TextStyle rentalServiceTitle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    fontFamily: 'Playfair Display',
    color: Color(0xFF0F172A), // Dark Blue
    height: 1.2,
  );

  static const TextStyle rentalServiceSubtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black54,
    height: 1.5,
  );

  static const TextStyle rentalCardTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'Playfair Display',
    color: Color(0xFF0F172A),
    height: 1.2,
  );

  static const TextStyle rentalCardDescription = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black54,
    height: 1.5,
  );

  static const TextStyle rentalProcessTagline = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Color(0xFFDAA520),
    letterSpacing: 1.2,
  );

  static const TextStyle rentalProcessTitle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    fontFamily: 'Playfair Display',
    color: Color(0xFF0F172A),
    height: 1.2,
  );

  static const TextStyle rentalProcessNumber = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color(0xFF0F172A),
    fontFamily: 'Playfair Display',
  );

  static const TextStyle rentalProcessStepTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'Playfair Display',
    color: Color(0xFF0F172A),
    height: 1.2,
  );

  static const TextStyle rentalProcessStepDescription = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Colors.black54,
    height: 1.5,
  );

  // --- YOUR ADVANTAGE SECTION STYLES ---
  static const TextStyle yourAdvantageTagline = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Color(0xFFDAA520), // Gold
    letterSpacing: 1.2,
  );

  static const TextStyle yourAdvantageTitle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    fontFamily: 'Playfair Display',
    color: Colors.white,
    height: 1.2,
  );

  static const TextStyle yourAdvantageDescription = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
    height: 1.5,
  );

  static const TextStyle yourAdvantageItem = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    height: 1.3,
  );

  static const TextStyle yourAdvantageCardTitle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Color(0xFF0F172A),
    height: 1.0,
  );

  static const TextStyle yourAdvantageCardSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xFF0F172A),
    height: 1.2,
  );

  // --- READY TO DELEGATE SECTION STYLES ---
  static const TextStyle readyDelegateTagline = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Color(0xFFDAA520), // Gold
    letterSpacing: 1.2,
  );

  static const TextStyle readyDelegateTitle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    fontFamily: 'Playfair Display',
    color: Color(0xFF0F172A),
    height: 1.2,
  );

  static const TextStyle readyDelegateDescription = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black54,
    height: 1.5,
  );

  static const TextStyle readyDelegateFeatureTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Playfair Display',
    color: Color(0xFF0F172A),
  );

  static const TextStyle readyDelegateFeatureSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black54,
  );

  static const TextStyle readyDelegateFormTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'Playfair Display',
    color: Color(0xFF0F172A),
  );

  static const TextStyle readyDelegateFormLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xFF0F172A),
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
