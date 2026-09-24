import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Page'), backgroundColor: Colors.blue),
      body: Center(child: Text('Ini adalah halaman detail')),
    );
  }
}
