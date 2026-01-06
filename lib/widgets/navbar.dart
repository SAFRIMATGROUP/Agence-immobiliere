import 'package:flutter/material.dart';
import '../constants/colors.app.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final String currentPage;
  final bool isScrolled;

  const Navbar({super.key, this.currentPage = 'home', this.isScrolled = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: kToolbarHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isScrolled ? Colors.white : Colors.transparent,
      ),
      child: Center(
        child: SizedBox(
          width: size.width * 0.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // LOGO
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
                  Text(
                    'ImmoElite',
                    style: TextStyle(
                      color: isScrolled ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              // MENU ITEMS & BUTTON
              Row(
                children: [
                  _buildNavItem(context, 'Accueil', 'home'),
                  _buildNavItem(context, 'Biens', 'real-estate'),
                  _buildNavItem(context, 'Services', 'services'),
                  _buildNavItem(context, 'Location Locative', 'location'),
                  _buildNavItem(context, 'Investir', 'invest'),
                  _buildNavItem(context, 'À Propos', 'about'),
                  _buildNavItem(context, 'Contact', 'contact'),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/real-estate');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.background,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text('Voir les Biens'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, String route) {
    final bool isCurrentPage = currentPage == route;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () {
          if (route == 'home') {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (route == 'real-estate') {
            Navigator.pushReplacementNamed(context, '/real-estate');
          }
          // Autres routes à implémenter selon besoin
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: isCurrentPage
              ? BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                  border: Border(
                    bottom: BorderSide(color: AppColors.primary, width: 2),
                  ),
                )
              : null,
          child: Text(
            title,
            style: TextStyle(
              color: isCurrentPage
                  ? AppColors.primary
                  : (isScrolled ? Colors.black : Colors.white),
              fontSize: 14,
              fontWeight: isCurrentPage ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
