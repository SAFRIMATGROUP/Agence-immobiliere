import 'package:flutter/material.dart';
import '../../widgets/custom_text.dart';

class OurPartnersSection extends StatelessWidget {
  const OurPartnersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final List<String> partners = [
      'BNP Paribas',
      'Crédit Agricole',
      'Société Générale',
      'LCL',
      'BRED',
    ];

    return Container(
      width: double.infinity,
      color: const Color(0xFFF9F9F9), // Same as Our Solutions
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Center(
        child: SizedBox(
          width: size.width * 0.6, // Standard width like other sections
          child: Column(
            children: [
              const CustomText(
                text: "NOS PARTENAIRES",
                type: CustomTextType.sectionTagline,
              ),
              const SizedBox(height: 16),
              const CustomText(
                text: "Ils Nous Font Confiance",
                type: CustomTextType.sectionTitle,
                color: Color(0xFF0F172A), // Dark Blue
              ),
              const SizedBox(height: 60),

              // Partners Row
              // Using Wrap for responsiveness, though Row is shown in image
              Wrap(
                spacing: 40,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: partners.map((partner) {
                  return Text(
                    partner,
                    style: const TextStyle(
                      fontFamily:
                          'Playfair Display', // Serif font like in the image
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(
                        0xFF94A3B8,
                      ), // Slate 400 - Greyish distinct color
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
