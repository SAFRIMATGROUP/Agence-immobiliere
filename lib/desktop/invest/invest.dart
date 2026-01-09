import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/footer.dart';
import '../../widgets/navbar.dart';
import 'sections_invest/our_solutions.dart';
import 'sections_invest/simulator.dart';
import 'sections_invest/why_invest_with_us.dart';
import 'sections_invest/ready_to_invest.dart';

class InvestPage extends StatefulWidget {
  const InvestPage({super.key});

  @override
  State<InvestPage> createState() => _InvestPageState();
}

class _InvestPageState extends State<InvestPage> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: Navbar(currentPage: 'invest', isScrolled: _isScrolled),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildHeader(),
            const OurSolutionsSection(),
            const SimulatorSection(),
            const WhyInvestWithUsSection(),
            const ReadyToInvestSection(),
            const CustomFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 120),
      // Same decoration as RentalManagementPage
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.secondary,
            Colors.white, // Pure white at bottom
          ],
          stops: [0.3, 1.0],
        ),
      ),
      child: Center(
        child: SizedBox(
          width: size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'INVESTISSEMENT IMMOBILIER',
                type: CustomTextType.sectionTagline,
                color: Color(0xFFDAA520),
              ),
              const SizedBox(height: 24),
              const CustomText(
                text: 'Construisez Votre\nPatrimoine',
                type: CustomTextType.heroTitle,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 24),
              const CustomText(
                text:
                    'Investir dans l\'immobilier est l\'un des moyens les plus sûrs de construire votre patrimoine. Découvrez nos opportunités d\'investissement et bénéficiez d\'un accompagnement personnalisé.',
                type: CustomTextType.sectionDescription,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildCTAButton(
                    'Simuler Mon Investissement',
                    AppColors.primary,
                    Colors.black,
                    icon: Icons.calculate_outlined,
                  ),
                  const SizedBox(width: 20),
                  _buildCTAButton(
                    'Contacter un Expert',
                    Colors.transparent,
                    Colors.white,
                    isOutline: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCTAButton(
    String text,
    Color bgColor,
    Color textColor, {
    bool isOutline = false,
    IconData? icon,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
          border: isOutline
              ? Border.all(color: Colors.white, width: 1.5)
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: text,
              type: CustomTextType.button,
              color: textColor,
              fontSize: 14,
            ),
            if (icon != null) ...[
              const SizedBox(width: 8),
              Icon(icon, color: textColor, size: 18),
            ],
          ],
        ),
      ),
    );
  }
}
