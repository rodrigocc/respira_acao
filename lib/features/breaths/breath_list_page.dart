import 'package:flutter/material.dart';
import 'package:respira_acao/features/breaths/components/animated_listview.dart';

class BreathListPage extends StatefulWidget {
  const BreathListPage({super.key});

  @override
  State<BreathListPage> createState() => _BreathListPageState();
}

class _BreathListPageState extends State<BreathListPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AnimatedListView(),
    );
  }
}
