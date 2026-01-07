import 'package:flutter/material.dart';
import '../constants/typography.dart';

enum CustomTextType {
  hero, // Titres principaux hero
  heroBlack, // Titres principaux hero noir
  section, // Titres de section
  sectionBlack, // Sections avec texte noir
  subtitle, // Sous-titres
  subtitleWhite, // Sous-titres blanc
  body, // Texte de corps
  bodyWhite, // Texte de corps blanc
  description, // Descriptions
  descriptionWhite, // Descriptions blanches
  statsNumber, // Nombres statistiques
  statsNumberBlack, // Nombres statistiques noirs
  statsLabel, // Labels statistiques
  statsLabelBlack, // Labels statistiques noirs
  navText, // Texte navigation
  navTextBold, // Texte navigation gras (actif)
  navTextBlack, // Texte navigation noir
  button, // Boutons
  buttonWhite, // Boutons blancs
  textWhite, // Texte blanc
  caption, // Légendes
  captionBlack, // Légendes noires
  serifTitle, // Titres serif (Playfair)
  serifSection, // Sections serif (Playfair)
  serifSubtitle, // Sous-titres serif
  priceText, // Prix en or (Playfair)
  // Home Page Specific Types
  homeHeroTagline,
  homeHeroTitle,
  homeHeroDescription,
  homeHeroButton,
  homeHeroButtonOutline,
  searchDropdownNormal,
  searchDropdownSelected,
  searchButton,
  homeStatNumber,
  homeStatLabel,

  // Real Estate Page Specific Types
  realEstateHeroTitle,
  realEstateHeroBody,
  filterButtonText,
  filterLabel,
  filterValue,
  searchHint,
  dropdownItem,
  dropdownSelected,
  dropdownValue,
  resultsCount,
  cardStatusText,
  cardFeaturedText,
  cardPrice,

  // Rental Property Page Specific Types
  rentalHeroTagline,
  rentalHeroTitle,
  rentalHeroDescription,
  rentalServiceTagline,
  rentalServiceTitle,
  rentalServiceSubtitle,
  rentalCardTitle,
  rentalCardDescription,

  // Rental Process Section
  rentalProcessTagline,
  rentalProcessTitle,
  rentalProcessNumber,
  rentalProcessStepTitle,
  rentalProcessStepDescription,

  // Property Card Specific Types
  propertyStatusBadge,
  propertyFeaturedBadge,
  propertyPriceOverlay,

  // Expertise Section
  expertiseTagline,
  expertiseTitle,
  expertiseDescription,
  expertiseCardTitle,
  expertiseCardDescription,
  expertiseCardLearnMore,

  // Why Choose Us Section
  whyChooseUsTagline,
  whyChooseUsTitle,
  whyChooseUsButton,
  featureCardTitle,
  featureCardDescription,

  // Testimonials Section
  testimonialTagline,
  testimonialTitle,
  testimonialQuote,
  testimonialName,
  testimonialRole,

  // Ready To Begin Section
  readyToBeginTitle,
  readyToBeginDescription,
  readyToBeginButton,
  readyToBeginButtonOutline,

  // Footer Section
  footerLogoText,
  footerBrandName,
  footerDescription,
  footerColumnTitle,
  footerLink,
  footerCopyright,
  // Your Advantage Section
  yourAdvantageTagline,
  yourAdvantageTitle,
  yourAdvantageDescription,
  yourAdvantageItem,
  yourAdvantageCardTitle,
  yourAdvantageCardSubtitle,
  // Ready to Delegate Section
  readyDelegateTagline,
  readyDelegateTitle,
  readyDelegateDescription,
  readyDelegateFeatureTitle,
  readyDelegateFeatureSubtitle,
  readyDelegateFormTitle,
  readyDelegateFormLabel,
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
        return AppTypography.sectionTitle;
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
        return AppTypography.cardSectionDescription.copyWith(
          color: Colors.white,
        );
      case CustomTextType.statsNumber:
        return AppTypography.statsNumber;
      case CustomTextType.statsNumberBlack:
        return AppTypography.statsNumber.copyWith(color: Colors.black);
      case CustomTextType.statsLabel:
        return AppTypography.statsLabel;
      case CustomTextType.statsLabelBlack:
        return AppTypography.statsLabel.copyWith(color: Colors.black);
      case CustomTextType.navText:
        return AppTypography.navText;
      case CustomTextType.navTextBold:
        return AppTypography.navTextBold;
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
      case CustomTextType.serifTitle:
        return AppTypography.serifTitle;
      case CustomTextType.serifSection:
        return AppTypography.serifSection;
      case CustomTextType.serifSubtitle:
        return AppTypography.serifSubtitle;
      case CustomTextType.priceText:
        return AppTypography.priceText;

      // Home Page Mapping
      case CustomTextType.homeHeroTagline:
        return AppTypography.homeHeroTagline;
      case CustomTextType.homeHeroTitle:
        return AppTypography.homeHeroTitle;
      case CustomTextType.homeHeroDescription:
        return AppTypography.homeHeroDescription;
      case CustomTextType.homeHeroButton:
        return AppTypography.homeHeroButton;
      case CustomTextType.homeHeroButtonOutline:
        return AppTypography.homeHeroButtonOutline;
      case CustomTextType.searchDropdownNormal:
        return AppTypography.searchDropdownNormal;
      case CustomTextType.searchDropdownSelected:
        return AppTypography.searchDropdownSelected;
      case CustomTextType.searchButton:
        return AppTypography.searchButton;
      case CustomTextType.homeStatNumber:
        return AppTypography.homeStatNumber;
      case CustomTextType.homeStatLabel:
        return AppTypography.homeStatLabel;

      // Real Estate Page Mapping
      case CustomTextType.realEstateHeroTitle:
        return AppTypography.realEstateHeroTitle;
      case CustomTextType.realEstateHeroBody:
        return AppTypography.realEstateHeroBody;
      case CustomTextType.filterButtonText:
        return AppTypography.filterButtonText;
      case CustomTextType.filterLabel:
        return AppTypography.filterLabel;
      case CustomTextType.filterValue:
        return AppTypography.filterValue;
      case CustomTextType.searchHint:
        return AppTypography.searchHint;
      case CustomTextType.dropdownItem:
        return AppTypography.dropdownItem;
      case CustomTextType.dropdownSelected:
        return AppTypography.dropdownSelected;
      case CustomTextType.dropdownValue:
        return AppTypography.dropdownValue;
      case CustomTextType.resultsCount:
        return AppTypography.resultsCount;
      case CustomTextType.cardStatusText:
        return AppTypography.cardStatusText;
      case CustomTextType.cardFeaturedText:
        return AppTypography.cardFeaturedText;
      case CustomTextType.cardPrice:
        return AppTypography.cardPrice;

      // Rental Property Page Mapping
      case CustomTextType.rentalHeroTagline:
        return AppTypography.rentalHeroTagline;
      case CustomTextType.rentalHeroTitle:
        return AppTypography.rentalHeroTitle;
      case CustomTextType.rentalHeroDescription:
        return AppTypography.rentalHeroDescription;
      case CustomTextType.rentalServiceTagline:
        return AppTypography.rentalServiceTagline;
      case CustomTextType.rentalServiceTitle:
        return AppTypography.rentalServiceTitle;
      case CustomTextType.rentalServiceSubtitle:
        return AppTypography.rentalServiceSubtitle;
      case CustomTextType.rentalCardTitle:
        return AppTypography.rentalCardTitle;
      case CustomTextType.rentalCardDescription:
        return AppTypography.rentalCardDescription;

      // Process Section Mapping
      case CustomTextType.rentalProcessTagline:
        return AppTypography.rentalProcessTagline;
      case CustomTextType.rentalProcessTitle:
        return AppTypography.rentalProcessTitle;
      case CustomTextType.rentalProcessNumber:
        return AppTypography.rentalProcessNumber;
      case CustomTextType.rentalProcessStepTitle:
        return AppTypography.rentalProcessStepTitle;
      case CustomTextType.rentalProcessStepDescription:
        return AppTypography.rentalProcessStepDescription;

      // Property Card Mapping
      case CustomTextType.propertyStatusBadge:
        return AppTypography.propertyStatusBadge;
      case CustomTextType.propertyFeaturedBadge:
        return AppTypography.propertyFeaturedBadge;
      case CustomTextType.propertyPriceOverlay:
        return AppTypography.propertyPriceOverlay;

      // Expertise Section Mapping
      case CustomTextType.expertiseTagline:
        return AppTypography.expertiseTagline;
      case CustomTextType.expertiseTitle:
        return AppTypography.expertiseTitle;
      case CustomTextType.expertiseDescription:
        return AppTypography.expertiseDescription;
      case CustomTextType.expertiseCardTitle:
        return AppTypography.expertiseCardTitle;
      case CustomTextType.expertiseCardDescription:
        return AppTypography.expertiseCardDescription;
      case CustomTextType.expertiseCardLearnMore:
        return AppTypography.expertiseCardLearnMore;

      // Why Choose Us Section Mapping
      case CustomTextType.whyChooseUsTagline:
        return AppTypography.whyChooseUsTagline;
      case CustomTextType.whyChooseUsTitle:
        return AppTypography.whyChooseUsTitle;
      case CustomTextType.whyChooseUsButton:
        return AppTypography.whyChooseUsButton;
      case CustomTextType.featureCardTitle:
        return AppTypography.featureCardTitle;
      case CustomTextType.featureCardDescription:
        return AppTypography.featureCardDescription;

      // Testimonials Section Mapping
      case CustomTextType.testimonialTagline:
        return AppTypography.testimonialTagline;
      case CustomTextType.testimonialTitle:
        return AppTypography.testimonialTitle;
      case CustomTextType.testimonialQuote:
        return AppTypography.testimonialQuote;
      case CustomTextType.testimonialName:
        return AppTypography.testimonialName;
      case CustomTextType.testimonialRole:
        return AppTypography.testimonialRole;

      // Ready To Begin Section Mapping
      case CustomTextType.readyToBeginTitle:
        return AppTypography.readyToBeginTitle;
      case CustomTextType.readyToBeginDescription:
        return AppTypography.readyToBeginDescription;
      case CustomTextType.readyToBeginButton:
        return AppTypography.readyToBeginButton;
      case CustomTextType.readyToBeginButtonOutline:
        // Reuse homeHeroButtonOutline logic or define specific if needed.
        // wait, I defined readyToBeginButtonOutline in enum but not in Typography.
        // Let's use homeHeroButtonOutline or define it. Design usually similar.
        // I'll map it to AppTypography.homeHeroButtonOutline for now to be safe or just standard white outline.
        return AppTypography.homeHeroButtonOutline;

      // Footer Section Mapping
      case CustomTextType.footerLogoText:
        return AppTypography.footerLogoText;
      case CustomTextType.footerBrandName:
        return AppTypography.footerBrandName;
      case CustomTextType.footerDescription:
        return AppTypography.footerDescription;
      case CustomTextType.footerColumnTitle:
        return AppTypography.footerColumnTitle;
      case CustomTextType.footerLink:
        return AppTypography.footerLink;
      case CustomTextType.footerCopyright:
        return AppTypography.footerCopyright;
      // Your Advantage Section Mapping
      case CustomTextType.yourAdvantageTagline:
        return AppTypography.yourAdvantageTagline;
      case CustomTextType.yourAdvantageTitle:
        return AppTypography.yourAdvantageTitle;
      case CustomTextType.yourAdvantageDescription:
        return AppTypography.yourAdvantageDescription;
      case CustomTextType.yourAdvantageItem:
        return AppTypography.yourAdvantageItem;
      case CustomTextType.yourAdvantageCardTitle:
        return AppTypography.yourAdvantageCardTitle;
      case CustomTextType.yourAdvantageCardSubtitle:
        return AppTypography.yourAdvantageCardSubtitle;
      // Ready to Delegate Section Mapping
      case CustomTextType.readyDelegateTagline:
        return AppTypography.readyDelegateTagline;
      case CustomTextType.readyDelegateTitle:
        return AppTypography.readyDelegateTitle;
      case CustomTextType.readyDelegateDescription:
        return AppTypography.readyDelegateDescription;
      case CustomTextType.readyDelegateFeatureTitle:
        return AppTypography.readyDelegateFeatureTitle;
      case CustomTextType.readyDelegateFeatureSubtitle:
        return AppTypography.readyDelegateFeatureSubtitle;
      case CustomTextType.readyDelegateFormTitle:
        return AppTypography.readyDelegateFormTitle;
      case CustomTextType.readyDelegateFormLabel:
        return AppTypography.readyDelegateFormLabel;
    }
  }
}
