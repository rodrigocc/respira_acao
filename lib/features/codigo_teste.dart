import 'dart:async';

import 'package:flutter/material.dart';

class TesteAnimacao extends StatefulWidget {
  const TesteAnimacao({super.key});

  @override
  State<TesteAnimacao> createState() => _TesteAnimacaoState();
}

class _TesteAnimacaoState extends State<TesteAnimacao>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  final double beginValue = 0.0;
  final double endValue = 1.0;

  void startAnimation() {
    setState(() {
      _animationController.forward();
    });
  }

  void stopAnimation() {
    setState(() {
      _animationController.stop();
    });
  }

  void continueAnimation() {
    setState(() {
      _animationController.reverse();
    });
  }

  void animationRunner() {
    startAnimation();
    Future.delayed(const Duration(seconds: 3), () {
      stopAnimation();
    });
    Future.delayed(const Duration(seconds: 7), () {
      continueAnimation();
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), //
    );

    _animation = Tween<double>(
      begin: beginValue,
      end: endValue,
    ).animate(_animationController);

    _animationController.addListener(() {
      // if (_animationController.isCompleted) {

      // }
      if (_animationController.isDismissed) {
        animationRunner();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 3,
          onPressed: animationRunner,
          child: const Icon(
            Icons.play_arrow_rounded,
            color: Colors.black,
          )),
      body: Container(
        decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF0089CF), Color(0xFF00CDBA)]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Vamos Praticar?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            Center(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue,
                    ),
                    width: (_animation.value * 120),
                    height: (_animation.value * 120),
                  );
                },
              ),
            ),
            _animation.status == AnimationStatus.reverse
                ? const Text('Expira')
                : _animation.status == AnimationStatus.forward
                    ? const Text('Inspira')
                    : _animation.status == AnimationStatus.completed
                        ? const Text('Retem')
                        : const Text('')
          ],
        ),
      ),
    );
  }
}
