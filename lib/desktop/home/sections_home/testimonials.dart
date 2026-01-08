import 'dart:async';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../widgets/custom_text.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  late final PageController _pageController = PageController(initialPage: 1000);
  int _realIndex = 0;
  Timer? _timer;

  static final List<Map<String, dynamic>> _testimonials = [
    {
      'content':
          "Vente conclue en moins de 2 mois au prix souhaité ! Leur stratégie marketing et leur réseau ont fait toute la différence.",
      'name': 'Thomas Moreau',
      'role': 'Vendeur',
      'avatar': 'assets/images/avatar1.jpg',
    },
    {
      'content':
          "Une équipe à l'écoute et très réactive. Ils ont su trouver la perle rare que nous cherchions depuis des mois.",
      'name': 'Sarah & Marc',
      'role': 'Acheteurs',
      'avatar': 'assets/images/avatar2.jpg',
    },
    {
      'content':
          "Gestion locative impeccable. Je reçois mes loyers à temps et je ne m'occupe de rien. La tranquillité d'esprit absolue.",
      'name': 'Julien Lepers',
      'role': 'Investisseur',
      'avatar': 'assets/images/avatar3.jpg',
    },
    {
      'content':
          "J'étais perdu dans les démarches administratives, mais l'équipe m'a guidé pas à pas. Un professionnalisme rare.",
      'name': 'Sophie Laurent',
      'role': 'Primo-accédante',
      'avatar': 'assets/images/avatar4.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 6), (timer) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    _startAutoScroll();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        width: size.width * 0.6,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Column(
            children: [
              const CustomText(
                text: "TÉMOIGNAGES",
                type: CustomTextType.sectionTagline,
              ),
              const SizedBox(height: 16),
              const CustomText(
                text: "Ce Que Disent Nos Clients",
                type: CustomTextType.sectionTitle,
              ),

              const SizedBox(height: 60),

              Row(
                children: [
                  _buildArrowButton(
                    icon: Icons.chevron_left,
                    onTap: () {
                      _resetTimer();
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),

                  Expanded(
                    child: SizedBox(
                      height: 400,
                      child: PageView.builder(
                        controller: _pageController,
                        clipBehavior: Clip.none,
                        onPageChanged: (index) {
                          setState(
                            () => _realIndex = index % _testimonials.length,
                          );
                        },

                        itemBuilder: (context, index) {
                          final testimonialIndex = index % _testimonials.length;

                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
                            child: _TestimonialCard(
                              data: _testimonials[testimonialIndex],
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  _buildArrowButton(
                    icon: Icons.chevron_right,
                    onTap: () {
                      _resetTimer();
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_testimonials.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: _realIndex == index ? 24 : 8,
                    decoration: BoxDecoration(
                      color: _realIndex == index
                          ? AppColors.primary
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArrowButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, color: Colors.grey.shade700),
        onPressed: onTap,
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const _TestimonialCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => const Icon(
                    Icons.star,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              CustomText(
                text: "\"${data['content']}\"",
                type: CustomTextType.sectionDescriptionBlack,
                fontStyle: FontStyle.italic,
                fontSize: 20,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: data['name'],
                        type: CustomTextType.cardTitle,
                      ),
                      CustomText(
                        text: data['role'],
                        type: CustomTextType.label,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: -25,
          left: 40,
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.format_quote_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
