import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:respira_acao/shared/bottom_nav_component.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  AnimatedBuilderDemoState createState() => AnimatedBuilderDemoState();
}

class AnimatedBuilderDemoState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller; // Define an animation controller

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      // Initialize the animation controller
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    _controller.forward().then((value) {
      // Start the animation and when it's finished, pop the current screen
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const BottomNavBarComponent()));
    });
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Dispose of the animation controller when the widget is removed from the tree
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Lottie.asset("assets/lottie/splash_animation.json", repeat: true),
        Container(height: 15),
        ShaderMask(
          // Use ShaderMask to add a gradient to the "Flutter UIX" text
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [Color(0xFF0089CF), Color(0xFF00CDBA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: const Text(
            "Respira-Ação",
            style: TextStyle(
                fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ])),
    );
  }
}
