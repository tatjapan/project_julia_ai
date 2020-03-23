import 'package:flutter/material.dart';
import 'package:project_julia_ai/home/home.dart';
import 'package:project_julia_ai/home/tab_state_controll_page.dart';
import 'package:project_julia_ai/services/auth.dart';
import 'package:project_julia_ai/services/database.dart';
import 'package:provider/provider.dart';
import 'package:project_julia_ai/sign_in/welcome_widget.dart';

class SignInStateControllPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return WelcomeWidget.create(context);
            }
            return Provider<Database>(
              create: (_) => FirestoreDatabase(uid: user.uid),
              child: TabStateControllPage(),
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
