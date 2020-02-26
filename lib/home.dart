import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_julia_ai/common_widgets/custom_app_bar.dart';
import 'package:project_julia_ai/common_widgets/platform_alert_dialog.dart';
import 'package:project_julia_ai/services/auth.dart';
import 'package:project_julia_ai/values/values.dart';
import 'package:project_julia_ai/values/my_flutter_app_icons.dart';

class Home extends StatelessWidget {
  Home({@required this.auth});

  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: "Logout",
      content: "Are you sure that you want to logout?",
      cancelActionText: "Cancel",
      defaultActionText: "Logout",
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackground,
      appBar: CustomAppBar(
        icon: Icon(Icons.settings),
        onPressed: () => _confirmSignOut(context),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 30.0,
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: AppColors.primaryBackground,
        iconSize: 30.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.newhome),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.message),
            title: Text("Messages"),
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.bell),
            title: Text("Notifications"),
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.profiles),
            title: Text("Profiles"),
          ),
        ],
      ),
    );
  }
}
