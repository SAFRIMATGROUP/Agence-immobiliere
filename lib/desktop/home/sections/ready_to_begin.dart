import 'package:flutter/material.dart';
import '../../../constants/colors.app.dart';

class ReadyToBeginSection extends StatelessWidget {
  const ReadyToBeginSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/imagesWeb/test2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 31, 49, 87).withOpacity(0.3),
              const Color.fromARGB(255, 23, 42, 128).withOpacity(0.7),
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Center(
          child: SizedBox(
            width: size.width * 0.6, // Contenu centré à 60%
            child: Column(
              children: [
                // --- TITRE PRINCIPAL SUR L'IMAGE ---
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                      shadows: [
                        Shadow(offset: Offset(0, 2), blurRadius: 4, color: Colors.black45),
                      ],
                    ),
                    children: [
                      const TextSpan(text: "Trouvez Votre Bien "),
                      const TextSpan(
                        text: "Immobilier",
                        style: TextStyle(color: AppColors.primary),
                      ),
                      const TextSpan(text: " Idéal"),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // SOUS-TITRE
                SizedBox(
                  width: 600,
                  child: Text(
                    "Rejoignez des milliers de clients satisfaits qui ont fait confiance à notre expertise pour réaliser leur projet immobilier.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      height: 1.5,
                      shadows: [
                        Shadow(offset: Offset(0, 1), blurRadius: 2, color: Colors.black45),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 60),
                
                // --- BOUTONS D'ACTION ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Bouton principal
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: const Color(0xFF0A1929),
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Voir Nos Biens",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 20),
                    
                    // Bouton secondaire
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 2),
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Nous Contacter",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}