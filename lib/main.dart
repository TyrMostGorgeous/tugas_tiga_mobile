import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paket Harga IT',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade200,
      ),
      home: const HomePage(),
    );
  }
}