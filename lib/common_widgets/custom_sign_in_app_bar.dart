import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSignInAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  CustomSignInAppBar({
    Key key,
    this.icon,
    this.onPressed,
    @required this.height,
  }) : super(key: key);

  final double height;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: icon,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
