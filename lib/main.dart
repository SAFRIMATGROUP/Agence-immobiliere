import 'package:flutter/material.dart';
import 'desktop/home/home_page.dart';
import 'desktop/real_estate/real_estate.dart';

import 'desktop/rental_property/rental_management.dart';
import 'desktop/invest/invest.dart';
import 'desktop/about_us/about_us.dart';
import 'desktop/contact/contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agence Immobiliere',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFFD700)),
        useMaterial3: true,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.windows: NoTransitionsBuilder(),
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/real-estate': (context) => const RealEstatePage(),
        '/rental-management': (context) => const RentalManagementPage(),
        '/invest': (context) => const InvestPage(),
        '/about': (context) => const AboutUsPage(),
        '/contact': (context) => const ContactPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
