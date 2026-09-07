import 'package:flutter/material.dart';

/// Widget Kartu Harga Layanan IT (Tiered Pricing Card)
/// Sesuai spesifikasi:
/// - Layer Dasar: Container statis, putih, border-radius, shadow
/// - Badge Melayang: Stack + Positioned untuk badge "Rekomendasi"
/// - Header Paket: Column (ikon, nama paket, deskripsi)
/// - Harga & Durasi: Row dengan alignment baseline
/// - Daftar Fitur: Column berisi beberapa Row (icon check + text)
/// - Tombol CTA: ElevatedButton full width

class ITPricingCard extends StatelessWidget {
  final IconData icon;
  final String packageName;
  final String description;
  final String price;
  final String duration;
  final List<String> features;
  final bool isRecommended;
  final VoidCallback? onPressed;

  const ITPricingCard({
    super.key,
    required this.icon,
    required this.packageName,
    required this.description,
    required this.price,
    required this.duration,
    required this.features,
    this.isRecommended = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // ----- LAYER DASAR (Pembungkus Utama) -----
    return Container(
      width: double.infinity, // lebar mengikuti parent (responsif)
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      // ----- BADGE MELAYANG (Stack) -----
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Elemen utama kartu diletakkan di lapisan bawah
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ----- HEADER PAKET (Column) -----
                Icon(icon, size: 48, color: Colors.pink.shade400),
                const SizedBox(height: 12),
                Text(
                  packageName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 16),

                // ----- HARGA & DURASI (Row) -----
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      duration,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20), // jarak kosong (SizedBox)

                // ----- DAFTAR FITUR LAYANAN (Column & Row) -----
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: features
                      .map(
                        (feature) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.check,
                                size: 18,
                                color: Colors.green.shade600,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  feature,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),

                const SizedBox(height: 20),

                // ----- TOMBOL CALL-TO-ACTION (Fleksibilitas) -----
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade400,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Pilih Paket',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Badge "Rekomendasi" menggunakan Positioned
          if (isRecommended)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Rekomendasi',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ================== CONTOH PENGGUNAAN ==================
class PricingDemoPage extends StatelessWidget {
  const PricingDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Kartu Harga IT'),
        backgroundColor: Colors.pink.shade400,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        // scroll VERTIKAL, dipaksa aktif walau konten pas-pasan
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ITPricingCard(
              icon: Icons.laptop_mac,
              packageName: 'Paket Dasar',
              description: 'Cocok untuk kebutuhan bisnis skala kecil.',
              price: 'Rp 2.500.000',
              duration: '/ proyek',
              features: const [
                'Desain UI/UX Sederhana',
                'Setup Database Dasar',
                'Support 1 Bulan',
              ],
              onPressed: () {},
            ),
            const SizedBox(height: 20), // jarak antar kartu (vertikal)
            ITPricingCard(
              icon: Icons.smartphone,
              packageName: 'Paket Profesional',
              description: 'Solusi lengkap untuk bisnis berkembang.',
              price: 'Rp 5.000.000',
              duration: '/ proyek',
              features: const [
                'Desain UI/UX Khusus',
                'Setup Database',
                'Integrasi API',
                'Support 3 Bulan',
              ],
              isRecommended: true,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}