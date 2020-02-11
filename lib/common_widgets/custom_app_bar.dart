import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key key,
    this.icon,
    this.onPressed,
    this.height: 75.0,
  }) : super(key: key);

  final double height;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
