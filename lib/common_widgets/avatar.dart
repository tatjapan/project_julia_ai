import 'package:flutter/material.dart';
import 'package:project_julia_ai/values/values.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key key,
    this.photoUrl,
    @required this.radius,
  }) : super(key: key);

  final String photoUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primaryBackground,
        ),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.black12,
        backgroundImage: photoUrl != null ? NetworkImage(photoUrl) : null,
        child: photoUrl == null ? Icon(Icons.camera_alt, size: radius) : null,
      ),
    );
  }
}