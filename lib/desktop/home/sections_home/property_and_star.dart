import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../constants/colors.dart';
import '../../../widgets/custom_text.dart';
import '../../real_estate/details_real_estate.dart';

class PropertyAndStarSection extends StatelessWidget {
  const PropertyAndStarSection({super.key});

  static final List<Map<String, dynamic>> _properties = [
    {
      'image': 'assets/images/imagesWeb/hotel.png',
      'price': '450 000 €',
      'title': 'Villa Moderne avec Piscine',
      'location': 'Cannes, Alpes-Maritimes',
      'surface': '320 m²',
      'rooms': '5',
      'bathrooms': '3',
      'type': 'À VENDRE',
    },
    {
      'image': 'assets/images/imagesWeb/long_sejour.png',
      'price': '2 800 €/mois',
      'title': 'Appartement de Luxe Centre-Ville',
      'location': 'Paris 8ème',
      'surface': '120 m²',
      'rooms': '3',
      'bathrooms': '2',
      'type': 'À LOUER',
    },
    {
      'image': 'assets/images/imagesWeb/mini_villa.png',
      'price': '750 000 €',
      'title': 'Maison d\'Architecte Vue Mer',
      'location': 'Nice, Alpes-Maritimes',
      'surface': '450 m²',
      'rooms': '6',
      'bathrooms': '4',
      'type': 'À VENDRE',
    },
    {
      'image': 'assets/images/imagesWeb/maison_dhote.png',
      'price': '1 200 000 €',
      'title': 'Penthouse Exceptionnel',
      'location': 'Lyon, Rhône',
      'surface': '280 m²',
      'rooms': '4',
      'bathrooms': '3',
      'type': 'À VENDRE',
    },
    {
      'image': 'assets/images/imagesWeb/residence_alice.png',
      'price': '1 800 €/mois',
      'title': 'Loft Industriel Aménagé',
      'location': 'Bordeaux, Gironde',
      'surface': '150 m²',
      'rooms': '2',
      'bathrooms': '2',
      'type': 'À LOUER',
    },
    {
      'image': 'assets/images/imagesWeb/residence_crystal.png',
      'price': '320 000 €',
      'title': 'Studio avec Terrasse',
      'location': 'Marseille, Bouches-du-Rhône',
      'surface': '45 m²',
      'rooms': '1',
      'bathrooms': '1',
      'type': 'À VENDRE',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Adaptation de la largeur du conteneur global
    final double contentWidth = getValueForScreenType<double>(
      context: context,
      mobile: size.width * 0.95, // Un peu plus large sur mobile
      tablet: size.width * 0.9,
      desktop: size.width * 0.7,
    );

    return Center(
      child: SizedBox(
        width: contentWidth,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenTypeLayout.builder(
                mobile: (context) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "BIENS EN VEDETTE",
                          type: CustomTextType.buttonBlack,
                          fontSize: 14,
                        ),
                        SizedBox(height: 16),
                        CustomText(
                          text: "Découvrez Nos Propriétés",
                          type: CustomTextType.sectionTitle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/real-estate');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.background,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                            text: 'Voir Tous les Biens',
                            type: CustomTextType.buttonBlack,
                            fontSize: 16,
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, size: 18),
                        ],
                      ),
                    ),
                  ],
                ),
                desktop: (context) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "BIENS EN VEDETTE",
                            type: CustomTextType.buttonBlack,
                            fontSize: 14,
                          ),
                          SizedBox(height: 16),
                          CustomText(
                            text: "Découvrez Nos Propriétés",
                            type: CustomTextType.sectionTitle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/real-estate');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.background,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomText(
                              text: 'Voir Tous les Biens',
                              type: CustomTextType.buttonBlack,
                              fontSize: 16,
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, size: 18),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),

              // --- LOGIQUE DE GRILLE 600px / 800px ---
              LayoutBuilder(
                builder: (context, constraints) {
                  const double spacing = 24;
                  int columns;

                  // < 600px -> 1 colonne
                  if (constraints.maxWidth < 600) {
                    columns = 1;
                  }
                  // Entre 600 et 800 (inclus) -> 2 colonnes
                  else if (constraints.maxWidth <= 800) {
                    columns = 2;
                  }
                  // > 800 -> 3 colonnes
                  else {
                    columns = 3;
                  }

                  final double cardWidth =
                      (constraints.maxWidth - (spacing * (columns - 1))) /
                      columns;

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
    // Logique de couleur
    final String status = widget.property['type'].toString().toUpperCase();
    final Color statusColor = (status == 'À LOUER') ? Colors.blue : Colors.red;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          final Map<String, dynamic> propertyData = Map.from(widget.property);
          propertyData['status'] = widget.property['type'];

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailsRealEstatePage(property: propertyData),
            ),
          );
        },
        child: Container(
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
            mainAxisSize: MainAxisSize.min, // Empêche l'overflow vertical
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      image: DecorationImage(
                        image: AssetImage(widget.property['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Badges
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Wrap(
                      // Utilisation de Wrap pour éviter overflow badges
                      spacing: 8,
                      runSpacing: 4,
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
                            fontSize: 10,
                          ),
                        ),
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
                            fontSize: 10,
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
                  // Prix avec FittedBox pour éviter overflow
                  Positioned(
                    bottom: 12,
                    left: 12,
                    right: 12,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: CustomText(
                          text: widget.property['price'],
                          type: CustomTextType.cardTitle,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titre avec ellipsis
                    CustomText(
                      text: widget.property['title'],
                      type: CustomTextType.cardTitle,
                      fontSize: 16,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    // Localisation avec Expanded
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
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Détails avec Wrap au lieu de Row pour éviter overflow
                    Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        _buildDetailItem(
                          Icons.crop_free,
                          widget.property['surface'],
                        ),
                        _buildDetailItem(
                          Icons.bed_outlined,
                          '${widget.property['rooms']} ch.',
                        ),
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
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.grey.shade500),
        const SizedBox(width: 6),
        Flexible(
          child: CustomText(
            text: text,
            type: CustomTextType.sectionDescription,
            fontSize: 13,
            color: Colors.grey.shade600,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
