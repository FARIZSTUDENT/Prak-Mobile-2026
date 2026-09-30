import 'package:flutter/material.dart';

import '../food_item.dart';

// Halaman profil hanya menampilkan data (tidak ada yang berubah
// di dalam halaman ini), jadi cukup StatelessWidget.
class ProfilePage extends StatelessWidget {
  final List<FoodItem> foods;

  const ProfilePage({super.key, required this.foods});

  @override
  Widget build(BuildContext context) {
    // Hitung total porsi dan total harga dari semua makanan
    int totalPorsi = 0;
    int totalHarga = 0;
    for (FoodItem food in foods) {
      totalPorsi += food.quantity;
      totalHarga += food.totalPrice;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        centerTitle: true,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.orange,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 12),
            // GANTI dengan nama kamu
            const Text(
              'Fariz Taufik Syahbana',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text('Pelanggan Resto'),
            const SizedBox(height: 24),

            const Card(
              child: ListTile(
                leading: Icon(Icons.restaurant, color: Colors.orange),
                title: Text('Menu Resto'),
                subtitle: Text('Pesan makanan favorit Anda dengan mudah.'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.receipt_long, color: Colors.orange),
                title: const Text('Pemesanan'),
                subtitle: Text(
                  '$totalPorsi porsi  |  Total Rp ${formatPrice(totalHarga)}',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
