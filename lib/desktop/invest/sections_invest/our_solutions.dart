import 'package:flutter/material.dart';
import '../../../../widgets/custom_text.dart';

class OurSolutionsSection extends StatelessWidget {
  const OurSolutionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF9F9F9), // Same as Our Services
      child: Center(
        child: SizedBox(
          width: size.width * 0.6,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Column(
              children: [
                // Header Section
                const CustomText(
                  text: 'NOS SOLUTIONS',
                  type: CustomTextType.sectionTagline,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const CustomText(
                  text: 'Types d\'Investissement',
                  type: CustomTextType.sectionTitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const SizedBox(
                  width: 700,
                  child: CustomText(
                    text:
                        'Découvrez les différentes stratégies d\'investissement immobilier adaptées à votre profil et vos objectifs.',
                    type: CustomTextType.sectionDescriptionBlack,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 60),

                // Solutions Cards Grid
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: _SolutionCard(
                          title: 'Immobilier Locatif',
                          description:
                              'Investissement dans des biens résidentiels pour générer des revenus locatifs réguliers.',
                          statsValue: '4-7%',
                          statsLabel: ' rendement estimé',
                          icon: Icons.business,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _SolutionCard(
                          title: 'SCPI',
                          description:
                              'Investissement collectif dans l\'immobilier professionnel avec mutualisation des risques.',
                          statsValue: '4-6%',
                          statsLabel: ' rendement estimé',
                          icon: Icons.trending_up,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _SolutionCard(
                          title: 'Défiscalisation',
                          description:
                              'Dispositifs Pinel, Denormandie, Malraux pour optimiser votre fiscalité.',
                          statsValue: 'Variable',
                          statsLabel: ' rendement estimé',
                          icon: Icons.savings_outlined,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _SolutionCard(
                          title: 'Immobilier Neuf',
                          description:
                              'Programmes neufs avec garanties constructeur et avantages fiscaux.',
                          statsValue: '3-5%',
                          statsLabel: ' rendement estimé',
                          icon: Icons.bar_chart,
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
}

class _SolutionCard extends StatefulWidget {
  final String title;
  final String description;
  final String statsValue;
  final String statsLabel;
  final IconData icon;

  const _SolutionCard({
    required this.title,
    required this.description,
    required this.statsValue,
    required this.statsLabel,
    required this.icon,
  });

  @override
  State<_SolutionCard> createState() => _SolutionCardState();
}

class _SolutionCardState extends State<_SolutionCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: _isHovered
            ? Matrix4.translationValues(0, -10, 0)
            : Matrix4.identity(),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? const Color(0xFFDAA520).withOpacity(0.3)
                : Colors.grey.shade200,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.08 : 0.03),
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize:
              MainAxisSize.min, // Keep min so it stretches with parent
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF9E6), // Light gold background
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                widget.icon,
                color: const Color(0xFFDAA520), // Gold icon
                size: 28,
              ),
            ),
            const SizedBox(height: 20),
            CustomText(text: widget.title, type: CustomTextType.cardTitle),
            const SizedBox(height: 12),
            Expanded(
              // Allow description to take available space if needed, or stick to top
              child: CustomText(
                text: widget.description,
                type: CustomTextType.sectionDescriptionBlack,
                color: Colors.black87,
                maxLines: 4,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CustomText(
                  text: widget.statsValue,
                  type: CustomTextType.label,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFDAA520),
                ),
                Expanded(
                  child: CustomText(
                    text: widget.statsLabel,
                    type: CustomTextType.label,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
