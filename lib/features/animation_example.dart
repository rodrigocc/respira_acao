import 'package:flutter/material.dart';

class PausingAnimationExample extends StatefulWidget {
  const PausingAnimationExample({super.key});

  @override
  _PausingAnimationExampleState createState() =>
      _PausingAnimationExampleState();
}

class _PausingAnimationExampleState extends State<PausingAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();

    // Create an AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    // Create a Tween animation with different start and end values
    _animation =
        Tween<double>(begin: 500, end: 200).animate(_animationController);
    // Define the animation curve for the animation
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _togglePause() {
    setState(() {
      if (_isPaused) {
        _animationController.repeat(reverse: true);
      } else {
        _animationController.stop();
      }
      _isPaused = !_isPaused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                return Transform.scale(
                  scale: _animationController.value,
                  child: const CircleAvatar(
                    backgroundColor: Colors.blue,
                  ),
                );
              },
            ),
            const SizedBox(height: 20.0),
            FloatingActionButton(
              onPressed: _togglePause,
              child: Text(_isPaused ? 'Resume Animation' : 'Pause Animation'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: PausingAnimationExample(),
    ),
  ));
}
