
import 'package:flutter/material.dart';
import 'package:project_julia_ai/values/values.dart';


class IllustrationGuide3Widget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 36, 42, 55),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 94,
              margin: EdgeInsets.only(left: 1),
              decoration: BoxDecoration(
                color: AppColors.secondaryBackground,
                boxShadow: [
                  Shadows.primaryShadow,
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 18,
                    height: 16,
                    margin: EdgeInsets.only(left: 14, top: 52),
                    child: Image.asset(
                      "assets/images/-icon-back.png",
                      fit: BoxFit.none,
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(top: 54, right: 15),
                    child: Text(
                      "Done",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: AppColors.secondaryText,
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                        letterSpacing: -0.41,
                        height: 1.29412,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 218,
                height: 218,
                margin: EdgeInsets.only(top: 21),
                decoration: BoxDecoration(
                  color: AppColors.primaryBackground,
                  borderRadius: BorderRadius.all(Radius.circular(109)),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 15,
                      right: 15,
                      child: Container(
                        height: 188,
                        decoration: BoxDecoration(
                          color: AppColors.primaryBackground,
                          borderRadius: BorderRadius.all(Radius.circular(94)),
                        ),
                        child: Container(),
                      ),
                    ),
                    Positioned(
                      left: 4,
                      right: 5,
                      child: Image.asset(
                        "assets/images/undraw-destinations-fpv7.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 100,
                height: 10,
                margin: EdgeInsets.only(top: 25),
                child: Image.asset(
                  "assets/images/slider-2.png",
                  fit: BoxFit.none,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 247,
                margin: EdgeInsets.only(top: 16),
                child: Text(
                  "Interact with cool things",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w800,
                    fontSize: 34,
                    letterSpacing: 0.60714,
                    height: 1.17647,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 309,
                margin: EdgeInsets.only(top: 12),
                child: Text(
                  "Your fav local AI will take you out to great bars in up-and-coming neighborhoods, or down to the best underground music spots etc… ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    letterSpacing: -0.41,
                    height: 1.29412,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}