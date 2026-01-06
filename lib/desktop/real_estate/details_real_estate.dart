import 'package:flutter/material.dart';

import '../../constants/colors.app.dart';
import '../../widgets/footer.dart';

class DetailsRealEstatePage extends StatefulWidget {
  final Map<String, dynamic> property;

  const DetailsRealEstatePage({super.key, required this.property});

  @override
  State<DetailsRealEstatePage> createState() => _DetailsRealEstatePageState();
}

class _DetailsRealEstatePageState extends State<DetailsRealEstatePage> {
  final ScrollController _scrollController = ScrollController();

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
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Marge pour la navbar
            SizedBox(height: 40),
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
                        // Colonne Gauche: Galerie (65%)
                        Expanded(
                          flex: 65,
                          child: Column(
                            children: [
                              _buildMainImage(),
                              const SizedBox(height: 16),
                              _buildThumbnailGallery(),
                            ],
                          ),
                        ),
                        const SizedBox(width: 40),
                        // Colonne Droite: Infos (35%)
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
    );
  }

  Widget _buildBreadcrumbs() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Column: Logo, Breadcrumbs, Back Button
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Logo
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
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 2. Breadcrumbs
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/home'),
                  child: const Text(
                    "Accueil",
                    style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const Text(" / ", style: TextStyle(color: Colors.grey)),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    "Biens",
                    style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const Text(" / ", style: TextStyle(color: Colors.grey)),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Text(
                    widget.property['title'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 3. Back Button
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
              label: const Text(
                "Retour aux biens",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),

        const Spacer(),

        // Right Side: "Voir les biens" Button
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
          child: const Text(
            "Voir les biens",
            style: TextStyle(fontWeight: FontWeight.bold),
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
              image: AssetImage(widget.property['image']),
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
            child: Text(
              widget.property['status'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
    // Placeholder thumbnails using the same image or other assets if available
    // In a real app, 'property' would have a list of images.
    final List<String> images = [
      widget.property['image'],
      'assets/images/imagesWeb/residence_alice.png',
      'assets/images/imagesWeb/hotel_ricardio.png',
      'assets/images/imagesWeb/villa.png',
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: images.map((img) {
        return Expanded(
          child: Container(
            height: 100,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.primary,
                width: 2,
              ), // Yellow border for "selected" look on one?
              image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
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
          const Text(
            "Prix",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            widget.property['price'],
            style: const TextStyle(
              color: /*AppColors.primary*/ Color(
                0xFFD4A017,
              ), // Goldish color as per design? Or primary
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontFamily: 'Playfair Display', // If available, or serif
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              SizedBox(width: 8),
              Text(
                "Publié le 06/01/2026",
                style: TextStyle(color: Colors.grey),
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
              Text(
                label,
                style: TextStyle(
                  color: text,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
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
          const Text(
            "Demande de visite",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
            ),
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
              child: const Text("Envoyer"),
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
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
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
