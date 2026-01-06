import 'package:flutter/material.dart';
import '../../../constants/colors.app.dart';
import '../../../widgets/custom_text.dart';

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
            width: size.width * 0.6, 
            child: Column(
              children: [
                CustomText(
                  text: "Trouvez Votre Bien Immobilier Idéal",
                  type: CustomTextType.hero,
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 24),
                
                SizedBox(
                  width: 600,
                  child: CustomText(
                    text: "Rejoignez des milliers de clients satisfaits qui ont fait confiance à notre expertise pour réaliser leur projet immobilier.",
                    type: CustomTextType.textWhite,
                    textAlign: TextAlign.center,
                  ),
                ),
                
                const SizedBox(height: 60),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                      child: CustomText(
                        text: "Voir Nos Biens",
                        type: CustomTextType.buttonWhite,
                        fontSize: 16,
                      ),
                    ),
                    
                    const SizedBox(width: 20),
                    
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
                      child: CustomText(
                        text: "Nous Contacter",
                        type: CustomTextType.buttonWhite,
                        fontSize: 16,
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