import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/footer.dart';
import '../../widgets/navbar.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
// import 'package:url_launcher/url_launcher.dart'; // <--- Décommente si tu as installé url_launcher

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final ScrollController _scrollController = ScrollController();

  // 1. CRÉATION DU CONTRÔLEUR DE CARTE
  final MapController _mapController = MapController(); // <--- AJOUT

  bool _isScrolled = false;

  // 2. ÉTAT POUR LA VUE SATELLITE
  bool _isSatellite = false; // <--- AJOUT
  double _currentZoom = 13.0; // <--- AJOUT pour suivre le zoom

  // Coordonnées de l'agence (Ouagadougou)
  final LatLng _agencyLocation = const LatLng(12.3714, -1.5197);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _mapController.dispose(); // <--- Bien disposer le contrôleur
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 50 && !_isScrolled) {
      setState(() => _isScrolled = true);
    } else if (_scrollController.offset <= 50 && _isScrolled) {
      setState(() => _isScrolled = false);
    }
  }

  // --- LOGIQUE DU ZOOM ---
  void _zoomIn() {
    setState(() {
      _currentZoom++;
      _mapController.move(_agencyLocation, _currentZoom);
    });
  }

  void _zoomOut() {
    setState(() {
      _currentZoom--;
      _mapController.move(_agencyLocation, _currentZoom);
    });
  }

  // --- LOGIQUE AGRANDIR LE PLAN ---
  Future<void> _openMapExternal() async {
    // Si tu as le package url_launcher, utilise ce code :
    /*
    final Uri googleMapsUrl = Uri.parse("https://www.google.com/maps/search/?api=1&query=${_agencyLocation.latitude},${_agencyLocation.longitude}");
    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    }
    */
    print(
      "Ouvrir Google Maps vers ${_agencyLocation.latitude}, ${_agencyLocation.longitude}",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: Navbar(currentPage: 'contact', isScrolled: _isScrolled),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildHeader(),
            _buildContactContent(),
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
          colors: [AppColors.secondary, Colors.white],
          stops: [0.3, 1.0],
        ),
      ),
      child: Center(
        child: SizedBox(
          width: size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const CustomText(
                text: 'Contactez-Nous',
                type: CustomTextType.heroTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const CustomText(
                text:
                    'Notre équipe est à votre disposition pour répondre à toutes vos questions et vous accompagner dans votre projet immobilier.',
                type: CustomTextType.sectionDescription,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactContent() {
    final size = MediaQuery.of(context).size;
    final contentWidth = size.width * 0.6;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: SizedBox(
        width: contentWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'Nos Coordonnées',
                    type: CustomTextType.sectionTitle,
                    color: Color(0xFF0F172A),
                    fontSize: 28,
                  ),
                  const SizedBox(height: 16),
                  const CustomText(
                    text:
                        'N\'hésitez pas à nous contacter par téléphone, email ou à venir directement nous rendre visite à notre agence.',
                    type: CustomTextType.sectionDescriptionBlack,
                    fontSize: 14,
                    color: Color(0xFF64748B),
                  ),
                  const SizedBox(height: 32),
                  _buildContactInfoItem(
                    Icons.phone_outlined,
                    'Téléphone',
                    '+33 1 23 45 67 89',
                  ),
                  const SizedBox(height: 24),
                  _buildContactInfoItem(
                    Icons.email_outlined,
                    'Email',
                    'contact@immoelite.fr',
                  ),
                  const SizedBox(height: 24),
                  _buildContactInfoItem(
                    Icons.location_on_outlined,
                    'Adresse',
                    '123 Avenue des Champs-Élysées\n75008 Paris, France',
                  ),
                  const SizedBox(height: 24),
                  _buildContactInfoItem(
                    Icons.access_time,
                    'Horaires',
                    'Lundi - Vendredi : 09:00 - 19:00\nSamedi : 10:00 - 17:00',
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF25D366),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.message, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        CustomText(
                          text: 'Discuter sur WhatsApp',
                          type: CustomTextType.button,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // --- LA CARTE MAP ---
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          FlutterMap(
                            mapController:
                                _mapController, // <--- CONNEXION DU CONTRÔLEUR
                            options: MapOptions(
                              initialCenter: _agencyLocation,
                              initialZoom: _currentZoom,
                            ),
                            children: [
                              TileLayer(
                                // <--- CHANGEMENT DYNAMIQUE DE L'URL (Plan vs Satellite)
                                urlTemplate: _isSatellite
                                    ? 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}' // Satellite (Esri)
                                    : 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // Plan Standard (OSM)
                                userAgentPackageName: 'com.safrimat.app',
                              ),
                              MarkerLayer(
                                markers: [
                                  Marker(
                                    point: _agencyLocation,
                                    width: 80,
                                    height: 80,
                                    child: const Icon(
                                      Icons.location_on,
                                      color: AppColors.primary,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Top Left Info Card + Link
                          Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Agence Safrimat",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  // BOUTON AGRANDIR LE PLAN
                                  InkWell(
                                    // <--- Rend le texte cliquable
                                    onTap: _openMapExternal,
                                    child: Text(
                                      "Agrandir le plan",
                                      style: TextStyle(
                                        color: Colors.blue[700],
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // BOUTON SATELLITE / PLAN
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: InkWell(
                              // <--- Rend l'icône cliquable
                              onTap: () {
                                setState(() {
                                  _isSatellite =
                                      !_isSatellite; // <--- Bascule le mode
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: _isSatellite
                                      ? Colors.blue
                                      : Colors
                                            .grey[800], // Change la couleur si actif
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  _isSatellite
                                      ? Icons.map
                                      : Icons.satellite_alt, // Change l'icône
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),

                          // BOUTONS ZOOM (+ / -)
                          Positioned(
                            bottom: 20,
                            right: 10,
                            child: Column(
                              children: [
                                _buildMapControlButton(
                                  Icons.add,
                                  _zoomIn,
                                ), // <--- Connecte la fonction
                                const SizedBox(height: 4),
                                _buildMapControlButton(
                                  Icons.remove,
                                  _zoomOut,
                                ), // <--- Connecte la fonction
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 60),
            // Colonne Droite : Formulaire (Inchangé pour raccourcir le code affiché, mais inclus dans la logique)
            Expanded(flex: 1, child: _buildFormSection()),
          ],
        ),
      ),
    );
  }

  // J'ai extrait le formulaire dans une méthode pour lisibilité
  Widget _buildFormSection() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'Envoyez-nous un Message',
            type: CustomTextType.cardTitle,
            fontSize: 24,
          ),
          const SizedBox(height: 12),
          const CustomText(
            text:
                'Remplissez le formulaire ci-dessous et nous vous répondrons dans les meilleurs délais.',
            type: CustomTextType.sectionDescriptionBlack,
            fontSize: 14,
            color: Color(0xFF64748B),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(child: _buildInputField('Prénom', 'Jean')),
              const SizedBox(width: 20),
              Expanded(child: _buildInputField('Nom', 'Dupont')),
            ],
          ),
          const SizedBox(height: 20),
          _buildInputField('Email', 'jean.dupont@email.com'),
          const SizedBox(height: 20),
          _buildInputField('Téléphone (optionnel)', '+33 6 12 34 56 78'),
          const SizedBox(height: 20),
          _buildInputField('Message', 'Votre message...', maxLines: 5),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const CustomText(
                text: 'Envoyer',
                type: CustomTextType.button,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfoItem(IconData icon, String title, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF9E6),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: title,
              type: CustomTextType.label,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 4),
            CustomText(
              text: content,
              type: CustomTextType.sectionDescriptionBlack,
              fontSize: 14,
            ),
          ],
        ),
      ],
    );
  }

  // --- WIDGET BOUTON ZOOM MODIFIÉ ---
  Widget _buildMapControlButton(IconData icon, VoidCallback onTap) {
    // <--- Ajout du paramètre onTap
    return InkWell(
      // <--- Rend le bouton cliquable
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Center(child: Icon(icon, color: Colors.grey[700], size: 18)),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    String placeholder, {
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: label,
          type: CustomTextType.label,
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF0F172A),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
