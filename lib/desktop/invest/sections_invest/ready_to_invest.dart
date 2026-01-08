import 'package:flutter/material.dart';
import '../../../../widgets/custom_text.dart';

class ReadyToInvestSection extends StatelessWidget {
  const ReadyToInvestSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      color: const Color(0xFF1A3263), // Dark Blue background matching Footer
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: SizedBox(
          width: size.width * 0.70,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column: Text Content
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(right: 60, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'PRÊT À INVESTIR ?',
                        type: CustomTextType.sectionTagline,
                      ),
                      const SizedBox(height: 16),
                      const CustomText(
                        text: 'Contactez un Expert',
                        type: CustomTextType
                            .heroTitle, // Using HeroTitle for big white text
                        fontSize: 40,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 24),
                      const CustomText(
                        text:
                            'Nos conseillers en investissement sont à votre disposition pour étudier votre projet et vous proposer les meilleures opportunités.',
                        type: CustomTextType.sectionDescription,
                        color: Colors.white70,
                      ),
                      const SizedBox(height: 40),

                      // Checkmarks List
                      _buildCheckItem(
                        'Consultation gratuite et sans engagement',
                      ),
                      const SizedBox(height: 20),
                      _buildCheckItem(
                        'Analyse personnalisée de votre situation',
                      ),
                      const SizedBox(height: 20),
                      _buildCheckItem('Accès à des opportunités exclusives'),
                    ],
                  ),
                ),
              ),

              // Right Column: Contact Form Card
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'Demande d\'Information',
                        type: CustomTextType.sectionTitle,
                        fontSize: 24,
                      ),
                      const SizedBox(height: 30),

                      // First Name / Last Name Row
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                              label: 'Prénom',
                              hint: 'Jean',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildTextField(
                              label: 'Nom',
                              hint: 'Dupont',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      _buildTextField(
                        label: 'Email',
                        hint: 'jean.dupont@email.com',
                      ),
                      const SizedBox(height: 20),

                      _buildTextField(
                        label: 'Téléphone (optionnel)',
                        hint: '+33 6 12 34 56 78',
                      ),
                      const SizedBox(height: 20),

                      _buildTextField(
                        label: 'Message',
                        hint: 'Votre message...',
                        maxLines: 4,
                      ),
                      const SizedBox(height: 30),

                      // Submit Button
                      SizedBox(
                        width: double.infinity,
                        child: Material(
                          color: const Color(0xFFDAA520), // Gold
                          borderRadius: BorderRadius.circular(8),
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(8),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Center(
                                child: Text(
                                  'Envoyer',
                                  style: TextStyle(
                                    color: Color(0xFF0F172A),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
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
    );
  }

  Widget _buildCheckItem(String text) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xFFDAA520), // Gold
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check,
            size: 16,
            color: Color(0xFF0F172A), // Dark blue checkmark
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomText(
            text: text,
            type: CustomTextType.sectionDescription,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: label,
          type: CustomTextType.label,
          fontSize: 14,
          color: const Color(0xFF1A3263),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }
}
