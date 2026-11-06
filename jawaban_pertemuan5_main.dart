import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailMenuPage(),
    );
  }
}

class DetailMenuPage extends StatefulWidget {
  const DetailMenuPage({super.key});

  @override
  State<DetailMenuPage> createState() => _DetailMenuPageState();
}

class _DetailMenuPageState extends State<DetailMenuPage> {
  // State sesuai instruksi Pertemuan 5.
  bool isFavorite = false;
  int jumlahPesanan = 1;
  String catatanPesanan = '';

  // Harga satu porsi, bukan state.
  final int hargaSatuan = 25000;

  String formatRupiah(int angka) {
    final String nilai = angka.toString();
    final StringBuffer hasil = StringBuffer();

    for (int i = 0; i < nilai.length; i++) {
      hasil.write(nilai[i]);
      final int sisaDigit = nilai.length - i - 1;
      if (sisaDigit > 0 && sisaDigit % 3 == 0) {
        hasil.write('.');
      }
    }

    return 'Rp$hasil';
  }

  @override
  Widget build(BuildContext context) {
    final int totalHarga = hargaSatuan * jumlahPesanan;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Menu'),
        actions: [
          IconButton(
            tooltip: 'Favorit',
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tampilan dasar dari tugas Pertemuan 4.
            Image.network(
              'https://picsum.photos/600/400',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 250,
                  color: Colors.grey.shade300,
                  alignment: Alignment.center,
                  child: const Icon(Icons.restaurant, size: 64),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          'Nasi Goreng Spesial',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        formatRupiah(hargaSatuan),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _InfoItem(icon: Icons.star, label: '4.9'),
                        _InfoItem(icon: Icons.schedule, label: '10 menit'),
                        _InfoItem(
                          icon: Icons.local_fire_department,
                          label: '150 kal',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Nasi goreng spesial dengan bumbu pilihan, telur, '
                    'dan sayuran segar. Disajikan hangat dengan rasa '
                    'lezat yang cocok dinikmati kapan saja.',
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Jumlah Pesanan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (jumlahPesanan > 1) {
                              jumlahPesanan--;
                            }
                          });
                        },
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      Text(
                        '$jumlahPesanan',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            jumlahPesanan++;
                          });
                        },
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Catatan Pesanan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        catatanPesanan = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Tulis catatan pesanan...',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Pratinjau: ${catatanPesanan.isEmpty ? "Belum ada catatan" : catatanPesanan}',
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Pesanan berhasil. Total: '
                              '${formatRupiah(totalHarga)}',
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Pesan Sekarang - ${formatRupiah(totalHarga)}',
                      ),
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

class _InfoItem extends StatelessWidget {
  const _InfoItem({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 26, color: Colors.brown),
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }
}
