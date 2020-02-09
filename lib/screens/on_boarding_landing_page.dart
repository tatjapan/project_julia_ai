import 'package:flutter/material.dart';
import 'package:project_julia_ai/values/values.dart';
import 'package:project_julia_ai/on_boading_widget/on_boarding_layout_view.dart';

class OnBoardingLandingPage extends StatefulWidget {
  @override
  _OnBoardingLandingPageState createState() => _OnBoardingLandingPageState();
}

class _OnBoardingLandingPageState extends State<OnBoardingLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackground,
      body: onBoardingBody(),
    );
  }

  Widget onBoardingBody() => Container(
        child: OnBoardingLayoutView(),
      );
}
