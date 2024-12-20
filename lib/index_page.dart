import 'package:flutter/material.dart';
import 'package:flutter_application_1/future_builder_page.dart';
import 'package:flutter_application_1/homepage/home_list_page.dart';
import 'package:flutter_application_1/homepage/home_page.dart';
import 'package:flutter_application_1/homepage/home_view.dart';
import 'package:flutter_application_1/latihan.dart';
import 'package:flutter_application_1/latihan_day4_page.dart';
import 'package:flutter_application_1/stream_builder_page.dart';
import 'package:flutter_application_1/test.dart';

class IndexPage extends StatefulWidget {
  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    HomeListPage(),
    LatihanDay4Page(),
    Latihan(),
    FutureBuilderPage(),
    StreamBuilderPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MY APP"),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.file_copy), label: 'Files'),
          BottomNavigationBarItem(icon: Icon(Icons.car_crash), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.badge), label: 'Product'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
