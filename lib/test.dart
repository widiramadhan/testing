import 'package:flutter/material.dart';

class Test {
  int _selectedIndex = 0;

  Widget MyProfilePage() {
    _selectedIndex++;
    return GestureDetector(
      onTap: () => _selectedIndex--,
      child: Container(
        child: Text(_selectedIndex.toString()),
      ),
    );
  }
}
