import 'package:flutter/material.dart';
import 'package:respira_acao/features/blog/presenter/pages/blog_page.dart';
import 'package:respira_acao/features/breaths/presenter/components/breathing_category_list.dart';
import 'package:respira_acao/features/settings/settings_page.dart';
import 'package:respira_acao/features/statistics/statistics_page.dart';

class BottomNavBarComponent extends StatefulWidget {
  const BottomNavBarComponent({super.key});

  @override
  State<BottomNavBarComponent> createState() => _BottomNavBarComponentState();
}

class _BottomNavBarComponentState extends State<BottomNavBarComponent> {
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
            BlogPage(),
            BreathingCategoryList(),
            StatisticsPage(),
            SettingsPage(),
          ],
        ));
  }
}
