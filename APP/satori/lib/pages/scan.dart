import 'package:flutter/material.dart';
import 'account.dart';
import 'home.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    HomePage(),
    Column(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 1.0), //TODO
      ),
    ]),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _getTitleForPage(int index) {
    const titles = ["Hello User", "Scan", "Account"];
    return titles[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: _pages[_selectedIndex],
    );
  }
}
