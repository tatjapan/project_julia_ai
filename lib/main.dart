import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_julia_ai/welcome_widget/welcome_widget.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeWidget(),
    );
  }
}