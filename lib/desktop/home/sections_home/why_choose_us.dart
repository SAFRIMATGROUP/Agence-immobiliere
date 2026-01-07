import 'package:flutter/material.dart';
import '../../../constants/colors.app.dart';
import '../../../widgets/custom_text.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  static final List<Map<String, dynamic>> _features = [
    {
      'icon': Icons.home_work,
      'title': 'Expertise Locale',
      'description':
          'Connaissance approfondie du marché immobilier local et des quartiers.',
    },
    {
      'icon': Icons.trending_up,
      'title': 'Meilleur Prix',
      'description':
          'Négociation optimale pour obtenir le meilleur prix pour votre bien.',
    },
    {
      'icon': Icons.support_agent,
      'title': 'Accompagnement',
      'description':
          'Support personnalisé à chaque étape de votre projet immobilier.',
    },
    {
      'icon': Icons.speed,
      'title': 'Rapidité',
      'description':
          'Processus optimisé pour des transactions rapides et efficaces.',
    },
    {
      'icon': Icons.security,
      'title': 'Sécurité',
      'description':
          'Garantie de transactions sécurisées et conformes aux normes.',
    },
    {
      'icon': Icons.handshake,
      'title': 'Confiance',
      'description':
          'Relation basée sur la transparence et la confiance mutuelle.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // 100% de la largeur totale
      padding: const EdgeInsets.symmetric(vertical: 80),
      decoration: const BoxDecoration(color: Color(0xFF1A3263)),
      child: Column(
        children: [
          // Section titre avec bouton
          Center(
            child: SizedBox(
              width:
                  MediaQuery.of(context).size.width *
                  0.6, // Contenu centré à 60%
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Titres
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "POURQUOI NOUS CHOISIR",
                          type: CustomTextType.whyChooseUsTagline,
                        ),
                        SizedBox(height: 16),
                        CustomText(
                          text: "Une Expertise au Service de Vos Projets",
                          type: CustomTextType.whyChooseUsTitle,
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),

                  // Bouton
                  Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.background,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                            text: 'En Savoir Plus',
                            type: CustomTextType.whyChooseUsButton,
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, size: 18),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 60),

          // Grille de fonctionnalités
          Center(
            child: SizedBox(
              width:
                  MediaQuery.of(context).size.width *
                  0.6, // Contenu centré à 60%
              child: LayoutBuilder(
                builder: (context, constraints) {
                  const double spacing = 24;
                  final double cardWidth =
                      (constraints.maxWidth - (spacing * 2)) / 3;

                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: _features.map((feature) {
                      return FeatureCard(width: cardWidth, feature: feature);
                    }).toList(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatefulWidget {
  final double width;
  final Map<String, dynamic> feature;

  const FeatureCard({super.key, required this.width, required this.feature});

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width,
        padding: const EdgeInsets.all(32),
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(
            255,
            77,
            108,
            141,
          ), // Bleu Nuit très profond
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered
                ? AppColors.primary.withOpacity(0.3)
                : Colors.grey.shade200,
            width: _isHovered ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(
                255,
                77,
                108,
                141,
              ).withOpacity(_isHovered ? 0.3 : 0.1),
              blurRadius: _isHovered ? 15 : 8,
              offset: Offset(0, _isHovered ? 5 : 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icône
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isHovered
                    ? AppColors.primary
                    : AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                widget.feature['icon'],
                size: 32,
                color: _isHovered ? Colors.black : AppColors.primary,
              ),
            ),
            const SizedBox(height: 24),

            // Titre
            CustomText(
              text: widget.feature['title'],
              type: CustomTextType.featureCardTitle,
            ),
            const SizedBox(height: 12),

            // Description
            CustomText(
              text: widget.feature['description'],
              type: CustomTextType.featureCardDescription,
            ),
          ],
        ),
      ),
    );
  }
}
