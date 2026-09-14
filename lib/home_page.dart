import 'package:flutter/material.dart';
import 'package_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<Map<String, dynamic>> packages = [
    {
      'name': 'Paket Landing Page',
      'price': 'Rp 1.500.000',
      'duration': '/ proyek',
      'description': 'Cocok untuk bisnis yang butuh 1 halaman promosi.',
      'features': [
        'Desain 1 Halaman',
        'Tampilan Responsive',
        'Support 1 Bulan',
      ],
    },
    {
      'name': 'Paket Company Profile',
      'price': 'Rp 3.500.000',
      'duration': '/ proyek',
      'description': 'Website profil perusahaan dengan beberapa halaman.',
      'features': [
        'Desain 5 Halaman',
        'Setup Database Dasar',
        'Support 2 Bulan',
      ],
    },
    {
      'name': 'Paket Custom Web App',
      'price': 'Rp 8.000.000',
      'duration': '/ proyek',
      'description': 'Aplikasi web custom sesuai kebutuhan bisnis.',
      'features': [
        'Desain UI/UX Khusus',
        'Integrasi API',
        'Support 3 Bulan',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paket Layanan IT'),
        backgroundColor: Colors.pink.shade400,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: packages.length,
        itemBuilder: (context, index) {
          final package = packages[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(
                Icons.laptop_mac,
                color: Colors.pink.shade400,
              ),
              title: Text(package['name']),
              subtitle: Text('${package['price']} ${package['duration']}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PackageDetailPage(
                      icon: Icons.laptop_mac,
                      name: package['name'],
                      price: package['price'],
                      duration: package['duration'],
                      description: package['description'],
                      features: package['features'],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}