import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_julia_ai/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
