import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.abc,
                color: Colors.blue,
              ),
              label: 'testando'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.abc,
                color: Colors.blue,
              ),
              label: 'testando'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.abc,
                color: Colors.blue,
              ),
              label: 'testando'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.abc,
                color: Colors.blue,
              ),
              label: 'testando'),
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
