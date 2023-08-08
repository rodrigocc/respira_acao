import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _currentBottomNavItemIndex = 0;

  void _setBottomNavIndex(int index) {
    setState(() {
      _currentBottomNavItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: _setBottomNavIndex,
        currentIndex: _currentBottomNavItemIndex,
        useLegacyColorScheme: false,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              label: 'Menu'),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/mandala_icon.png",
                color: Colors.blue, height: 30, width: 30),
            label: 'Respirações',
          ),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book,
                color: Colors.blue,
              ),
              label: 'Estatisticas'),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.blue,
              ),
              label: 'Ajustes'),
        ],
      ),
      body: Container(
          decoration: const BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xFF0089CF), Color(0xFF00CDBA)]),
      )),
    );
  }
}
