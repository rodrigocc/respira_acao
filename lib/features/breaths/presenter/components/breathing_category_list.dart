import 'package:flutter/material.dart';
import 'package:respira_acao/config/services/youtube/components/video_list_page.dart';
import 'package:respira_acao/laboratory/secret.dart';

class BreathingCategoryList extends StatefulWidget {
  const BreathingCategoryList({super.key});

  @override
  State<BreathingCategoryList> createState() => _BreathingCategoryListState();
}

class _BreathingCategoryListState extends State<BreathingCategoryList>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final List<String> _categorys = [
    "Ansiedade",
    "Estresse",
    "Insônia",
    "Foco",
    "Produtividade",
    "Energia"
  ];
  final Duration _animationDuration = const Duration(seconds: 2);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    _startAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF0089CF), Color(0xFF00CDBA)]),
        ),
        child: ListView.builder(
          itemCount: _categorys.length,
          itemBuilder: (context, index) {
            return FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Interval(
                    index / _categorys.length,
                    (index + 1) / _categorys.length,
                    curve: Curves.linear,
                  ),
                ),
              ),
              child: ListTile(
                onTap: () {
                  final currentPlayListId = getplaylistId(_categorys[index]);
                  print(currentPlayListId);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return VideoListPage(
                        playlistId: currentPlayListId!,
                      );
                    }),
                  );
                },
                title: Text(
                  _categorys[index],
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String? getplaylistId(String selectCategory) {
    if (selectCategory.contains('Ansiedade')) {
      return Constants.PLAYLISTS_ID["Ansiedade"];
    }
    if (selectCategory.contains('Estresse')) {
      return Constants.PLAYLISTS_ID["Estresse"];
    }

    if (selectCategory.contains('Estresse')) {
      return Constants.PLAYLISTS_ID["Estresse"];
    }
    if (selectCategory.contains('Insônia')) {
      return Constants.PLAYLISTS_ID["Insônia"];
    }
    if (selectCategory.contains('Foco')) {
      return Constants.PLAYLISTS_ID["Foco"];
    }
    if (selectCategory.contains('Produtividade')) {
      return Constants.PLAYLISTS_ID["Produtividade"];
    }
    if (selectCategory.contains('Energia')) {
      return Constants.PLAYLISTS_ID["Energia"];
    }
    return null;
  }
}
