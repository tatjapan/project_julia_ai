import 'package:flutter/material.dart';
import 'package:project_julia_ai/values/values.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.hinttext});

  final String hinttext;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 315,
        height: 45,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(51, 255, 255, 255),
          borderRadius: Radii.k22pxRadius,
        ),
        child: TextFormField(
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: hinttext,
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
        ),
      ),
    );
  }
}
