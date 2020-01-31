import 'package:flutter/material.dart';
import 'package:project_julia_ai/welcome_widget/welcome_widget.dart';

import 'welcome_widget/welcome_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeWidget(),
    );
  }
}
