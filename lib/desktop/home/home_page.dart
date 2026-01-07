import 'package:flutter/material.dart';
import '../../constants/colors.app.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/navbar.dart';
import 'sections_home/expertise_section.dart'; // Import de la section expertise
import 'sections_home/property_and_star.dart'; // Import de la section propriétés
import 'sections_home/why_choose_us.dart'; // Import de la section pourquoi nous choisir
import 'sections_home/testimonials.dart'; // Import de la section témoignages
import 'sections_home/ready_to_begin.dart'; // Import de la section ready to begin
import '../../widgets/footer.dart'; // Import du footer

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
    // Taille totale de l'écran
    final size = MediaQuery.of(context).size;
    // Largeur de 60% (utilisée uniquement pour la Navbar et le Hero)
    final double contentWidth = size.width * 0.6;

    return Scaffold(
      backgroundColor:
          Colors.transparent, // Changé pour voir si ça vient du Scaffold
      body: Stack(
        children: [
          // ---------------------------------------------------------
          // CONTENU SCROLLABLE
          // ---------------------------------------------------------
          Positioned.fill(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // =======================================================
                  // 1. SECTION DU HAUT (Image de fond + Hero + Stats)
                  // =======================================================
                  Container(
                    width: size.width, // Prend toute la largeur de l'écran
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
                      // Ici on CENTRE et on LIMITE à 60% le contenu sur l'image
                      child: Center(
                        child: SizedBox(
                          width: contentWidth,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 120,
                              ), // Place pour la navbar
                              _buildHeroSection(),
                              _buildSearchBar(),
                              _buildStatisticsSection(),
                              const SizedBox(
                                height: 80,
                              ), // Marge bas de l'image
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // =======================================================
                  // 2. SECTION EXPERTISE (Sous l'image)
                  // =======================================================
                  Container(
                    width: size.width, // Prend toute la largeur disponible
                    color: Colors.white, // Fond blanc
                    child: const ExpertiseSection(),
                  ),

                  // =======================================================
                  // 3. SECTION PROPRIÉTÉS EN VEDETTE
                  // =======================================================
                  Container(
                    width: size.width, // Prend toute la largeur disponible
                    color: const Color(0xFFF8FAFC), // Fond gris clair
                    child: const PropertyAndStarSection(),
                  ),

                  // =======================================================
                  // 4. SECTION POURQUOI NOUS CHOISIR
                  // =======================================================
                  Container(
                    width: size.width, // Prend toute la largeur disponible
                    color: Colors.white, // Fond blanc
                    child: const WhyChooseUsSection(),
                  ),

                  // =======================================================
                  // 5. SECTION TÉMOIGNAGES
                  // =======================================================
                  Container(
                    width: size.width, // Prend toute la largeur disponible
                    color: Colors.white, // Fond blanc
                    child: const TestimonialsSection(),
                  ),

                  // =======================================================
                  // 6. SECTION PRÊT À COMMENCER
                  // =======================================================
                  const ReadyToBeginSection(),

                  // =======================================================
                  // 7. FOOTER
                  // =======================================================
                  const CustomFooter(),
                ],
              ),
            ),
          ),

          // ---------------------------------------------------------
          // NAVBAR (Fixe et 100% de la largeur)
          // ---------------------------------------------------------
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(currentPage: 'home', isScrolled: _isScrolled),
          ),
        ],
      ),
    );
  }

  // --- WIDGETS LOCAUX ---

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
                const CustomText(
                  text: 'Agence immobilière de confiance depuis 2010',
                  type: CustomTextType.homeHeroTagline,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const CustomText(
            text: 'Trouvez le Bien\nde Vos Rêves',
            type: CustomTextType.homeHeroTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const CustomText(
            text:
                'Expertise, innovation et accompagnement personnalisé pour tous vos projets immobiliers. Vente, location, investissement et gestion locative.',
            type: CustomTextType.homeHeroDescription,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.background,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Row(
                  children: [
                    CustomText(
                      text: 'Voir les Biens',
                      type: CustomTextType.homeHeroButton,
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 18),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 2),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const CustomText(
                  text: 'Confier Mon Bien',
                  type: CustomTextType.homeHeroButtonOutline,
                ),
              ),
              const SizedBox(width: 20),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 2),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const CustomText(
                  text: 'Investir',
                  type: CustomTextType.homeHeroButtonOutline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 180, 174, 174).withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
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
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ), // TextFormField hint keeps TextStyle
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
                      type: CustomTextType.searchButton,
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
                            ? CustomTextType.searchDropdownSelected
                            : CustomTextType.searchDropdownNormal,
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
                        type: CustomTextType.searchDropdownNormal,
                        overflow: TextOverflow.ellipsis,
                        // Override color for hint if needed, handled by default style or dedicated type
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        CustomText(text: number, type: CustomTextType.homeStatNumber),
        const SizedBox(height: 8),
        CustomText(text: label, type: CustomTextType.homeStatLabel),
      ],
    );
  }
}
