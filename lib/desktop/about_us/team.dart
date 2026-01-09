import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';

class TeamSection extends StatelessWidget {
  const TeamSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final List<Map<String, String>> teamMembers = [
      {
        'name': 'Marie Dupont',
        'role': 'Directrice Générale',
        'description': '20 ans d\'expérience dans l\'immobilier de prestige.',
        'image': 'assets/images/imagesWeb/images1.jpg',
      },
      {
        'name': 'Thomas Bernard',
        'role': 'Directeur Commercial',
        'description': 'Expert en négociation et stratégie commerciale.',
        'image': 'assets/images/imagesWeb/images2.jpg',
      },
      {
        'name': 'Sophie Martin',
        'role': 'Responsable Gestion Locative',
        'description': 'Spécialiste de la gestion de patrimoine immobilier.',
        'image': 'assets/images/imagesWeb/images3.jpg',
      },
      {
        'name': 'Pierre Leroy',
        'role': 'Conseiller Investissement',
        'description': 'Expert en stratégies d\'investissement immobilier.',
        'image': 'assets/images/imagesWeb/images4.jpg',
      },
    ];

    return Container(
      width: double.infinity,
      color: const Color(0xFF1A3263),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Center(
        child: SizedBox(
          width: size.width * 0.60,
          child: Column(
            children: [
              const CustomText(
                text: "L'ÉQUIPE",
                type: CustomTextType.sectionTagline,
              ),
              const SizedBox(height: 16),
              const CustomText(
                text: "Des Experts à Votre Service",
                type: CustomTextType.sectionTitle,
                color: Colors.white,
              ),
              const SizedBox(height: 16),
              const SizedBox(
                width: 600,
                child: CustomText(
                  text:
                      "Une équipe de professionnels passionnés, dédiés à la réussite de vos projets.",
                  type: CustomTextType.sectionDescription,
                  color: Colors.white70,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 60),
              LayoutBuilder(
                builder: (context, constraints) {
                  // Responsive layout: 4 columns on large screens
                  int crossAxisCount = 4;
                  if (constraints.maxWidth < 600) {
                    crossAxisCount = 1;
                  } else if (constraints.maxWidth < 1100) {
                    crossAxisCount = 2;
                  }

                  // Calculate width for wrapping if not using GridView to avoid height issues inside Column
                  // Using Wrap for flexibility
                  double itemWidth =
                      (constraints.maxWidth - (20 * (crossAxisCount - 1))) /
                      crossAxisCount;
                  if (itemWidth < 250) itemWidth = 250;

                  return Wrap(
                    spacing: 20,
                    runSpacing: 30,
                    alignment: WrapAlignment.center,
                    children: teamMembers.map((member) {
                      return SizedBox(
                        width: itemWidth,
                        child: _TeamMemberCard(member: member),
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

class _TeamMemberCard extends StatelessWidget {
  final Map<String, String> member;

  const _TeamMemberCard({required this.member});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400, // Hauteur fixe pour garantir la proportion
      decoration: BoxDecoration(
        color: const Color(0xFF252538).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      clipBehavior:
          Clip.antiAlias, // Pour que l'image respecte les bords arrondis
      child: Column(
        children: [
          // Image part (65%)
          Expanded(
            flex: 65,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(member['image']!),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
          // Text part (Remaining Space)
          Expanded(
            flex: 35,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: member['name']!,
                    type: CustomTextType.cardTitle,
                    color: Colors.white,
                    textAlign: TextAlign.center,
                    fontSize: 18, // Légèrement réduit pour s'adapter
                  ),
                  const SizedBox(height: 4),
                  Text(
                    member['role']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Lato',
                      color: AppColors.primary,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  CustomText(
                    text: member['description']!,
                    type: CustomTextType.sectionDescription,
                    color: Colors.white70,
                    textAlign: TextAlign.center,
                    fontSize: 12, // Réduit pour l'espace compact
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
