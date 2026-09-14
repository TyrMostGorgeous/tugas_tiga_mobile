import 'package:flutter/material.dart';
import 'it_pricing_card.dart';

class PackageDetailPage extends StatefulWidget {
  final IconData icon;
  final String name;
  final String price;
  final String duration;
  final String description;
  final List<String> features;

  const PackageDetailPage({
    super.key,
    required this.icon,
    required this.name,
    required this.price,
    required this.duration,
    required this.description,
    required this.features,
  });

  @override
  State<PackageDetailPage> createState() => _PackageDetailPageState();
}

class _PackageDetailPageState extends State<PackageDetailPage> {
  bool isSelected = false;

  void toggleSelect() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar otomatis menampilkan tombol back karena halaman ini
      // dibuka lewat Navigator.push
      appBar: AppBar(
        title: const Text('Detail Paket'),
        backgroundColor: Colors.pink.shade400,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Menampilkan ulang widget ITPricingCard yang sudah dibuat
            ITPricingCard(
              icon: widget.icon,
              packageName: widget.name,
              description: widget.description,
              price: widget.price,
              duration: widget.duration,
              features: widget.features,
              onPressed: toggleSelect, // tombol di dalam card memicu setState
            ),
            const SizedBox(height: 20),

            // Kotak status tambahan (berubah sesuai state)
            // Ini bagian StatefulWidget-nya: warna & teks berubah
            // ketika tombol "Pilih Paket" di dalam card ditekan
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green.shade100 : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? Colors.green : Colors.grey.shade400,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isSelected ? Icons.check_circle : Icons.info_outline,
                    color: isSelected ? Colors.green : Colors.grey.shade600,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isSelected
                        ? 'Anda sudah memilih paket ini'
                        : 'Tekan "Pilih Paket" di atas untuk memilih',
                    style: TextStyle(
                      color: isSelected ? Colors.green.shade800 : Colors.grey.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}