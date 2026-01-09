import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../constants/colors.dart';
import '../../constants/typography.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/navbar.dart';
import 'sections_home/expertise_section.dart';
import 'sections_home/property_and_star.dart';
import 'sections_home/why_choose_us.dart';
import 'sections_home/testimonials.dart';
import 'sections_home/ready_to_begin.dart';
import '../../widgets/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedProperty;
  String? _selectedTransaction;
  int _focusedIndex = -1;
  final FocusNode _cityFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _cityFocusNode.addListener(() {
      setState(() {
        _focusedIndex = _cityFocusNode.hasFocus ? 2 : -1;
      });
    });

    _scrollController.addListener(() {
      setState(() {
        _isScrolled = _scrollController.offset > 70;
      });
    });
  }

  @override
  void dispose() {
    _cityFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // On ajuste la largeur du contenu global
    final double contentWidth = getValueForScreenType<double>(
      context: context,
      mobile: size.width * 0.9,
      tablet: size.width * 0.85,
      desktop: size.width * 0.6,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/imagesWeb/baniere.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.4),
                          ],
                        ),
                      ),
                      child: Center(
                        child: SizedBox(
                          width: contentWidth,
                          child: Column(
                            children: [
                              const SizedBox(height: 120),
                              _buildHeroSection(),
                              _buildSearchBar(
                                size.width,
                              ), // On passe la largeur ici
                              _buildStatisticsSection(),
                              const SizedBox(height: 80),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: size.width,
                    color: Colors.white,
                    child: const ExpertiseSection(),
                  ),

                  Container(
                    width: size.width,
                    color: const Color(0xFFF8FAFC),
                    // Assure-toi que PropertyAndStarSection n'a plus 'const' devant
                    child: PropertyAndStarSection(),
                  ),

                  Container(
                    width: size.width,
                    color: Colors.white,
                    child: const WhyChooseUsSection(),
                  ),

                  Container(
                    width: size.width,
                    color: Colors.white,
                    child: const TestimonialsSection(),
                  ),

                  const ReadyToBeginSection(),

                  const CustomFooter(),
                ],
              ),
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(currentPage: 'home', isScrolled: _isScrolled),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: AppColors.primary),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const CustomText(
                        text: 'IM',
                        type: CustomTextType.label,
                        fontWeight: FontWeight.bold,
                        color: AppColors.background,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const CustomText(
                      text: 'ImmoElite',
                      type: CustomTextType.sectionTitle,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              _buildDrawerItem(context, 'Accueil', '/home'),
              _buildDrawerItem(context, 'Biens', '/real-estate'),
              _buildDrawerItem(
                context,
                'Gestion Locative',
                '/rental-management',
              ),
              _buildDrawerItem(context, 'Investir', '/invest'),
              _buildDrawerItem(context, 'À Propos', '/about'),
              _buildDrawerItem(context, 'Contact', '/contact'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, String route) {
    return ListTile(
      title: CustomText(text: title, type: CustomTextType.label, fontSize: 16),
      onTap: () {
        Navigator.pop(context); // Close drawer
        if (ModalRoute.of(context)?.settings.name != route) {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }

  Widget _buildHeroSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 234, 238, 241).withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                const Flexible(
                  child: CustomText(
                    text: 'Agence immobilière de confiance depuis 2010',
                    type: CustomTextType.sectionTagline,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTypography.heroTitle.copyWith(
                fontSize: getValueForScreenType<double>(
                  context: context,
                  mobile: 36,
                  desktop: 56,
                ),
              ),
              children: const [
                TextSpan(text: 'Trouvez le Bien\n'),
                TextSpan(
                  text: 'de Vos Rêves',
                  style: TextStyle(color: AppColors.primary),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const CustomText(
            text:
                'Expertise, innovation et accompagnement personnalisé pour tous vos projets immobiliers. Vente, location, investissement et gestion locative.',
            type: CustomTextType.sectionDescription,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ScreenTypeLayout.builder(
            mobile: (context) => Column(
              children: [
                _buildHeroButton('Voir les Biens', true),
                const SizedBox(height: 16),
                _buildHeroButton('Confier Mon Bien', false),
                const SizedBox(height: 16),
                _buildHeroButton('Investir', false),
              ],
            ),
            desktop: (context) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildHeroButton('Voir les Biens', true),
                const SizedBox(width: 20),
                _buildHeroButton('Confier Mon Bien', false),
                const SizedBox(width: 20),
                _buildHeroButton('Investir', false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroButton(String text, bool isPrimary) {
    if (isPrimary) {
      return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.background,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(text: text, type: CustomTextType.button),
            if (text == 'Voir les Biens') ...[
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward, size: 18),
            ],
          ],
        ),
      );
    } else {
      return OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: CustomText(text: text, type: CustomTextType.button),
      );
    }
  }

  // --- MODIFICATION ICI ---
  Widget _buildSearchBar(double screenWidth) {
    // Condition stricte : si écran < 900px => Vertical, sinon Horizontal
    bool isVertical = screenWidth < 1200;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 180, 174, 174).withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: isVertical
          // AFFICHAGE VERTICAL (Mobile / Tablette < 900px)
          ? Column(
              children: [
                _buildCustomDropdown(
                  index: 0,
                  hint: 'Appartement',
                  value: _selectedProperty,
                  items: [
                    'Appartement',
                    'Maison',
                    'Villa',
                    'Terrain',
                    'Local commercial',
                  ],
                  onChanged: (val) {
                    setState(() => _selectedProperty = val);
                  },
                ),
                const SizedBox(height: 12),
                _buildCustomDropdown(
                  index: 1,
                  hint: 'Transaction',
                  value: _selectedTransaction,
                  items: ['À vendre', 'À louer'],
                  onChanged: (val) {
                    setState(() => _selectedTransaction = val);
                  },
                ),
                const SizedBox(height: 12),
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _focusedIndex == 2
                          ? AppColors.primary
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: TextFormField(
                    focusNode: _cityFocusNode,
                    decoration: const InputDecoration(
                      hintText: 'Ville ou code postal',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4A017),
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search, size: 20),
                        SizedBox(width: 8),
                        CustomText(
                          text: 'Rechercher',
                          type: CustomTextType.button,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          // AFFICHAGE HORIZONTAL (Desktop >= 900px)
          : Row(
              children: [
                Expanded(
                  child: _buildCustomDropdown(
                    index: 0,
                    hint: 'Appartement',
                    value: _selectedProperty,
                    items: [
                      'Appartement',
                      'Maison',
                      'Villa',
                      'Terrain',
                      'Local commercial',
                    ],
                    onChanged: (val) {
                      setState(() => _selectedProperty = val);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildCustomDropdown(
                    index: 1,
                    hint: 'Transaction',
                    value: _selectedTransaction,
                    items: ['À vendre', 'À louer'],
                    onChanged: (val) {
                      setState(() => _selectedTransaction = val);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: _focusedIndex == 2
                            ? AppColors.primary
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: TextFormField(
                      focusNode: _cityFocusNode,
                      decoration: const InputDecoration(
                        hintText: 'Ville ou code postal',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD4A017),
                        foregroundColor: Colors.black,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search, size: 20),
                          SizedBox(width: 8),
                          CustomText(
                            text: 'Rechercher',
                            type: CustomTextType.button,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildCustomDropdown({
    required int index,
    required String hint,
    required String? value,
    required List<String> items,
    required Function(String) onChanged,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isFocused = _focusedIndex == index;
        return Listener(
          onPointerDown: (_) => setState(() => _focusedIndex = index),
          child: Container(
            height: 56,
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isFocused ? AppColors.primary : Colors.transparent,
                width: 2,
              ),
            ),
            child: PopupMenuButton<String>(
              offset: const Offset(0, 60),
              constraints: BoxConstraints.tightFor(width: constraints.maxWidth),
              color: Colors.white,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onCanceled: () => setState(() => _focusedIndex = -1),
              onSelected: (val) {
                setState(() => _focusedIndex = -1);
                onChanged(val);
              },
              itemBuilder: (context) => items.map((item) {
                final isSelected = item == value;
                return PopupMenuItem(
                  value: item,
                  child: Center(
                    child: Container(
                      width: constraints.maxWidth * 0.9,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      decoration: isSelected
                          ? BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(6),
                            )
                          : null,
                      child: CustomText(
                        text: item,
                        type: isSelected
                            ? CustomTextType.label
                            : CustomTextType.label,
                      ),
                    ),
                  ),
                );
              }).toList(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: value ?? hint,
                        type: CustomTextType.label,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: isFocused ? AppColors.primary : Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatisticsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        spacing: 30,
        runSpacing: 30,
        children: [
          _buildStatItem('500+', 'Biens vendus'),
          _buildStatItem('15+', 'Années d\'expérience'),
          _buildStatItem('98%', 'Clients satisfaits'),
          _buildStatItem('50+', 'Experts dédiés'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String number, String label) {
    return Column(
      children: [
        CustomText(
          text: number,
          type: CustomTextType.heroTitle, // Adapte selon tes types
          color: AppColors.primary,
        ),
        const SizedBox(height: 8),
        CustomText(
          text: label,
          type: CustomTextType.label,
          color: Colors.white,
        ),
      ],
    );
  }
}
