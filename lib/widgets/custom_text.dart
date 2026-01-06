import 'package:flutter/material.dart';
import '../constants/typography.dart'; // Assure-toi que ce fichier contient bien ta classe AppTypography

// 1. DÉFINITION DE L'ENUM
enum CustomTextType {
  hero,           // Titres principaux hero
  heroBlack,      // Titres principaux hero noir
  section,        // Titres de section
  sectionBlack,   // Sections avec texte noir
  subtitle,       // Sous-titres
  subtitleWhite,  // Sous-titres blanc
  body,           // Texte de corps
  bodyWhite,      // Texte de corps blanc
  description,    // Descriptions
  descriptionWhite, // Descriptions blanches
  statsNumber,    // Nombres statistiques
  statsNumberBlack, // Nombres statistiques noirs
  statsLabel,     // Labels statistiques
  statsLabelBlack, // Labels statistiques noirs
  navText,        // Texte navigation
  navTextBlack,   // Texte navigation noir
  button,         // Boutons
  buttonWhite,    // Boutons blancs
  textWhite,      // Texte blanc
  caption,        // Légendes
  captionBlack,   // Légendes noires
}



class CustomText extends StatelessWidget {
  final String text;
  final CustomTextType type; 
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomText({
    super.key,
    required this.text,
    required this.type,
    this.color,
    this.fontSize,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle style = _getTextStyle();
    
    if (fontSize != null) style = style.copyWith(fontSize: fontSize);
    if (color != null) style = style.copyWith(color: color);

    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  TextStyle _getTextStyle() {
    switch (type) {
      case CustomTextType.hero:
        return AppTypography.sectionTitle.copyWith(
          fontSize: 56,
          fontWeight: FontWeight.bold,
          height: 1.2,
          color: Colors.white,
        );
      case CustomTextType.heroBlack:
        return AppTypography.sectionTitle.copyWith(
          fontSize: 56,
          fontWeight: FontWeight.bold,
          height: 1.2,
          color: Colors.black,
        );
      case CustomTextType.section:
        return AppTypography.sectionTitle;
      case CustomTextType.sectionBlack:
        return AppTypography.sectionTitle; // Vérifie si tu veux changer la couleur ici par défaut
      case CustomTextType.subtitle:
        return AppTypography.sectionSubtitle;
      case CustomTextType.subtitleWhite:
        return AppTypography.sectionSubtitle.copyWith(color: Colors.white);
      case CustomTextType.body:
        return AppTypography.sectionDescription;
      case CustomTextType.bodyWhite:
        return AppTypography.sectionDescription.copyWith(color: Colors.white);
      case CustomTextType.description:
        return AppTypography.cardSectionDescription;
      case CustomTextType.descriptionWhite:
        return AppTypography.cardSectionDescription.copyWith(color: Colors.white);
      case CustomTextType.statsNumber:
        return AppTypography.cardSectionTitle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        );
      case CustomTextType.statsNumberBlack:
        return AppTypography.cardSectionTitle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        );
      case CustomTextType.statsLabel:
        return AppTypography.cardSectionButton.copyWith(color: Colors.white);
      case CustomTextType.statsLabelBlack:
        return AppTypography.cardSectionButton.copyWith(color: Colors.black);
      case CustomTextType.navText:
        return AppTypography.navText;
      case CustomTextType.navTextBlack:
        return AppTypography.navText.copyWith(color: Colors.black);
      case CustomTextType.button:
        return AppTypography.buttonText;
      case CustomTextType.buttonWhite:
        return AppTypography.navButton.copyWith(color: Colors.white);
      case CustomTextType.textWhite:
        return AppTypography.cardSectionButton.copyWith(color: Colors.white);
      case CustomTextType.caption:
        return AppTypography.cardSectionButton.copyWith(fontSize: 14);
      case CustomTextType.captionBlack:
        return AppTypography.cardSectionButton.copyWith(
          fontSize: 14,
          color: Colors.black54,
        );
    }
  }
}