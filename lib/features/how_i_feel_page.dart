import 'package:flutter/material.dart';

import '../shared/bottom_nav_component.dart';

class HowIfeelPage extends StatefulWidget {
  const HowIfeelPage({super.key});

  @override
  State<HowIfeelPage> createState() => _HowIfeelPageState();
}

class _HowIfeelPageState extends State<HowIfeelPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // YouTubeService().searchVideos("produtividade");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Como Estou me Sentindo Hoje?"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Image.asset(
                    "assets/emojis/sad_emoji.png",
                    height: 45,
                    width: 45,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const BottomNavBarComponent()));
                  },
                ),
                GestureDetector(
                  child: Image.asset(
                    "assets/emojis/happy_emoji.png",
                    height: 50,
                    width: 50,
                  ),
                ),
                GestureDetector(
                  child: Image.asset(
                    "assets/emojis/anxiety_emoji.png",
                    height: 50,
                    width: 50,
                  ),
                ),
                GestureDetector(
                  child: Image.asset(
                    "assets/emojis/angry_emoji.png",
                    height: 50,
                    width: 50,
                  ),
                ),
                GestureDetector(
                  child: Image.asset(
                    "assets/emojis/isominia_emoji.png",
                    height: 50,
                    width: 50,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
