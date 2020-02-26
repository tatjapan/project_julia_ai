import 'package:flutter/material.dart';
import 'package:project_julia_ai/values/values.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.hintText,
    this.errorText,
    this.enabled,
    this.obscureText: false,
    this.controller,
    this.keyboardType,
    this.focusNode,
    this.onEditingComplete,
    this.onChanged,
  });

  final String hintText;
  final String errorText;
  final bool enabled;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final VoidCallback onEditingComplete;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: 315,
        height: 45,
        margin: EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
        ),
        decoration: BoxDecoration(
          color: Color.fromARGB(51, 255, 255, 255),
          borderRadius: Radii.k22pxRadius,
        ),
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.left,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            errorText: errorText,
            enabled: enabled,
            hintStyle: TextStyle(
              color: AppColors.primaryText,
            ),
            contentPadding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            border: InputBorder.none,
          ),
          style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: "Avenir",
            fontWeight: FontWeight.w300,
            fontSize: 17,
          ),
          maxLines: 1,
          autocorrect: false,
          keyboardType: keyboardType,
          focusNode: focusNode,
          textInputAction: TextInputAction.next,
          onEditingComplete: onEditingComplete,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
