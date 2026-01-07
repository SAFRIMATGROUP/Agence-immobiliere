import 'package:flutter/material.dart';
import '../../../widgets/custom_text.dart';

class YourAdvantageSection extends StatelessWidget {
  const YourAdvantageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      color: const Color(0xFF0F172A), // Dark blue background
      child: Center(
        child: SizedBox(
          width: size.width * 0.70,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Row(
              children: [
                // Left Column: Text content
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'VOS AVANTAGES',
                        type: CustomTextType.yourAdvantageTagline,
                      ),
                      const SizedBox(height: 16),
                      const CustomText(
                        text: 'Pourquoi Nous Faire Confiance',
                        type: CustomTextType.yourAdvantageTitle,
                      ),
                      const SizedBox(height: 24),
                      const CustomText(
                        text:
                            'Avec plus de 15 ans d\'expérience en gestion locative, nous vous offrons un service premium et des garanties solides pour protéger votre investissement.',
                        type: CustomTextType.yourAdvantageDescription,
                      ),
                      const SizedBox(height: 48),
                      // Checkmarks Grid
                      Column(
                        children: [
                          _buildAdvantageRow(
                            'Sélection rigoureuse des locataires',
                            'Garantie des loyers impayés',
                          ),
                          const SizedBox(height: 24),
                          _buildAdvantageRow(
                            'Gestion administrative complète',
                            'Entretien et réparations coordonnés',
                          ),
                          const SizedBox(height: 24),
                          _buildAdvantageRow(
                            'Reporting mensuel détaillé',
                            'Assistance juridique incluse',
                          ),
                          const SizedBox(height: 24),
                          _buildAdvantageRow(
                            'Disponibilité 24/7 pour les urgences',
                            'Optimisation fiscale de vos revenus',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 60),
                // Right Column: Image and Floating Card
                Expanded(
                  flex: 1,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Main Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/imagesWeb/hotell.jpg',
                          height: 500,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Floating Card
                      Positioned(
                        bottom: -30,
                        left: -30,
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: const Color(0xFFDAA520), // Gold
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.trending_up,
                                size: 40,
                                color: Color(0xFF0F172A),
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomText(
                                    text: '98%',
                                    type: CustomTextType.yourAdvantageCardTitle,
                                  ),
                                  const CustomText(
                                    text: 'Taux d\'occupation',
                                    type: CustomTextType
                                        .yourAdvantageCardSubtitle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAdvantageRow(String item1, String item2) {
    return Row(
      children: [
        Expanded(child: _buildCheckItem(item1)),
        const SizedBox(width: 24),
        Expanded(child: _buildCheckItem(item2)),
      ],
    );
  }

  Widget _buildCheckItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: Color(0xFFDAA520), // Gold
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, size: 12, color: Color(0xFF0F172A)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CustomText(text: text, type: CustomTextType.yourAdvantageItem),
        ),
      ],
    );
  }
}
