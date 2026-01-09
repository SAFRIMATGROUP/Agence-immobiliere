import 'package:flutter/material.dart';
import '../../../widgets/custom_text.dart';

class OurProcessSection extends StatelessWidget {
  const OurProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF5F5F5),
      child: Center(
        child: SizedBox(
          width: size.width * 0.6,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Column(
              children: [
                // Header
                const CustomText(
                  text: 'NOTRE PROCESSUS',
                  type: CustomTextType.sectionTagline,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const CustomText(
                  text: 'Comment Ça Marche',
                  type: CustomTextType.sectionTitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 80),

                // Timeline
                LayoutBuilder(
                  builder: (context, constraints) {
                    final stepWidth = constraints.maxWidth / 4;
                    return Stack(
                      children: [
                        Positioned(
                          top: 30,
                          left: stepWidth / 2,
                          right: stepWidth / 2,
                          child: Container(
                            height: 1,
                            color: const Color(0xFFE2E8F0),
                          ),
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildStep(
                              '01',
                              'Évaluation',
                              'Analyse gratuite de votre bien et estimation du loyer optimal',
                            ),
                            _buildStep(
                              '02',
                              'Mise en Location',
                              'Création de l\'annonce, visites et sélection rigoureuse des locataires',
                            ),
                            _buildStep(
                              '03',
                              'Gestion Quotidienne',
                              'Encaissement des loyers, suivi technique et relation locataire',
                            ),
                            _buildStep(
                              '04',
                              'Reporting',
                              'Compte-rendus réguliers et transparence totale sur la gestion',
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStep(String number, String title, String description) {
    return Expanded(
      child: Column(
        children: [
          // Circle with Number
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Color(0xFFDAA520),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: CustomText(
              text: number,
              type: CustomTextType.label,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 24),

          CustomText(
            text: title,
            type: CustomTextType.cardTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomText(
              text: description,
              type: CustomTextType.sectionDescriptionBlack,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
