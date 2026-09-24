import 'package:flutter/material.dart';
import 'package:pertemuan_04/models/data.dart';

import 'detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'), backgroundColor: Colors.blue),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPage()),
              );
            },
            child: ListTile(
              title: Text(products[index].name),
              subtitle: Text('Rp ${products[index].price}'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54),
            ),
          );
        },
      ),
    );
  }
}
