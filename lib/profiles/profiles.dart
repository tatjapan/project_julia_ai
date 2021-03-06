import 'package:flutter/material.dart';
import 'package:project_julia_ai/common_widgets/avatar.dart';
import 'package:project_julia_ai/common_widgets/custom_app_bar.dart';
import 'package:project_julia_ai/common_widgets/platform_alert_dialog.dart';
import 'package:project_julia_ai/services/auth.dart';
import 'package:project_julia_ai/values/values.dart';
import 'package:provider/provider.dart';

class Profiles extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
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
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: AppColors.secondaryBackground,
      appBar: CustomAppBar(
        icon: Icon(Icons.settings),
        onPressed: () => _confirmSignOut(context),
      ),
      body: Container(
        child: PreferredSize(
          child: _buildUserInfo(user),
          preferredSize: Size.fromHeight(300),
        ),
      ),
    );
  }

  Widget _buildUserInfo(User user) {
    return Column(
      children: <Widget>[
        Avatar(
          photoUrl: user.photoUrl,
          radius: 100,
        ),
        SizedBox(
          height: 20.0,
        ),
        if (user.displayName != null)
          Text(
            user.displayName,
            style: TextStyle(color: AppColors.primaryText),
          ),
      ],
    );
  }
}
