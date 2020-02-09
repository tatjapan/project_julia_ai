import 'package:flutter/material.dart';
import 'package:project_julia_ai/values/colors.dart';
import 'package:project_julia_ai/values/gradients.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: isActive ? 10 : 7,
      width: isActive ? 10 : 7,
      decoration: BoxDecoration(
        color: isActive ? Colors.red : AppColors.accentElement,
        borderRadius: BorderRadius.all(
          Radius.circular(
            15.0,
          ),
        ),
      ),
    );
  }
}
