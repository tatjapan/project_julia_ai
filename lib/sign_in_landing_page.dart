import 'package:flutter/material.dart';
import 'package:project_julia_ai/home.dart';
import 'package:project_julia_ai/services/auth.dart';
import 'package:project_julia_ai/welcome_widget/welcome_widget.dart';

class SignInLandingPage extends StatelessWidget {
  SignInLandingPage({@required this.auth});
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return WelcomeWidget(
                auth: auth,
              );
            }
            return Home(
              auth: auth,
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
