
import 'package:flutter/material.dart';
import 'package:project_julia_ai/values/values.dart';


class WelcomeWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/background-4.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 44,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 30),
                          child: Text(
                            "9:41",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "SF Pro Text",
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              letterSpacing: -0.165,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 68,
                          height: 14,
                          margin: EdgeInsets.only(right: 14),
                          child: Image.asset(
                            "assets/images/container.png",
                            fit: BoxFit.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 25, top: 269),
                      child: Text(
                        "Be with you \nfor great trip",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Avenir",
                          fontWeight: FontWeight.w900,
                          fontSize: 44,
                          letterSpacing: -0.704,
                          height: 1.13636,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 315,
                      margin: EdgeInsets.only(top: 14),
                      child: Text(
                        "Forget about guidebooks and travel review sites with generic outdated information. \nAnytime you can connect with imaginally local AI girls  no matter where you are.",
                        textAlign: TextAlign.left,
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
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 315,
                      height: 44,
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryElement,
                        borderRadius: Radii.k22pxRadius,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Log In",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.accentText,
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              letterSpacing: -0.24,
                              height: 1.33333,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 315,
                      height: 44,
                      margin: EdgeInsets.only(bottom: 48),
                      decoration: BoxDecoration(
                        gradient: Gradients.primaryGradient,
                        borderRadius: Radii.k22pxRadius,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              letterSpacing: -0.36176,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 120,
                      height: 78,
                      margin: EdgeInsets.only(bottom: 27),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "Or log in with",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                letterSpacing: -0.10462,
                                height: 1.05882,
                              ),
                            ),
                          ),
                          Container(
                            height: 29,
                            margin: EdgeInsets.only(left: 26, top: 23, right: 22),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 14,
                                    height: 29,
                                    child: Image.asset(
                                      "assets/images/-icon-facebook.png",
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    margin: EdgeInsets.only(top: 4),
                                    child: Image.asset(
                                      "assets/images/-icon-google.png",
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 135,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryElement,
                        borderRadius: BorderRadius.all(Radius.circular(2.5)),
                      ),
                      child: Container(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}