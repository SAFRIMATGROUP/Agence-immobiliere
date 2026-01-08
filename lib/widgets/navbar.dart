import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'custom_text.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final String currentPage;
  final bool isScrolled;

  const Navbar({super.key, this.currentPage = 'home', this.isScrolled = false});

  @override
  State<Navbar> createState() => _NavbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NavbarState extends State<Navbar> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isServicesHovered = false;

  void _showOverlay() {
    if (_overlayEntry != null) return;

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {});
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {});
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        width: 800,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(-350, 40),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            child: MouseRegion(
              onEnter: (_) => setState(() => _isServicesHovered = true),
              onExit: (_) {
                setState(() => _isServicesHovered = false);
                _hideOverlay();
              },
              child: Container(
                padding: const EdgeInsets.all(24),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 24,
                  children: const [
                    _DropdownItem(
                      title: 'Vente & Location',
                      subtitle: 'Trouvez ou vendez votre bien immobilier',
                    ),
                    _DropdownItem(
                      title: 'Promotion Immobilière',
                      subtitle: 'Projets neufs et programmes immobiliers',
                    ),
                    _DropdownItem(
                      title: 'Conseil & Investissement',
                      subtitle: 'Expertise et accompagnement...',
                    ),
                    _DropdownItem(
                      title: 'Développement Foncier',
                      subtitle: 'Valorisation de terrains et parcelles',
                    ),
                    _DropdownItem(
                      title: 'Immobilier d\'Entreprise',
                      subtitle: 'Bureaux, locaux commerciaux et...',
                    ),
                    _DropdownItem(
                      title: 'Marketing Immobilier',
                      subtitle: 'Communication et visibilité de vos biens',
                    ),
                    _DropdownItem(
                      title: 'Financement',
                      subtitle: 'Solutions de financement sur mesure',
                    ),
                    _DropdownItem(
                      title: 'Projets Durables',
                      subtitle: 'Construction et rénovation écologique',
                    ),
                    _DropdownItem(
                      title: 'Formation',
                      subtitle: 'Accompagnement et formation immobilière',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: kToolbarHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.isScrolled ? Colors.white : Colors.transparent,
      ),
      child: Center(
        child: SizedBox(
          width: size.width * 0.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  CustomText(
                    text: 'ImmoElite',
                    type: CustomTextType.label,
                    fontWeight: FontWeight.bold,
                    color: widget.isScrolled ? Colors.black : Colors.white,
                    fontSize: 16,
                  ),
                ],
              ),

              Row(
                children: [
                  _buildNavItem(context, 'Accueil', 'home'),
                  _buildNavItem(context, 'Biens', 'real-estate'),
                  _buildNavItem(
                    context,
                    'Services',
                    'services',
                    isDropdown: true,
                  ),
                  _buildNavItem(context, 'Gestion Locative', 'rental'),
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
                    child: const CustomText(
                      text: 'Voir les Biens',
                      type: CustomTextType.button,
                      color: AppColors.background,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    String title,
    String route, {
    bool isDropdown = false,
  }) {
    final bool isCurrentPage = widget.currentPage == route;
    final bool isDropdownOpen = isDropdown && _overlayEntry != null;

    // Use specific types based on state instead of fontWeight param
    final FontWeight fontWeight = (isCurrentPage || isDropdownOpen)
        ? FontWeight.bold
        : FontWeight.w500;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: MouseRegion(
        onEnter: (event) {
          if (isDropdown) {
            _showOverlay();
          }
        },
        onExit: (event) {
          if (isDropdown) {
            Future.delayed(const Duration(milliseconds: 100), () {
              if (!_isServicesHovered) {
                _hideOverlay();
              }
            });
          }
        },
        child: CompositedTransformTarget(
          link: isDropdown ? _layerLink : LayerLink(),
          child: GestureDetector(
            onTap: () {
              if (route == 'home') {
                Navigator.pushReplacementNamed(context, '/home');
              } else if (route == 'real-estate') {
                Navigator.pushReplacementNamed(context, '/real-estate');
              } else if (route == 'rental') {
                Navigator.pushReplacementNamed(context, '/rental-management');
              } else if (route == 'invest') {
                Navigator.pushReplacementNamed(context, '/invest');
              } else if (route == 'about') {
                Navigator.pushReplacementNamed(context, '/about');
              }
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
                  : (isDropdownOpen)
                  ? BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    )
                  : null,
              child: Row(
                children: [
                  CustomText(
                    text: title,
                    type: CustomTextType.label, // Dynamic type selection
                    fontWeight: fontWeight,
                    color: isCurrentPage
                        ? AppColors.primary
                        : (widget.isScrolled ? Colors.black : Colors.white),
                    fontSize: 14,
                  ),
                  if (isDropdown) ...[
                    const SizedBox(width: 4),
                    Icon(
                      isDropdownOpen
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 16,
                      color: widget.isScrolled ? Colors.black : Colors.white,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DropdownItem extends StatefulWidget {
  final String title;
  final String subtitle;

  const _DropdownItem({required this.title, required this.subtitle});

  @override
  State<_DropdownItem> createState() => _DropdownItemState();
}

class _DropdownItemState extends State<_DropdownItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          // Action au clic sur un élément du menu
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: widget.title,
                type: CustomTextType.label,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0C1D36),
                fontSize: 15,
              ),
              const SizedBox(height: 4),
              CustomText(
                text: widget.subtitle,
                type: CustomTextType.sectionDescription,
                color: _isHovered
                    ? const Color(0xFF0C1D36).withOpacity(0.7)
                    : Colors.grey.shade600,
                fontSize: 13,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
