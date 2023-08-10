import 'package:flutter/material.dart';
import 'package:respira_acao/features/breaths/components/breathing_category_list.dart';
import 'package:respira_acao/features/codigo_teste.dart';
import 'package:respira_acao/features/settings/settings_page.dart';
import 'package:respira_acao/features/statistics/statistics_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _currentBottomNavItemIndex = 0;
  late PageController _pageController;

  void _setBottomNavIndex(int index) {
    setState(() {
      _currentBottomNavItemIndex = index;
      _pageController.animateToPage(_currentBottomNavItemIndex,
          curve: Curves.linear, duration: const Duration(milliseconds: 500));
    });
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
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
        body: PageView(
          controller: _pageController,
          children: const [
            TesteAnimacao(),
            BreathingCategoryList(),
            StatisticsPage(),
            SettingsPage(),
          ],
        ));
  }
}
