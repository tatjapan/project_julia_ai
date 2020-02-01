import 'package:flutter/material.dart';
import 'package:project_julia_ai/values/colors.dart';
import 'package:project_julia_ai/values/gradients.dart';
import 'package:project_julia_ai/values/radii.dart';

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
      padding: EdgeInsets.all(10.0),
      height: 45.0,
      decoration: BoxDecoration(
        gradient: Gradients.primaryGradient,
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
