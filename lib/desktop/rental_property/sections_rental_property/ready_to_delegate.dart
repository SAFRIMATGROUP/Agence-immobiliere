import 'package:flutter/material.dart';
import '../../../widgets/custom_text.dart';

class ReadyToDelegateSection extends StatelessWidget {
  const ReadyToDelegateSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF9F9F9), // Off-white background like Our Services
      child: Center(
        child: SizedBox(
          width: size.width * 0.70,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Column: Text and Features
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'PRÊT À DÉLÉGUER ?',
                        type: CustomTextType.readyDelegateTagline,
                      ),
                      const SizedBox(height: 16),
                      const CustomText(
                        text: 'Obtenez une Estimation\nGratuite',
                        type: CustomTextType.readyDelegateTitle,
                      ),
                      const SizedBox(height: 24),
                      const CustomText(
                        text:
                            'Remplissez le formulaire ci-contre et recevez une proposition personnalisée pour la gestion de votre bien. C\'est gratuit et sans engagement.',
                        type: CustomTextType.readyDelegateDescription,
                      ),
                      const SizedBox(height: 40),
                      // Features
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            _buildFeature(
                              Icons.shield_outlined,
                              'Garantie Loyers Impayés',
                              'Incluse dans nos formules premium',
                            ),
                            const SizedBox(height: 24),
                            _buildFeature(
                              Icons.person_outline,
                              'Interlocuteur Dédié',
                              'Un expert à votre écoute',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 60),
                // Right Column: Contact Form
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: 'Demande de Gestion',
                          type: CustomTextType.readyDelegateFormTitle,
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            Expanded(child: _buildTextField('Prénom', 'Jean')),
                            const SizedBox(width: 20),
                            Expanded(child: _buildTextField('Nom', 'Dupont')),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _buildTextField('Email', 'jean.dupont@email.com'),
                        const SizedBox(height: 20),
                        _buildTextField(
                          'Téléphone (optionnel)',
                          '+33 6 12 34 56 78',
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          'Message',
                          'Votre message...',
                          maxLines: 4,
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFDAA520), // Gold
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const CustomText(
                              text: 'Envoyer',
                              type: CustomTextType.button,
                              color:
                                  Colors.black, // Assuming black text on gold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeature(IconData icon, String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFFDAA520), size: 32),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: title,
              type: CustomTextType.readyDelegateFeatureTitle,
            ),
            const SizedBox(height: 4),
            CustomText(
              text: subtitle,
              type: CustomTextType.readyDelegateFeatureSubtitle,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String hint, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: label, type: CustomTextType.readyDelegateFormLabel),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFDAA520), // Gold
                width: 1.5,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
