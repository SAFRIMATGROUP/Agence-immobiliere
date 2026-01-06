import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1A3263), // Dark blue background
      child: Column(
        children: [
          // Contenu centré à 60%
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              padding: const EdgeInsets.all(60),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ImmoElite Column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Logo
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFD700), // Yellow
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: 'IM',
                                      type: CustomTextType.button,
                                      color: const Color(0xFF1A3263),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                CustomText(
                                  text: 'ImmoElite',
                                  type: CustomTextType.textWhite,
                                  fontSize: 20,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            // Description
                            SizedBox(
                              width: 280,
                              child: CustomText(
                                text: 'Votre partenaire de confiance pour tous vos projets immobiliers. Expertise, innovation et accompagnement personnalisé.',
                                type: CustomTextType.textWhite,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 30),
                            // Social Media Icons
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
                        ),
                      ),
                      const SizedBox(width: 60),
                      
                      // Liens Rapides Column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Liens Rapides',
                              type: CustomTextType.textWhite,
                              fontSize: 18,
                            ),
                            const SizedBox(height: 20),
                            _buildFooterLink('Accueil'),
                            _buildFooterLink('Biens à Vendre'),
                            _buildFooterLink('Biens à Louer'),
                            _buildFooterLink('Gestion Locative'),
                            _buildFooterLink('Investissement'),
                            _buildFooterLink('Contact'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 60),
                      
                      // Nos Services Column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Nos Services',
                              type: CustomTextType.textWhite,
                              fontSize: 18,
                            ),
                            const SizedBox(height: 20),
                            _buildFooterLink('Vente & Location'),
                            _buildFooterLink('Promotion Immobilière'),
                            _buildFooterLink('Conseil & Investissement'),
                            _buildFooterLink('Gestion Locative'),
                            _buildFooterLink('Immobilier d\'Entreprise'),
                            _buildFooterLink('Financement'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 60),
                      
                      // Contact Column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Contact',
                              type: CustomTextType.textWhite,
                              fontSize: 18,
                            ),
                            const SizedBox(height: 20),
                            _buildContactItem(
                              icon: Icons.phone,
                              text: '+33 1 23 45 67 89',
                            ),
                            const SizedBox(height: 12),
                            _buildContactItem(
                              icon: Icons.email,
                              text: 'contact@immobilier.fr',
                            ),
                            const SizedBox(height: 12),
                            _buildContactItem(
                              icon: Icons.location_on,
                              text: '123 Avenue des Champs-Élysées\n75008 Paris, France',
                            ),
                            const SizedBox(height: 25),
                            // WhatsApp Button
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF25D366), // WhatsApp green
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () {
                                    // WhatsApp action
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 10,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.message,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        CustomText(
                                          text: 'WhatsApp',
                                          type: CustomTextType.textWhite,
                                          fontSize: 14,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
          
          // Ligne horizontale sur 100% de la largeur
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.white24,
          ),
          
          // Copyright centré à 60%
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: '© 2024 ImmoElite. Tous droits réservés.',
                    type: CustomTextType.textWhite,
                    fontSize: 12,
                  ),
                  Row(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            // Navigation vers mentions légales
                          },
                          child: CustomText(
                            text: 'Mention légale',
                            type: CustomTextType.textWhite,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            // Navigation vers politique de confidentialité
                          },
                          child: CustomText(
                            text: 'Politique de confidentialité',
                            type: CustomTextType.textWhite,
                            fontSize: 12,
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
      decoration: BoxDecoration(
        color: const Color(0xFF0F2347), // Darker blue
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 18,
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            // Navigation logic
          },
          child: CustomText(
            text: text,
            type: CustomTextType.textWhite,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String text,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: const Color(0xFFFFD700), // Yellow
          size: 18,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomText(
            text: text,
            type: CustomTextType.textWhite,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
