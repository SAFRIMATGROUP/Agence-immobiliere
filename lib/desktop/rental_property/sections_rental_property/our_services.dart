import 'package:flutter/material.dart';
import '../../../widgets/custom_text.dart';

class OurServicesSection extends StatelessWidget {
  const OurServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF9F9F9),
      child: Center(
        child: SizedBox(
          width: size.width * 0.70,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Column(
              children: [
                // Header Section
                const CustomText(
                  text: 'NOS SERVICES',
                  type: CustomTextType.rentalServiceTagline,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const CustomText(
                  text: 'Une Gestion Complète et Sereine',
                  type: CustomTextType.rentalServiceTitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const SizedBox(
                  width: 700,
                  child: CustomText(
                    text:
                        'Des services sur mesure pour répondre à tous vos besoins de gestion immobilière.',
                    type: CustomTextType.rentalServiceSubtitle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 60),

                // Services Grid - Custom Layout for Auto Height
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _ServiceCard(
                            title: 'Gestion Locative Complète',
                            description:
                                'Nous prenons en charge l\'intégralité de la gestion de votre bien : recherche de locataires, rédaction des baux, états des lieux, encaissement des loyers.',
                            icon: Icons.vpn_key_outlined,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: _ServiceCard(
                            title: 'Entretien & Maintenance',
                            description:
                                'Coordination des travaux d\'entretien, gestion des urgences 24/7, suivi des prestataires et optimisation des coûts de maintenance.',
                            icon: Icons.build_outlined,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _ServiceCard(
                            title: 'Syndic de Copropriété',
                            description:
                                'Gestion complète des copropriétés : assemblées générales, suivi comptable, entretien des parties communes, gestion des sinistres.',
                            icon: Icons.apartment_outlined,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: _ServiceCard(
                            title: 'Assistance Juridique',
                            description:
                                'Accompagnement juridique complet : litiges locatifs, recouvrement de loyers impayés, procédures d\'expulsion, conseil réglementaire.',
                            icon: Icons.gavel_outlined,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;

  const _ServiceCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
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
          mainAxisSize: MainAxisSize.min,
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
            const SizedBox(height: 24),
            CustomText(
              text: widget.title,
              type: CustomTextType.rentalCardTitle,
            ),
            const SizedBox(height: 12),
            CustomText(
              text: widget.description,
              type: CustomTextType.rentalCardDescription,
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }
}
