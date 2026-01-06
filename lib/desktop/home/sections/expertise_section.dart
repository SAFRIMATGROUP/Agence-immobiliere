import 'package:flutter/material.dart';
import '../../../constants/colors.app.dart';

class ExpertiseSection extends StatelessWidget {
  const ExpertiseSection({super.key});

  static final List<Map<String, dynamic>> _services = [
    {
      'title': 'Vente & Location',
      'desc':
          'Accompagnement complet pour l\'achat, la vente ou la location de votre bien immobilier.',
      'icon': Icons.home_outlined,
    },
    {
      'title': 'Promotion Immobilière',
      'desc':
          'Développement de programmes neufs et projets immobiliers innovants.',
      'icon': Icons.business_outlined,
    },
    {
      'title': 'Conseil & Investissement',
      'desc':
          'Stratégies d\'investissement personnalisées et optimisation de patrimoine.',
      'icon': Icons.trending_up,
    },
    {
      'title': 'Gestion Locative',
      'desc':
          'Gestion complète de vos biens locatifs : loyers, maintenance, relation locataires.',
      'icon': Icons.vpn_key_outlined,
    },
    {
      'title': 'Immobilier d\'Entreprise',
      'desc':
          'Bureaux, locaux commerciaux et solutions immobilières pour professionnels.',
      'icon': Icons.domain,
    },
    {
      'title': 'Marketing Immobilier',
      'desc':
          'Valorisation et communication efficace de vos biens sur le marché.',
      'icon': Icons.campaign_outlined,
    },
    {
      'title': 'Financement',
      'desc':
          'Solutions de financement adaptées et accompagnement bancaire.',
      'icon': Icons.account_balance_wallet_outlined,
    },
    {
      'title': 'Projets Durables',
      'desc':
          'Construction et rénovation éco-responsables, certifications environnementales.',
      'icon': Icons.eco_outlined,
    },
    {
      'title': 'Formation',
      'desc': 'Accompagnement et formation aux métiers de l\'immobilier.',
      'icon': Icons.school_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // 1. Get screen size
    final size = MediaQuery.of(context).size;
    
    // 2. Wrap everything in a Center -> SizedBox (60% width)
    return Center(
      child: SizedBox(
        width: size.width * 0.6, // Force 60% width
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "NOS EXPERTISES",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                "Des Services Complets",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 600,
                child: Text(
                  "Une gamme complète de services immobiliers pour répondre à tous vos besoins, de l'achat à la gestion de patrimoine.",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 60),
              LayoutBuilder(
                builder: (context, constraints) {
                  const double spacing = 30;
                  // Calculate card width based on the PARENT's width (which is 60% of screen)
                  final double cardWidth =
                      (constraints.maxWidth - (spacing * 2)) / 3;

                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: _services.map((service) {
                      return ServiceCard(
                        width: cardWidth,
                        title: service['title'],
                        description: service['desc'],
                        icon: service['icon'],
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- SERVICE CARD WIDGET ---
class ServiceCard extends StatefulWidget {
  final double width;
  final String title;
  final String description;
  final IconData icon;

  const ServiceCard({
    super.key,
    required this.width,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        width: widget.width,
        constraints: const BoxConstraints(minHeight: 280),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered
                ? AppColors.primary.withOpacity(0.5)
                : Colors.grey.shade200,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.08 : 0.03),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _isHovered ? AppColors.primary : AppColors.primaryLight,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                widget.icon,
                // MODIFICATION : L'icône devient NOIRE au survol
                color: _isHovered ? Colors.black : AppColors.primary,
                size: 28,
              ),
            ),
            const SizedBox(height: 24),
            
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: _isHovered ? Colors.black : const Color(0xFF0F172A),
              ),
            ),
            
            const SizedBox(height: 12),
            Text(
              widget.description,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Text(
                  "En savoir plus",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: _isHovered ? Colors.black : AppColors.primary,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: _isHovered ? Colors.black : AppColors.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}