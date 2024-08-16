import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/theme.dart';
import 'package:prueba_tecnica/features/products/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manzana Verde',
      debugShowCheckedModeBanner: false,
      theme: GreenAppleTheme.theme,
      home: const HomeScreen(),
    );
  }
}
