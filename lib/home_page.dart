import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // AnimationController animationController = AnimationController(
  //   duration: const Duration(milliseconds: 300),
  //   vsync: this,
  // )..repeat();

  String _breathContext = "Inspira";

  double containerHeight = 100;
  double containerWidht = 100;
  int duration = 2;
  bool isBreathStarted = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.play_arrow),
            onPressed: () {
              startBreath();
            }),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              widthFactor: 100,
              child: AnimatedContainer(
                height: containerHeight,
                width: containerWidht,
                duration: Duration(seconds: duration),
                onEnd: () {
                  endBreath();
                },
                decoration: const BoxDecoration(color: Colors.blueAccent, shape: BoxShape.circle),
              ),
            ),
            isBreathStarted
                ? Text(
                    _breathContext,
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
                  )
                : const SizedBox.shrink()
          ],
        ));
  }

  void startBreath() {
    setState(() {
      isBreathStarted = true;
      containerHeight = 200;
      containerWidht = 200;
      Future.delayed(const Duration(seconds: 5), () {
        _breathContext = "Inspira";
      });
    });
  }

  void endBreath() {
    setState(() {
      containerHeight = 100;
      containerWidht = 100;
      _breathContext = "Expira";
      Future.delayed(const Duration(seconds: 5), () {});
    });
  }
}
