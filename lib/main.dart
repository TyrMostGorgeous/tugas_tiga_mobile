import 'package:flutter/material.dart';
import 'it_pricing_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Kartu Harga IT',
  theme: ThemeData(
    fontFamily: 'Times New Roman',
    scaffoldBackgroundColor: Colors.grey.shade200,
  ),
  home: const PricingDemoPage(),
);
  }
}