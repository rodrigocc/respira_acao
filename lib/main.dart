import 'package:flutter/material.dart';

import 'my_app.dart';

import 'config/injection_container.dart' as di;

void main() async {
  runApp(const MyApp());

  di.init();
}
