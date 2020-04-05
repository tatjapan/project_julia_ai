import 'package:flutter/material.dart';

class LinearGradientMask extends StatelessWidget {
  LinearGradientMask({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment(0.78303, 0.30409),
        end: Alignment(-0.00181, 0.31162),
        stops: [
          0,
          1,
        ],
        colors: [
          Color.fromARGB(255, 247, 131, 97),
          Color.fromARGB(255, 245, 75, 100),
        ],
      ).createShader(bounds),
      child: child,
    );
  }
}
