import 'package:flutter/material.dart';
import '../../../../widgets/custom_text.dart';

class WhyInvestWithUsSection extends StatelessWidget {
  const WhyInvestWithUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF9F9F9), // Match Our Solutions
      child: Center(
        child: SizedBox(
          width: size.width * 0.6,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text Column
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'POURQUOI INVESTIR AVEC NOUS',
                        type: CustomTextType.sectionTagline,
                      ),
                      const SizedBox(height: 16),
                      const CustomText(
                        text: 'Un Accompagnement Expert',
                        type: CustomTextType.sectionTitle,
                        fontSize: 40,
                      ),
                      const SizedBox(height: 24),
                      const CustomText(
                        text:
                            'Notre équipe d\'experts vous accompagne à chaque étape de votre Investissement Immobilier, de la définition de votre stratégie à la gestion de votre patrimoine.',
                        type: CustomTextType.sectionDescriptionBlack,
                      ),
                      const SizedBox(height: 40),

                      // Checkmarks Grid
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildCheckItem('Accompagnement personnalisé'),
                                const SizedBox(height: 16),
                                _buildCheckItem(
                                  'Analyse de rentabilité détaillée',
                                ),
                                const SizedBox(height: 16),
                                _buildCheckItem('Suivi de performance'),
                              ],
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildCheckItem(
                                  'Sélection rigoureuse des biens',
                                ),
                                const SizedBox(height: 16),
                                _buildCheckItem('Optimisation fiscale'),
                                const SizedBox(height: 16),
                                _buildCheckItem('Réseau d\'experts'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),

                      // CTA Button
                      Material(
                        color: const Color(0xFFDAA520), // Gold
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: () {}, // Add navigation if needed
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  'Voir les Opportunités',
                                  style: TextStyle(
                                    color: Color(0xFF0F172A),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Color(0xFF0F172A),
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 80),

                // Image Column
                Expanded(
                  flex: 1,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Main Image
                      Container(
                        height: 450,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/imagesWeb/hotel_ricardio.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                      ),

                      // Floating Card
                      Positioned(
                        left: -20, // Creating the overlap effect
                        bottom: -40,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 15,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.shield_outlined,
                                color: Color(0xFFDAA520),
                                size: 40,
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomText(
                                    text: 'Investissement Sécurisé',
                                    type: CustomTextType.label,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0F172A),
                                  ),
                                  const SizedBox(height: 4),
                                  const CustomText(
                                    text: '15+ ans d\'expertise',
                                    type:
                                        CustomTextType.sectionDescriptionBlack,
                                    fontSize: 14,
                                    color: Color(0xFF64748B),
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

  Widget _buildCheckItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFDAA520).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check_rounded,
            size: 14,
            color: Color(0xFFDAA520),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CustomText(
            text: text,
            type: CustomTextType.sectionDescriptionBlack,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
