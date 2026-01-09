import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'custom_text.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1A3263),
      child: Column(
        children: [
          Center(
            child: Container(
              width:
                  MediaQuery.of(context).size.width *
                  0.9, // Wider on mobile by default
              constraints: const BoxConstraints(
                maxWidth: 1200,
              ), // Max width for desktop
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              child: ScreenTypeLayout.builder(
                mobile: (context) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBrandColumn(),
                    const SizedBox(height: 40),
                    _buildLinksColumn(context, 'Liens Rapides', [
                      'Accueil',
                      'Biens à Vendre',
                      'Biens à Louer',
                      'Gestion Locative',
                      'Investissement',
                      'Contact',
                    ]),
                    const SizedBox(height: 40),
                    _buildLinksColumn(context, 'Nos Services', [
                      'Vente & Location',
                      'Promotion Immobilière',
                      'Conseil & Investissement',
                      'Gestion Locative',
                      'Immobilier d\'Entreprise',
                      'Financement',
                    ]),
                    const SizedBox(height: 40),
                    _buildContactColumn(),
                  ],
                ),
                desktop: (context) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: _buildBrandColumn()),
                    const SizedBox(width: 40),
                    Expanded(
                      child: _buildLinksColumn(context, 'Liens Rapides', [
                        'Accueil',
                        'Biens à Vendre',
                        'Biens à Louer',
                        'Gestion Locative',
                        'Investissement',
                        'Contact',
                      ]),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: _buildLinksColumn(context, 'Nos Services', [
                        'Vente & Location',
                        'Promotion Immobilière',
                        'Conseil & Investissement',
                        'Gestion Locative',
                        'Immobilier d\'Entreprise',
                        'Financement',
                      ]),
                    ),
                    const SizedBox(width: 40),
                    Expanded(flex: 1, child: _buildContactColumn()),
                  ],
                ),
              ),
            ),
          ),

          // Ligne horizontale sur 100% de la largeur
          Container(width: double.infinity, height: 1, color: Colors.white24),

          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: '© 2024 ImmoElite. Tous droits réservés.',
                    type: CustomTextType.label,
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  Row(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {},
                          child: const CustomText(
                            text: 'Mention légale',
                            type: CustomTextType.label,
                            fontSize: 12,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {},
                          child: const CustomText(
                            text: 'Politique de confidentialité',
                            type: CustomTextType.label,
                            fontSize: 12,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      width: 36,
      height: 36,
      decoration: const BoxDecoration(
        color: Color(0xFF0F2347),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }

  Widget _buildFooterLink(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (text == 'Contact') {
              Navigator.pushNamed(context, '/contact');
            } else if (text == 'Accueil') {
              Navigator.pushNamed(context, '/home');
            } else if (text == 'Biens à Vendre' || text == 'Biens à Louer') {
              Navigator.pushNamed(context, '/real-estate');
            } else if (text == 'Gestion Locative') {
              Navigator.pushNamed(context, '/rental-management');
            } else if (text == 'Investissement') {
              Navigator.pushNamed(context, '/invest');
            }
          },
          child: CustomText(
            text: text,
            type: CustomTextType.sectionDescription,
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }

  Widget _buildBrandColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFFFD700),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: const Center(
                child: CustomText(
                  text: 'IM',
                  type: CustomTextType.heroTitle,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const CustomText(
              text: 'ImmoElite',
              type: CustomTextType.label,
              color: Colors.white,
            ),
          ],
        ),
        const SizedBox(height: 20),
        const SizedBox(
          width: 280,
          child: CustomText(
            text:
                'Votre partenaire de confiance pour tous vos projets immobiliers. Expertise, innovation et accompagnement personnalisé.',
            type: CustomTextType.sectionDescription,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            _buildSocialIcon(Icons.facebook),
            const SizedBox(width: 12),
            _buildSocialIcon(Icons.camera_alt),
            const SizedBox(width: 12),
            _buildSocialIcon(Icons.business_center),
            const SizedBox(width: 12),
            _buildSocialIcon(Icons.alternate_email),
          ],
        ),
      ],
    );
  }

  Widget _buildLinksColumn(
    BuildContext context,
    String title,
    List<String> links,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          type: CustomTextType.label,
          fontSize: 16,
          color: Colors.white,
        ),
        const SizedBox(height: 20),
        ...links.map((link) => _buildFooterLink(context, link)),
      ],
    );
  }

  Widget _buildContactColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: 'Contact',
          type: CustomTextType.label,
          fontSize: 16,
          color: Colors.white,
        ),
        const SizedBox(height: 20),
        _buildContactItem(icon: Icons.phone, text: '+33 1 23 45 67 89'),
        const SizedBox(height: 12),
        _buildContactItem(icon: Icons.email, text: 'contact@immobilier.fr'),
        const SizedBox(height: 12),
        _buildContactItem(
          icon: Icons.location_on,
          text: '123 Avenue des Champs-Élysées\n75008 Paris, France',
        ),
        const SizedBox(height: 25),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF25D366),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.message, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    CustomText(
                      text: 'WhatsApp',
                      type: CustomTextType.sectionDescription,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem({required IconData icon, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFFFFD700), size: 18),
        const SizedBox(width: 10),
        Expanded(
          child: CustomText(
            text: text,
            type: CustomTextType.sectionDescription,
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
