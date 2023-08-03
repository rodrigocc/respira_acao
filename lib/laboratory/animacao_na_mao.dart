import 'package:flutter/material.dart';

class BreathingComponent extends StatefulWidget {
  const BreathingComponent({super.key});

  @override
  _BreathingComponentState createState() => _BreathingComponentState();
}

class _BreathingComponentState extends State<BreathingComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _animationIsEnd = false;

  bool _breathExerciseStatus = false;

  @override
  void initState() {
    super.initState();

    // Create the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    // Define the animation
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Start the animation
  }

  @override
  void dispose() {
    // Dispose the animation controller to free up resources
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _breathExerciseStatus ? _stopBreath : _startBreath,
          child: _breathExerciseStatus
              ? const Icon(Icons.pause)
              : const Icon(Icons.play_arrow)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _animationIsEnd
              ? const SizedBox.shrink()
              : AnimatedBuilder(
                  animation: _animation,
                  builder: (BuildContext context, Widget? child) {
                    return Column(
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100)),
                            // Use the animation value to control the properties of the container
                            width: _animation.value * 150,
                            height: _animation.value * 150,
                          ),
                        ),
                        _animation.status == AnimationStatus.reverse
                            ? const Text('Expira')
                            : _animation.status == AnimationStatus.forward
                                ? const Text('Inspira')
                                : _animation.status == AnimationStatus.dismissed
                                    ? const Text('Retem')
                                    : const Text('')
                      ],
                    );
                  },
                ),
        ],
      ),
    );
  }

  void _startBreath() {
    setState(() {
      _breathExerciseStatus = true;

      _controller.repeat(reverse: true);
      Future.delayed(const Duration(seconds: 40), () {
        setState(() {
          _animationIsEnd = true;
          _breathExerciseStatus = false;
        });

        _controller.stop();
      });
    });
  }

  void _stopBreath() {
    setState(() {
      _breathExerciseStatus = false;
      _controller.stop();
    });
  }
}
