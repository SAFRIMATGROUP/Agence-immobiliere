import 'package:flutter/material.dart';
import '../../constants/colors.app.dart';
import 'sections/expertise_section.dart'; // Import de la section expertise
import 'sections/property_and_star.dart'; // Import de la section propriétés
import 'sections/why_choose_us.dart'; // Import de la section pourquoi nous choisir
import 'sections/testimonials.dart'; // Import de la section témoignages
import 'sections/ready_to_begin.dart'; // Import de la section ready to begin

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

  @override
  void initState() {
    super.initState();
    _cityFocusNode.addListener(() {
      setState(() {
        _focusedIndex = _cityFocusNode.hasFocus ? 2 : -1;
      });
    });
  }

  @override
  void dispose() {
    _cityFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Taille totale de l'écran
    final size = MediaQuery.of(context).size;
    // Largeur de 60% (utilisée uniquement pour la Navbar et le Hero)
    final double contentWidth = size.width * 0.6; 

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // ---------------------------------------------------------
          // CONTENU SCROLLABLE
          // ---------------------------------------------------------
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // =======================================================
                  // 1. SECTION DU HAUT (Image de fond + Hero + Stats)
                  // =======================================================
                  Container(
                    width: size.width, // Prend toute la largeur de l'écran
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/imagesWeb/baniere.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.8),
                          ],
                        ),
                      ),
                      // Ici on CENTRE et on LIMITE à 60% le contenu sur l'image
                      child: Center(
                        child: SizedBox(
                          width: contentWidth, 
                          child: Column(
                            children: [
                              const SizedBox(height: 120), // Place pour la navbar
                              _buildHeroSection(),
                              _buildSearchBar(),
                              _buildStatisticsSection(),
                              const SizedBox(height: 80), // Marge bas de l'image
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
                  
                  // Espace ou Footer ici plus tard...
                  Container(height: 100, color: Colors.white), 
                ],
              ),
            ),
          ),

          // ---------------------------------------------------------
          // NAVBAR (Fixe et centrée à 60%)
          // ---------------------------------------------------------
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: contentWidth, // On garde la navbar alignée avec le Hero
                child: _buildNavbar(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGETS LOCAUX ---

  Widget _buildNavbar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black.withOpacity(0.6), Colors.transparent],
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'IM',
              style: TextStyle(
                color: AppColors.background,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'ImmoElite',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          _buildNavItem('Accueil'),
          _buildNavItem('Biens'),
          _buildNavItem('Services'),
          _buildNavItem('Location Locative'),
          _buildNavItem('Investir'),
          _buildNavItem('À Propos'),
          _buildNavItem('Contact'),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.background,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const Text('Voir les Biens'),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
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
                const Text(
                  'Agence immobilière de confiance depuis 2010',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.bold,
                height: 1.2,
                shadows: [
                  Shadow(offset: Offset(0, 2), blurRadius: 4, color: Colors.black45),
                ],
              ),
              children: [
                TextSpan(
                  text: 'Trouvez le Bien\n',
                  style: TextStyle(color: Colors.white),
                ),
                TextSpan(
                  text: 'de Vos Rêves',
                  style: TextStyle(color: AppColors.primary),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const SizedBox(
            child: Text(
              'Expertise, innovation et accompagnement personnalisé pour tous vos projets immobiliers. Vente, location, investissement et gestion locative.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
            ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Row(
                  children: [
                    Text('Voir les Biens', style: TextStyle(fontWeight: FontWeight.bold)),
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
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Confier Mon Bien', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 20),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Investir', style: TextStyle(fontWeight: FontWeight.bold)),
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
              items: ['Appartement', 'Maison', 'Villa', 'Terrain', 'Local commercial'],
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
                  color: _focusedIndex == 2 ? AppColors.primary : Colors.transparent,
                  width: 2,
                ),
              ),
              child: TextFormField(
                focusNode: _cityFocusNode,
                decoration: const InputDecoration(
                  hintText: 'Ville ou code postal',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                    Text(
                      'Rechercher',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
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
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: isSelected
                          ? BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(6),
                            )
                          : null,
                      child: Text(
                        item,
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.black87,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
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
                      child: Text(
                        value ?? hint,
                        style: TextStyle(
                          color: value == null ? Colors.grey[700] : Colors.black,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
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
        Text(
          number,
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 48,
            fontWeight: FontWeight.bold,
            shadows: [Shadow(offset: Offset(0, 2), blurRadius: 4, color: Colors.black)],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            shadows: [Shadow(offset: Offset(0, 1), blurRadius: 2, color: Colors.black)],
          ),
        ),
      ],
    );
  }
}