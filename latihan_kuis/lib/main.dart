import 'package:flutter/material.dart';

import 'food_item.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';

// Fungsi pertama yang dijalankan Flutter
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Resto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 0 = tab Menu, 1 = tab Profil
  int selectedTab = 0;
  List<FoodItem> foods = FoodItem.sampleData;

  @override
  Widget build(BuildContext context) {
    Widget currentPage;
    if (selectedTab == 0) {
      currentPage = HomePage(foods: foods);
    } else {
      currentPage = ProfilePage(foods: foods);
    }

    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        selectedItemColor: Colors.orange,
        onTap: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
