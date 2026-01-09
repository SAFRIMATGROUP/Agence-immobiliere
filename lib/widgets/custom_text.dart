import 'package:flutter/material.dart';
import '../constants/typography.dart';

enum CustomTextType {
  heroTitle,
  sectionTitle,
  cardTitle,
  sectionDescription,
  sectionDescriptionBlack,
  sectionTagline,
  label,
  button,
  buttonBlack,
  sectionTaglinePrimary,
}

class CustomText extends StatelessWidget {
  final String text;
  final CustomTextType type;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomText({
    Key? key,
    required this.text,
    required this.type,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.textAlign,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _getTextStyle(),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  TextStyle _getTextStyle() {
    switch (type) {
      case CustomTextType.heroTitle:
        return AppTypography.heroTitle.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        );
      case CustomTextType.sectionTitle:
        return AppTypography.sectionTitle.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        );
      case CustomTextType.cardTitle:
        return AppTypography.cardTitle.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        );
      case CustomTextType.sectionDescription:
        return AppTypography.sectionDescription.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        );
      case CustomTextType.sectionDescriptionBlack:
        return AppTypography.sectionDescriptionBlack.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        );
      case CustomTextType.sectionTagline:
        return AppTypography.sectionTagline.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        );

      case CustomTextType.sectionTaglinePrimary:
        return AppTypography.sectionTaglinePrimary.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        );
      case CustomTextType.label:
        return AppTypography.label.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        );
      case CustomTextType.button:
        return AppTypography.button.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        );
      case CustomTextType.buttonBlack:
        return AppTypography.buttonBlack.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        );
    }
  }
}
