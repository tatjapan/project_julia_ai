import 'package:flutter/material.dart';
import 'package:project_julia_ai/values/gradients.dart';

class CustomGradientButton extends StatelessWidget {
  CustomGradientButton({
    this.child,
    this.onPressed,
  });

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      child: RaisedButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient: Gradients.primaryGradient,
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
