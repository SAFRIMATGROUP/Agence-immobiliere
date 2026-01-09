import 'package:flutter/material.dart';
import '../../widgets/custom_text.dart';

class ReadyToMeetUsSection extends StatelessWidget {
  const ReadyToMeetUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFDAA520), // Gold background
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Center(
        child: Column(
          children: [
            const CustomText(
              text: 'Prêt à Nous Rencontrer ?',
              type: CustomTextType.sectionTitle,
              fontSize: 36,
              color: Color(0xFF0F172A), // Dark blue like in the image
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            const SizedBox(
              width: 600,
              child: CustomText(
                text:
                    'Venez découvrir notre équipe et discuter de votre projet immobilier. Nous serons ravis de vous accueillir.',
                type: CustomTextType.sectionDescriptionBlack,
                color: Color(0xFF0F172A), // Dark blue/Black
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/contact');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(
                  0xFF0F172A,
                ), // Dark button background
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: 'Nous Contacter',
                    type: CustomTextType.button,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  SizedBox(width: 12),
                  Icon(
                    Icons.arrow_forward_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
