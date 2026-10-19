import 'package:flutter/material.dart';

import 'pages/cart_page.dart';
import 'pages/detail_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Katalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // renkleri kendi zevkine göre değiştirebilirsin
        scaffoldBackgroundColor: const Color(0xFFF4F1EC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF4F1EC),
          foregroundColor: Color(0xFF222222),
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF222222),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      home: const HomePage(),
      routes: {
        '/detay': (context) => const DetailPage(),
        '/sepet': (context) => const CartPage(),
      },
    );
  }
}
