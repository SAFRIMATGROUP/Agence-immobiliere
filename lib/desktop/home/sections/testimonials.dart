import 'dart:async';
import 'package:flutter/material.dart';
import '../../../constants/colors.app.dart';
import '../../../constants/text_styles.app.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  // MODIF 1 : On commence à une page élevée (1000) pour permettre le scroll arrière infini
  // 1000 est divisible par 4 (nb témoignages), donc ça commence bien au premier item.
  late final PageController _pageController = PageController(initialPage: 1000);
  
  // On garde un index "réel" (0, 1, 2, 3) pour les points indicateurs
  int _realIndex = 0;
  Timer? _timer;

  static final List<Map<String, dynamic>> _testimonials = [
    {
      'content': "Vente conclue en moins de 2 mois au prix souhaité ! Leur stratégie marketing et leur réseau ont fait toute la différence.",
      'name': 'Thomas Moreau',
      'role': 'Vendeur',
      'avatar': 'assets/images/avatar1.jpg',
    },
    {
      'content': "Une équipe à l'écoute et très réactive. Ils ont su trouver la perle rare que nous cherchions depuis des mois.",
      'name': 'Sarah & Marc',
      'role': 'Acheteurs',
      'avatar': 'assets/images/avatar2.jpg',
    },
    {
      'content': "Gestion locative impeccable. Je reçois mes loyers à temps et je ne m'occupe de rien. La tranquillité d'esprit absolue.",
      'name': 'Julien Lepers',
      'role': 'Investisseur',
      'avatar': 'assets/images/avatar3.jpg',
    },
    {
      'content': "J'étais perdu dans les démarches administratives, mais l'équipe m'a guidé pas à pas. Un professionnalisme rare.",
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
      // MODIF 2 : Plus besoin de vérifier si on est à la fin.
      // On avance juste tout le temps vers la droite.
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
              // --- HEADER ---
              const Text(
                "TÉMOIGNAGES",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Ce Que Disent Nos Clients",
                style: AppTextStyles.sectionTitle.copyWith(fontSize: 40),
              ),
              
              const SizedBox(height: 60),

              // --- ZONE DU SLIDER ---
              Row(
                children: [
                  // Flèche Gauche
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

                  // Le Contenu (Carte)
                  Expanded(
                    child: SizedBox(
                      height: 400,
                      child: PageView.builder(
                        controller: _pageController,
                        clipBehavior: Clip.none,
                        // MODIF 3 : On enlève itemCount pour rendre la liste "infinie"
                        // itemCount: _testimonials.length, <--- SUPPRIMÉ
                        
                        onPageChanged: (index) {
                          // MODIF 4 : On utilise le Modulo (%) pour savoir sur quel point on est
                          // Si index est 1004 et qu'on a 4 items, 1004 % 4 = 0 (Le premier point)
                          setState(() => _realIndex = index % _testimonials.length);
                        },
                        
                        itemBuilder: (context, index) {
                          // MODIF 5 : Accès aux données avec le Modulo
                          final testimonialIndex = index % _testimonials.length;
                          
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
                            child: _TestimonialCard(data: _testimonials[testimonialIndex]),
                          );
                        },
                      ),
                    ),
                  ),

                  // Flèche Droite
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

              // --- INDICATEURS (Points) ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_testimonials.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    // MODIF 6 : On compare avec _realIndex
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

  Widget _buildArrowButton({required IconData icon, required VoidCallback onTap}) {
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

// --- WIDGET CARTE INTERNE ---
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
                children: List.generate(5, (index) => const Icon(Icons.star, color: AppColors.primary, size: 20)),
              ),
              const SizedBox(height: 24),
              Text(
                "\"${data['content']}\"",
                textAlign: TextAlign.center,
                style: AppTextStyles.body.copyWith(
                  fontSize: 18,
                  color: const Color(0xFF0F172A),
                  height: 1.6,
                ),
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
                    child: const Icon(Icons.person, color: Colors.grey, size: 30),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      Text(
                        data['role'],
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 14,
                        ),
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