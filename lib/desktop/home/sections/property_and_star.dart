import 'package:flutter/material.dart';
import '../../../constants/colors.app.dart';

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
      'isFeatured': true,
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
      'isFeatured': true,
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
      'isFeatured': true,
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
      'isFeatured': true,
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
      'isFeatured': true,
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
      'isFeatured': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Center(
      child: SizedBox(
        width: size.width * 0.6, // 60% de la largeur totale
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // En-tête avec titre et bouton
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Titre de la section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "BIENS EN VEDETTE",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Découvrez Nos Propriétés",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                            fontFamily: 'Serif',
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Bouton "Voir Tous les Biens"
                  Padding(
                    padding: const EdgeInsets.only(top: 90), // Plus d'espace pour aligner avec "Découvrez Nos Propriétés"
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.background,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Voir Tous les Biens',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, size: 18),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 60),
              
              // Grille de propriétés
              LayoutBuilder(
                builder: (context, constraints) {
                  const double spacing = 24;
                  final double cardWidth = (constraints.maxWidth - (spacing * 2)) / 3;
                  
                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: _properties.map((property) {
                      return PropertyCard(
                        width: cardWidth,
                        property: property,
                      );
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

  const PropertyCard({
    super.key,
    required this.width,
    required this.property,
  });

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  bool _isHovered = false;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
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
          children: [
            // Image avec tags et prix
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    image: DecorationImage(
                      image: AssetImage(widget.property['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                
                // Tags en haut alignés
                Positioned(
                  top: 12,
                  left: 12,
                  child: Row(
                    children: [
                      // Tag type (À VENDRE/À LOUER)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: widget.property['type'] == 'À VENDRE' 
                              ? Colors.green 
                              : Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          widget.property['type'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      
                      // Tag EN VEDETTE
                      if (widget.property['isFeatured'] == true) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'EN VEDETTE',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                
                // Bouton favori en haut à droite
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
                        size: 20,
                      ),
                    ),
                  ),
                ),
                
                // Prix en bas sur l'image
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: Text(
                    widget.property['price'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 1),
                          blurRadius: 2,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            
            // Contenu de la carte
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Titre
                  Text(
                    widget.property['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0F172A),
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  
                  // Localisation
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          widget.property['location'],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  
                  // Détails (surface, pièces, salles de bain)
                  Row(
                    children: [
                      _buildDetailItem(Icons.square_foot, widget.property['surface']),
                      const SizedBox(width: 16),
                      _buildDetailItem(Icons.bed, '${widget.property['rooms']} p.'),
                      const SizedBox(width: 16),
                      _buildDetailItem(Icons.bathtub, '${widget.property['bathrooms']} s.d.'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}