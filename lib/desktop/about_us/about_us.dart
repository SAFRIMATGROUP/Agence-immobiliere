import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/navbar.dart';
import '../../widgets/footer.dart';
import 'our_story.dart';
import 'our_adn.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 50 && !_isScrolled) {
      setState(() => _isScrolled = true);
    } else if (_scrollController.offset <= 50 && _isScrolled) {
      setState(() => _isScrolled = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: Navbar(currentPage: 'about', isScrolled: _isScrolled),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // HEADER SECTION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 120,
              ),
              decoration: const BoxDecoration(color: AppColors.secondary),
              child: Center(
                child: SizedBox(
                  width: size.width * 0.70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'À PROPOS DE NOUS',
                        type: CustomTextType.sectionTagline,
                      ),
                      const SizedBox(height: 24),
                      const CustomText(
                        text: 'Votre Partenaire Immobilier\nde Confiance',
                        type: CustomTextType.heroTitle,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 24),
                      const SizedBox(
                        width: 600,
                        child: CustomText(
                          text:
                              'Depuis plus de 15 ans, ImmoElite accompagne ses clients dans tous leurs projets immobiliers avec expertise, passion et engagement.',
                          type: CustomTextType.sectionDescription,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Our Story Section
            const OurStorySection(),

            // Our ADN Section
            const OurAdnSection(),

            // Placeholder for other sections
            const SizedBox(height: 100),

            const CustomFooter(),
          ],
        ),
      ),
    );
  }
}
