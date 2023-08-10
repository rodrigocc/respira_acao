import 'package:flutter/material.dart';
import 'package:respira_acao/features/breaths/components/breath_slider.dart';

class AnimatedListView extends StatefulWidget {
  const AnimatedListView({super.key});

  @override
  _AnimatedListViewState createState() => _AnimatedListViewState();
}

class _AnimatedListViewState extends State<AnimatedListView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late List<String> _items;
  final Duration _duration = const Duration(seconds: 2);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
    );

    _items = List.generate(10, (index) => 'Respiração $index');

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
      appBar: AppBar(
        title: const Text('Respirações'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF0089CF), Color(0xFF00CDBA)]),
        ),
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Interval(
                    index / _items.length,
                    (index + 1) / _items.length,
                    curve: Curves.linear,
                  ),
                ),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const OnBoarding()));
                },
                title: Text(
                  _items[index],
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
}
