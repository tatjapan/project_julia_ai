import 'package:flutter/material.dart';
import 'package:project_julia_ai/services/auth.dart';
import 'package:project_julia_ai/sign_in_landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInLandingPage(
        auth: Auth(),
      ),
    );
  }
}
