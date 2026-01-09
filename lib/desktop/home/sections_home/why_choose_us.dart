import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../constants/colors.dart';
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
    final size = MediaQuery.of(context).size;

    // Adaptation de la largeur du conteneur global
    final double contentWidth = getValueForScreenType<double>(
      context: context,
      mobile: size.width * 0.9,
      tablet: size.width * 0.85,
      desktop: size.width * 0.7,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80),
      decoration: const BoxDecoration(color: Color(0xFF1A3263)),
      child: Column(
        children: [
          // Section titre avec bouton
          Center(
            child: SizedBox(
              width: contentWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "POURQUOI NOUS CHOISIR",
                          type: CustomTextType.sectionTagline,
                        ),
                        SizedBox(height: 16),
                        CustomText(
                          text: "Une Expertise au Service de Vos Projets",
                          type: CustomTextType.sectionTitle,
                          color: Colors.white,
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 60),

          Center(
            child: SizedBox(
              width: contentWidth,
              // --- LOGIQUE DE GRILLE 600px / 800px ---
              child: LayoutBuilder(
                builder: (context, constraints) {
                  const double spacing = 24;
                  int columns;

                  // < 600px -> 1 colonne
                  if (constraints.maxWidth < 600) {
                    columns = 1;
                  }
                  // Entre 600 et 800 (inclus) -> 2 colonnes
                  else if (constraints.maxWidth <= 800) {
                    columns = 2;
                  }
                  // > 800 -> 3 colonnes
                  else {
                    columns = 3;
                  }

                  final double cardWidth =
                      (constraints.maxWidth - (spacing * (columns - 1))) /
                      columns;

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
        // On évite de scaler sur mobile pour éviter les débordements
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 77, 108, 141),
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
          mainAxisSize:
              MainAxisSize.min, // Important pour éviter overflow vertical
          children: [
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

            CustomText(
              text: widget.feature['title'],
              type: CustomTextType.cardTitle,
              color: Colors.white,
            ),
            const SizedBox(height: 12),

            CustomText(
              text: widget.feature['description'],
              type: CustomTextType.sectionDescription,
              color: Colors.white70,
            ),
          ],
        ),
      ),
    );
  }
}
