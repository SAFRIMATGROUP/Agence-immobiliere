import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../widgets/custom_text.dart';

class OurStorySection extends StatelessWidget {
  const OurStorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        // Story Part
        Container(
          width: double.infinity,
          color: const Color(0xFFF9F9F9), // Matches Our Solutions
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Center(
            child: SizedBox(
              width: size.width * 0.70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text Column
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: 'NOTRE HISTOIRE',
                            type: CustomTextType.sectionTagline,
                          ),
                          const SizedBox(height: 16),
                          const CustomText(
                            text: 'Une Passion pour l\'Immobilier',
                            type: CustomTextType.sectionTitle,
                          ),
                          const SizedBox(height: 24),
                          const CustomText(
                            text:
                                'Fondée en 2010, ImmoElite est née de la vision d\'offrir un service immobilier d\'exception, alliant expertise traditionnelle et innovation digitale.',
                            type: CustomTextType.sectionDescriptionBlack,
                            color: Colors.black54,
                          ),
                          const SizedBox(height: 16),
                          const CustomText(
                            text:
                                'Au fil des années, nous avons bâti une réputation d\'excellence en accompagnant des centaines de clients dans leurs projets d\'achat, de vente, de location et d\'investissement.',
                            type: CustomTextType.sectionDescriptionBlack,
                            color: Colors.black54,
                          ),
                          const SizedBox(height: 16),
                          const CustomText(
                            text:
                                'Notre équipe de professionnels passionnés met tout en œuvre pour vous offrir un accompagnement personnalisé et des solutions sur mesure adaptées à vos besoins.',
                            type: CustomTextType.sectionDescriptionBlack,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Image
                  Expanded(
                    flex: 1,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1560518883-ce09059eeffa?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80', // Office/Team meeting image
                            height: 400,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: -30,
                          right: -30,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppColors.primary, // Gold
                              borderRadius: BorderRadius.circular(12),
                            ),
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

        // Statistics Part
        Container(
          width: double.infinity,
          color: const Color(0xFFF5F5F5), // Matches Simulator
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: Center(
            child: SizedBox(
              width: size.width * 0.70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _StatItem(value: '15+', label: 'Années d\'expérience'),
                  _StatItem(value: '500+', label: 'Biens vendus'),
                  _StatItem(value: '98%', label: 'Clients satisfaits'),
                  _StatItem(value: '50+', label: 'Collaborateurs'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: value,
          type: CustomTextType.heroTitle, // Big Gold
          color: AppColors.primary,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 8),
        CustomText(
          text: label,
          type: CustomTextType.sectionDescription,
          color: Colors.black54,
        ),
      ],
    );
  }
}
