import 'package:flutter/material.dart';

import '../food_item.dart';

// Halaman detail: user hanya bisa mengubah jumlah porsi.
// Stateful karena total harga berubah saat jumlah diketik.
class DetailPage extends StatefulWidget {
  final FoodItem food; // makanan yang diklik

  const DetailPage({super.key, required this.food});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // Controller = alat untuk membaca/mengatur isi TextField
  late TextEditingController jumlahController;

  // Jumlah porsi sementara (belum disimpan)
  int jumlah = 0;

  // initState dijalankan sekali saat halaman pertama dibuat
  @override
  void initState() {
    super.initState();
    jumlah = widget.food.quantity;
    jumlahController = TextEditingController(text: jumlah.toString());
  }

  @override
  Widget build(BuildContext context) {
    FoodItem food = widget.food;

    // Total dihitung dari jumlah yang sedang diketik
    int total = jumlah * food.price;

    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
        centerTitle: true,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Gambar makanan
          Image.network(food.imageUrl, height: 200, fit: BoxFit.cover),
          const SizedBox(height: 16),

          // Nama, harga, deskripsi
          Text(
            food.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            'Rp ${food.formattedPrice} / porsi',
            style: const TextStyle(color: Colors.green),
          ),
          const SizedBox(height: 8),
          Text(food.description),
          const SizedBox(height: 16),

          // Input jumlah porsi
          TextField(
            controller: jumlahController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Jumlah (porsi)',
              border: OutlineInputBorder(),
            ),
            // Dipanggil setiap kali isi TextField berubah
            onChanged: (text) {
              setState(() {
                // int.tryParse mengubah teks jadi angka.
                // Kalau kosong/salah, hasilnya null, maka pakai 0.
                jumlah = int.tryParse(text) ?? 0;
              });
            },
          ),
          const SizedBox(height: 16),

          // Total harga
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total', style: TextStyle(fontSize: 18)),
              Text(
                'Rp ${formatPrice(total)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Tombol simpan
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(14),
            ),
            onPressed: () {
              // Simpan jumlah ke data makanan
              widget.food.quantity = jumlah;
              // Tutup halaman detail, kembali ke beranda
              Navigator.pop(context);
            },
            child: const Text('Simpan Pemesanan'),
          ),
        ],
      ),
    );
  }
}
