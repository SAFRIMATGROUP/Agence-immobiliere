import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/footer.dart';
import '../../widgets/navbar.dart';
import '../../widgets/custom_text.dart';

class DetailsRealEstatePage extends StatefulWidget {
  final Map<String, dynamic> property;

  const DetailsRealEstatePage({super.key, required this.property});

  @override
  State<DetailsRealEstatePage> createState() => _DetailsRealEstatePageState();
}

class _DetailsRealEstatePageState extends State<DetailsRealEstatePage> {
  final ScrollController _scrollController = ScrollController();
  late String _selectedImage;
  bool _isNavbarVisible = false;

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.property['image'];
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset > 50 && !_isNavbarVisible) {
      setState(() => _isNavbarVisible = true);
    } else if (_scrollController.offset <= 50 && _isNavbarVisible) {
      setState(() => _isNavbarVisible = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Center(
                  child: SizedBox(
                    width: size.width * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBreadcrumbs(),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 65,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildMainImage(),
                                  const SizedBox(height: 16),
                                  _buildThumbnailGallery(),
                                  const SizedBox(height: 40),
                                  _buildDescriptionSection(),
                                ],
                              ),
                            ),
                            const SizedBox(width: 40),
                            Expanded(
                              flex: 35,
                              child: Column(
                                children: [
                                  _buildPriceCard(),
                                  const SizedBox(height: 24),
                                  _buildContactForm(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                const CustomFooter(),
              ],
            ),
          ),

          if (_isNavbarVisible)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: const Navbar(currentPage: 'real-estate', isScrolled: true),
            ),
        ],
      ),
    );
  }

  Widget _buildBreadcrumbs() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
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
                const SizedBox(width: 8),
                const CustomText(
                  text: 'ImmoElite',
                  type: CustomTextType.label,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/home'),
                  child: const CustomText(
                    text: "Accueil",
                    type: CustomTextType.label,
                    color: Colors.grey,
                  ),
                ),
                const CustomText(
                  text: " / ",
                  type: CustomTextType.sectionDescription,
                  color: Colors.grey,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CustomText(
                    text: "Biens",
                    type: CustomTextType.label,
                    color: Colors.grey,
                  ),
                ),
                const CustomText(
                  text: " / ",
                  type: CustomTextType.sectionDescription,
                  color: Colors.grey,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: CustomText(
                    text: widget.property['title'],
                    type: CustomTextType.label,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            TextButton.icon(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFFFF8E1),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 14,
                color: Colors.black,
              ),
              label: const CustomText(
                text: "Retour aux biens",
                type: CustomTextType.button,
                color: Colors.black,
              ),
            ),
          ],
        ),

        const Spacer(),

        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const CustomText(
            text: "Voir les biens",
            type: CustomTextType.button,
          ),
        ),
      ],
    );
  }

  Widget _buildMainImage() {
    return Stack(
      children: [
        Container(
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(_selectedImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: CustomText(
              text: widget.property['status'],
              type: CustomTextType.label,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Row(
            children: [
              _buildIconBtn(Icons.favorite_border),
              const SizedBox(width: 10),
              _buildIconBtn(Icons.share),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconBtn(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, size: 20, color: Colors.black),
    );
  }

  Widget _buildThumbnailGallery() {
    final List<String> images = [
      widget.property['image'],
      'assets/images/imagesWeb/residence_alice.png',
      'assets/images/imagesWeb/hotel_ricardio.png',
      'assets/images/imagesWeb/mini_villa.png',
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: images.map((img) {
        final isSelected = _selectedImage == img;
        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedImage = img;
              });
            },
            child: Container(
              height: 100,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  width: 2,
                ),
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPriceCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Prix",
            type: CustomTextType.label,
            color: Colors.grey,
            fontSize: 16,
          ),
          const SizedBox(height: 8),
          CustomText(
            text: widget.property['price'],
            type: CustomTextType.heroTitle,
            color: AppColors.primary,
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              SizedBox(width: 8),
              CustomText(
                text: "Publié le 06/01/2026",
                type: CustomTextType.sectionDescription,
                fontSize: 14,
                color: Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildActionButton(
            "Demander une visite",
            AppColors.primary,
            Colors.black,
            Icons.phone,
          ),
          const SizedBox(height: 12),
          _buildActionButton(
            "Nous contacter",
            Colors.white,
            Colors.black,
            Icons.mail_outline,
            isOutline: true,
          ),
          const SizedBox(height: 12),
          _buildActionButton(
            "WhatsApp",
            const Color(0xFF25D366),
            Colors.white,
            Icons.message,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    String label,
    Color bg,
    Color text,
    IconData icon, {
    bool isOutline = false,
  }) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        border: isOutline ? Border.all(color: Colors.grey.shade300) : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: text, size: 20),
              const SizedBox(width: 10),
              CustomText(
                text: label,
                type: CustomTextType.button,
                color: text,
                fontSize: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Villa contemporaine avec piscine",
            type: CustomTextType.sectionTitle,
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColors.primary,
                size: 20,
              ),
              SizedBox(width: 8),
              CustomText(
                text: "Quartier La Californie, 06400 Cannes",
                type: CustomTextType.sectionDescription,
                color: Colors.grey,
                fontSize: 16,
              ),
            ],
          ),
          const SizedBox(height: 32),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatItem(Icons.crop_free, "280 m²", "Surface"),
                _buildStatItem(Icons.door_sliding_outlined, "8", "Pièces"),
                _buildStatItem(Icons.bed_outlined, "5", "Chambres"),
                _buildStatItem(Icons.bathtub_outlined, "3", "SdB"),
              ],
            ),
          ),
          const SizedBox(height: 40),

          const CustomText(
            text: "Description",
            type: CustomTextType.sectionTitle,
          ),
          const SizedBox(height: 16),
          CustomText(
            text:
                "Exceptionnelle villa contemporaine située dans un quartier résidentiel prisé de Cannes. Cette propriété d'exception offre des prestations haut de gamme et une vue imprenable sur la mer.\n\n"
                "Au rez-de-chaussée, vous découvrirez un vaste salon lumineux avec cheminée, une cuisine équipée ouvrant sur la terrasse, ainsi qu'une suite parentale avec dressing et salle de bains privative.\n\n"
                "L'étage accueille 4 chambres spacieuses, toutes avec salle de bains attenante, offrant un confort optimal pour toute la famille.\n\n"
                "À l'extérieur, profitez d'un jardin paysager de 800m², d'une piscine à débordement chauffée, d'un pool house et d'un garage double.",
            type: CustomTextType.sectionDescription,
            color: Colors.grey.shade700,
            fontSize: 16,
          ),
          const SizedBox(height: 40),

          const CustomText(
            text: "Caractéristiques",
            type: CustomTextType.sectionTitle,
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 40,
            runSpacing: 16,
            children: [
              _buildFeatureItem("Piscine chauffée"),
              _buildFeatureItem("Vue mer"),
              _buildFeatureItem("Jardin paysager"),
              _buildFeatureItem("Garage double"),
              _buildFeatureItem("Climatisation"),
              _buildFeatureItem("Domotique"),
              _buildFeatureItem("Alarme"),
              _buildFeatureItem("Cuisine équipée"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFFD4A017), size: 28),
        const SizedBox(height: 8),
        CustomText(
          text: value,
          type: CustomTextType.cardTitle,
          fontSize: 18,
          color: const Color(0xFF0C1D36),
        ),
        const SizedBox(height: 4),
        CustomText(
          text: label,
          type: CustomTextType.label,
          color: Colors.grey,
          fontSize: 14,
        ),
      ],
    );
  }

  Widget _buildFeatureItem(String label) {
    return SizedBox(
      width: 200,
      child: Row(
        children: [
          const Icon(Icons.check, color: Color(0xFFD4A017), size: 20),
          const SizedBox(width: 12),
          CustomText(
            text: label,
            type: CustomTextType.sectionDescription,
            color: const Color(0xFF0C1D36),
            fontSize: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "Demande de visite",
            type: CustomTextType.cardTitle, // Centralized Serif Subtitle
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _buildInput("Prénom", "Jean")),
              const SizedBox(width: 16),
              Expanded(child: _buildInput("Nom", "Dupont")),
            ],
          ),
          const SizedBox(height: 16),
          _buildInput("Email", "jean.dupont@email.com"),
          const SizedBox(height: 16),
          _buildInput("Téléphone (optionnel)", "+33 6 12 34 56 78"),
          const SizedBox(height: 16),
          _buildInput(
            "Message",
            "Bonjour, je suis intéressé par ce bien...",
            maxLines: 4,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const CustomText(
                text: "Envoyer",
                type: CustomTextType.button,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInput(String label, String placeholder, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: label, type: CustomTextType.label),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),
      ],
    );
  }
}
