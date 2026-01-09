import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../widgets/custom_text.dart';

class OurAdnSection extends StatelessWidget {
  const OurAdnSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF9F9F9), // Same as Our Solutions
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: SizedBox(
          width: size.width * 0.6,
          child: Column(
            children: [
              // Header
              const CustomText(
                text: 'NOTRE ADN',
                type: CustomTextType.sectionTagline,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const CustomText(
                text: 'Nos Valeurs',
                type: CustomTextType.sectionTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const SizedBox(
                width: 700,
                child: CustomText(
                  text:
                      'Les principes qui guident notre action au quotidien et fondent notre relation avec nos clients.',
                  type: CustomTextType.sectionDescriptionBlack,
                  textAlign: TextAlign.center,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 60),

              // Values Grid
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Expanded(
                      child: _ValueCard(
                        title: 'Excellence',
                        description:
                            'Nous visons l\'excellence dans chaque transaction et chaque relation client.',
                        icon: Icons.verified_outlined, // Target/Verify icon
                      ),
                    ),
                    SizedBox(width: 24),
                    Expanded(
                      child: _ValueCard(
                        title: 'Transparence',
                        description:
                            'Une communication claire et honnête à chaque étape de votre projet.',
                        icon: Icons.visibility_outlined, // Eye icon
                      ),
                    ),
                    SizedBox(width: 24),
                    Expanded(
                      child: _ValueCard(
                        title: 'Engagement',
                        description:
                            'Nous nous engageons pleinement pour la réussite de vos projets immobiliers.',
                        icon: Icons.favorite_border, // Heart/Handshake icon
                      ),
                    ),
                    SizedBox(width: 24),
                    Expanded(
                      child: _ValueCard(
                        title: 'Confiance',
                        description:
                            'Bâtir une relation de confiance durable avec nos clients et partenaires.',
                        icon: Icons.handshake_outlined, // Handshake icon
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ValueCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;

  const _ValueCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  State<_ValueCard> createState() => _ValueCardState();
}

class _ValueCardState extends State<_ValueCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered ? AppColors.primary : Colors.grey.shade200,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.05 : 0.0),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF9E6), // Light Gold
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(widget.icon, color: AppColors.primary, size: 32),
            ),
            const SizedBox(height: 24),
            CustomText(
              text: widget.title,
              type: CustomTextType.cardTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            CustomText(
              text: widget.description,
              type: CustomTextType.sectionDescriptionBlack,
              textAlign: TextAlign.center,
              color: Colors.black54,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
