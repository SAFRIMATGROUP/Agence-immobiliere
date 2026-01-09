import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/typography.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/footer.dart';
import '../../widgets/navbar.dart';
import 'details_real_estate.dart';

class RealEstatePage extends StatefulWidget {
  const RealEstatePage({super.key});

  @override
  State<RealEstatePage> createState() => _RealEstatePageState();
}

class _RealEstatePageState extends State<RealEstatePage> {
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

  String _selectedTransaction = 'Toutes';
  String _selectedType = 'Tous les types';
  bool _showFilters = false;
  double _minPrice = 0;
  double _minSurface = 0;
  int _focusedIndex = -1;

  final List<String> _transactions = ['Toutes', 'A vendre', 'A louer'];

  final List<String> _types = [
    'Tous les types',
    'Appartement',
    'Maison',
    'Villa',
    'Terrain',
    'Local commercial',
  ];

  final List<Map<String, dynamic>> _properties = [
    {
      'id': 1,
      'title': 'Appartement T3 - Centre Ville',
      'location': 'Paris 8ème arrondissement',
      'price': '450 000 €',
      'image': 'assets/images/imagesWeb/hotel.png',
      'type': 'Appartement',
      'status': 'À VENDRE',
      'featured': true,
      'surface': '85 m²',
      'rooms': 3,
      'bathrooms': 1,
    },
    {
      'id': 2,
      'title': 'Maison 4 Chambres avec Jardin',
      'location': 'Lyon - 69000',
      'price': '650 000 €',
      'image': 'assets/images/imagesWeb/mini_villa.png',
      'type': 'Maison',
      'status': 'À VENDRE',
      'featured': false,
      'surface': '150 m²',
      'rooms': 4,
      'bathrooms': 2,
    },
    {
      'id': 3,
      'title': 'Studio Meublé - Quartier Latin',
      'location': 'Paris 5ème arrondissement',
      'price': '1 200 €/mois',
      'image': 'assets/images/imagesWeb/long_sejour.png',
      'type': 'Studio',
      'status': 'À LOUER',
      'featured': false,
      'surface': '28 m²',
      'rooms': 1,
      'bathrooms': 1,
    },
    {
      'id': 4,
      'title': 'Villa de Luxe avec Piscine',
      'location': 'Cannes - 06400',
      'price': '1 200 000 €',
      'image': 'assets/images/imagesWeb/hotel.png',
      'type': 'Villa',
      'status': 'À VENDRE',
      'featured': true,
      'surface': '280 m²',
      'rooms': 5,
      'bathrooms': 3,
    },
    {
      'id': 5,
      'title': 'Loft Industriel',
      'location': 'Marseille - 13001',
      'price': '380 000 €',
      'image': 'assets/images/imagesWeb/residence_alice.png',
      'type': 'Loft',
      'status': 'À VENDRE',
      'featured': false,
      'surface': '120 m²',
      'rooms': 2,
      'bathrooms': 2,
    },
    {
      'id': 6,
      'title': 'Appartement T2 - Bord de Mer',
      'location': 'Nice - 06000',
      'price': '850 €/mois',
      'image': 'assets/images/imagesWeb/residence_crystal.png',
      'type': 'Appartement',
      'status': 'À LOUER',
      'featured': false,
      'surface': '45 m²',
      'rooms': 2,
      'bathrooms': 1,
    },
    {
      'id': 7,
      'title': 'Grande Villa Familiale',
      'location': 'Ouagadougou - Ouaga 2000',
      'price': '350 000 000 FCFA',
      'image': 'assets/images/imagesWeb/mini_villa.png',
      'type': 'Villa',
      'status': 'À VENDRE',
      'featured': true,
      'surface': '450 m²',
      'rooms': 6,
      'bathrooms': 4,
    },
    {
      'id': 8,
      'title': 'Hôtel Ricardio - Centre Affaires',
      'location': 'Bobo-Dioulasso',
      'price': '1 200 000 FCFA/mois',
      'image': 'assets/images/imagesWeb/hotel_ricardio.png',
      'type': 'Local commercial',
      'status': 'À LOUER',
      'featured': false,
      'surface': '300 m²',
      'rooms': 10,
      'bathrooms': 8,
    },
    {
      'id': 9,
      'title': "Maison d'Hôte de Charme",
      'location': 'Koudougou',
      'price': '85 000 000 FCFA',
      'image': 'assets/images/imagesWeb/maison_dhote.png',
      'type': 'Maison',
      'status': 'À VENDRE',
      'featured': false,
      'surface': '200 m²',
      'rooms': 5,
      'bathrooms': 3,
    },
    {
      'id': 10,
      'title': 'Viva Hotel & Spa',
      'location': 'Ouagadougou - Centre',
      'price': '2 500 000 000 FCFA',
      'image': 'assets/images/imagesWeb/hotel_ricardio.png',
      'type': 'Local commercial',
      'status': 'À VENDRE',
      'featured': true,
      'surface': '1200 m²',
      'rooms': 25,
      'bathrooms': 25,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: Navbar(currentPage: 'real-estate', isScrolled: _isScrolled),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchAndFilters(),
            _buildPropertiesGrid(),
            const CustomFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 40, right: 40, top: 120, bottom: 80),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.secondary, Colors.white],
          stops: [0.3, 1.0],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomText(
            text: 'Nos Biens Immobiliers',
            type: CustomTextType.heroTitle,
          ),
          const SizedBox(height: 16),
          const SizedBox(
            width: 700,
            child: CustomText(
              text:
                  'Découvrez notre sélection exclusive de biens immobiliers à vendre et à louer dans les meilleures villes de France.',
              type: CustomTextType.sectionDescription,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilters() {
    final size = MediaQuery.of(context).size;

    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(top: 40),
        width: size.width * 0.6,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(flex: 2, child: _buildSearchBar()),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDropdown(
                    index: 0,
                    value: _selectedTransaction,
                    items: _transactions,
                    onChanged: (value) =>
                        setState(() => _selectedTransaction = value!),
                    hint: 'Transaction',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDropdown(
                    index: 1,
                    value: _selectedType,
                    items: _types,
                    onChanged: (value) =>
                        setState(() => _selectedType = value!),
                    hint: 'Type',
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: _showFilters
                        ? AppColors.primary
                        : const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _showFilters
                          ? AppColors.primary
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: TextButton.icon(
                    onPressed: () =>
                        setState(() => _showFilters = !_showFilters),
                    icon: Icon(
                      Icons.tune,
                      color: _showFilters ? Colors.black : Colors.grey.shade700,
                    ),
                    label: CustomText(
                      text: "Filtres",
                      type: CustomTextType.button,
                      color: _showFilters ? Colors.black : Colors.grey.shade700,
                    ),
                  ),
                ),
              ],
            ),
            if (_showFilters) ...[
              const SizedBox(height: 24),
              const Divider(height: 1),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _buildSliderFilter(
                      "Budget",
                      _minPrice,
                      0,
                      2000000,
                      (val) => setState(() => _minPrice = val),
                      (val) => "${val.round()} - 2 000 000 €",
                    ),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    child: _buildSliderFilter(
                      "Surface",
                      _minSurface,
                      0,
                      500,
                      (val) => setState(() => _minSurface = val),
                      (val) => "${val.round()} - 500 m²",
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSliderFilter(
    String label,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
    String Function(double) formatValue,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: label,
              type: CustomTextType.label,
              color: Colors.black,
            ),
            CustomText(
              text: formatValue(value),
              type: CustomTextType.label,
              color: AppColors.primary,
            ),
          ],
        ),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: Colors.black,
            thumbColor: Colors.white,
            overlayColor: AppColors.primary.withOpacity(0.12),
            valueIndicatorColor: AppColors.primary,
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 10,
              elevation: 4,
            ),
            trackHeight: 6,
          ),
          child: Slider(value: value, min: min, max: max, onChanged: onChanged),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Rechercher par ville...',
          // Using raw TextStyle from AppTypography because InputDecoration expects TextStyle
          hintStyle: AppTypography.sectionDescription.copyWith(
            color: Colors.grey,
          ),
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required int index,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required String hint,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isFocused = _focusedIndex == index;
        return Listener(
          onPointerDown: (_) => setState(() => _focusedIndex = index),
          child: Container(
            height: 50,
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isFocused ? AppColors.primary : Colors.grey.shade300,
                width: isFocused ? 2 : 1,
              ),
            ),
            child: PopupMenuButton<String>(
              offset: const Offset(0, 50),
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: value,
                        type: CustomTextType.label,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: isFocused
                          ? AppColors.primary
                          : Colors.grey.shade600,
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

  Widget _buildPropertiesGrid() {
    final size = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        width: size.width * 0.6,
        child: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: '${_properties.length} biens trouvés',
                    type: CustomTextType.label,
                    fontSize: 16,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              LayoutBuilder(
                builder: (context, constraints) {
                  const double spacing = 24;
                  final double cardWidth =
                      (constraints.maxWidth - (spacing * 2)) / 3;

                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: _properties.map((property) {
                      return PropertyCard(width: cardWidth, property: property);
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

class PropertyCard extends StatefulWidget {
  final double width;
  final Map<String, dynamic> property;

  const PropertyCard({super.key, required this.width, required this.property});

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  bool _isHovered = false;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    // Logique de couleur pour le statut
    final String status = widget.property['status'].toString().toUpperCase();
    final Color statusColor = (status == 'À LOUER') ? Colors.blue : Colors.red;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailsRealEstatePage(property: widget.property),
            ),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
          transformAlignment: Alignment.center,
          width: widget.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_isHovered ? 0.15 : 0.08),
                blurRadius: _isHovered ? 20 : 12,
                offset: Offset(0, _isHovered ? 8 : 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      width: double.infinity,
                      height: 200,
                      transform: Matrix4.identity()
                        ..scale(_isHovered ? 1.1 : 1.0),
                      transformAlignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.property['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: CustomText(
                            text: status,
                            type: CustomTextType.label,
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFD700),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const CustomText(
                            text: 'EN VEDETTE',
                            type: CustomTextType.label,
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: GestureDetector(
                      onTap: () => setState(() => _isFavorite = !_isFavorite),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: _isFavorite ? Colors.red : Colors.grey,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: CustomText(
                      text: widget.property['price'],
                      type: CustomTextType.cardTitle,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: widget.property['title'],
                      type: CustomTextType.cardTitle,
                      fontSize: 16,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: CustomText(
                            text: widget.property['location'],
                            type: CustomTextType.sectionDescriptionBlack,
                            fontSize: 13,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        _buildDetailItem(
                          Icons.crop_free,
                          widget.property['surface'],
                        ),
                        const SizedBox(width: 16),
                        _buildDetailItem(
                          Icons.bed_outlined,
                          '${widget.property['rooms']} ch.',
                        ),
                        const SizedBox(width: 16),
                        _buildDetailItem(
                          Icons.bathtub_outlined,
                          '${widget.property['bathrooms']} sdb',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey.shade500),
        const SizedBox(width: 6),
        CustomText(
          text: text,
          type: CustomTextType
              .sectionDescription, // Or caption with override if needed
          color: Colors.grey.shade600,
        ),
      ],
    );
  }
}
