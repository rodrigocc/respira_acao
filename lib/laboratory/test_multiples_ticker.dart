import 'package:flutter/material.dart';

class MyAnimatedBox extends StatefulWidget {
  const MyAnimatedBox({super.key});

  @override
  _MyAnimatedBoxState createState() => _MyAnimatedBoxState();
}

class _MyAnimatedBoxState extends State<MyAnimatedBox>
    with TickerProviderStateMixin {
  late AnimationController _sizeController;
  late AnimationController _opacityController;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controllers with desired durations
    _sizeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _opacityController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Start the animations when the widget is first created
    _sizeController.forward();
    _opacityController.forward();
  }

  @override
  void dispose() {
    // Dispose of the animation controllers when the widget is removed from the tree
    _sizeController.dispose();
    _opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Multiple Animation Controllers Example')),
      body: Center(
        child: AnimatedBuilder(
          animation: _sizeController,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityController.value,
              child: Container(
                width: 100 + (_sizeController.value * 100),
                height: 100 + (_sizeController.value * 100),
                color: Colors.blue,
              ),
            );
          },
        ),
      ),
    );
  }
}
