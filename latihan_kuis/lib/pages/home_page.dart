import 'package:flutter/material.dart';

import '../food_item.dart';
import 'detail_page.dart';

// Halaman beranda: menampilkan daftar makanan.
// Stateful karena tampilannya harus di-refresh setelah
// kita kembali dari halaman detail (jumlah porsi berubah).
class HomePage extends StatefulWidget {
  final List<FoodItem> foods;

  const HomePage({super.key, required this.foods});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Resto'),
        centerTitle: true,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      // ListView.builder = membuat daftar dari sebuah List
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: widget.foods.length,
        itemBuilder: (context, index) {
          // Ambil 1 makanan dari daftar
          FoodItem food = widget.foods[index];

          return Card(
            child: ListTile(
              // Gambar di kiri
              leading: Image.network(
                food.imageUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
              // Nama + deskripsi + harga per porsi + jumlah porsi
              title: Text(
                food.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(food.description),
                  Text('Rp ${food.formattedPrice} / porsi'),
                  Text(
                    '${food.quantity} porsi',
                    style: const TextStyle(color: Colors.orange),
                  ),
                ],
              ),
              // Total harga di kanan
              trailing: Text(
                'Rp ${food.formattedTotal}',
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Saat kartu ditekan, buka halaman detail
              onTap: () async {
                // await = tunggu sampai halaman detail ditutup
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(food: food),
                  ),
                );
                // Setelah kembali, gambar ulang beranda
                // supaya jumlah porsi & total harga terbaru tampil
                setState(() {});
              },
            ),
          );
        },
      ),
    );
  }
}
