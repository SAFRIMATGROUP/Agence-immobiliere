import 'package:flutter/material.dart';
import 'desktop/home/home_page.dart';
import 'desktop/real_estate/real_estate.dart';

import 'desktop/rental_property/rental_management.dart';

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
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/real-estate': (context) => const RealEstatePage(),
        '/rental-management': (context) => const RentalManagementPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
