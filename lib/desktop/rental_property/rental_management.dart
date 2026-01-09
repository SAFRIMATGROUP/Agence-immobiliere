import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/footer.dart';
import '../../widgets/navbar.dart';

import 'sections_rental_property/our_services.dart';
import 'sections_rental_property/our_process.dart';
import 'sections_rental_property/your_advantage.dart';
import 'sections_rental_property/ready_to_delegate.dart';

class RentalManagementPage extends StatefulWidget {
  const RentalManagementPage({super.key});
  // ...

  @override
  State<RentalManagementPage> createState() => _RentalManagementPageState();
}

class _RentalManagementPageState extends State<RentalManagementPage> {
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
      appBar: Navbar(currentPage: 'rental', isScrolled: _isScrolled),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildHeader(),
            const OurServicesSection(),
            const OurProcessSection(),
            const YourAdvantageSection(),
            const ReadyToDelegateSection(),
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.secondary,
            Colors.white, // Blanc pur en bas
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
                text: 'GESTION LOCATIVE',
                type: CustomTextType.sectionTagline,
                color: Color(0xFFDAA520),
              ),
              const SizedBox(height: 24),
              const CustomText(
                text: 'Confiez-nous la Gestion\nde Votre Bien',
                type: CustomTextType.heroTitle,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 24),
              const CustomText(
                text:
                    'Propriétaires, libérez-vous des contraintes de la gestion locative. Notre équipe d\'experts s\'occupe de tout pour maximiser vos revenus et préserver votre patrimoine.',
                type: CustomTextType.sectionDescription,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildCTAButton(
                    'Confier Mon Bien',
                    AppColors.primary,
                    Colors.black,
                    icon: Icons.arrow_forward,
                  ),
                  const SizedBox(width: 20),
                  _buildCTAButton(
                    'Nous Contacter',
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
