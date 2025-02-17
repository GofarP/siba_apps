import 'package:flutter/material.dart';
import 'package:siba_apps/screen/cek_harga_screen.dart';
import 'package:siba_apps/screen/cek_resi_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const CekResiScreen(),
    const CekHargaScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IndexedStack(
        index:_selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Cek Resi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.price_check),
            label: 'Cek Harga',
          )
        ],
        backgroundColor: Color.fromARGB(255, 71, 134, 206),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blue[200],
        onTap: _onItemTapped,
      ),
    );
  }
}
