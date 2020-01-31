
import 'package:flutter/material.dart';
import 'package:project_julia_ai/values/values.dart';


class LoginWidget extends StatelessWidget {
  
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
                "assets/images/background-3.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
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
                      width: 18,
                      height: 16,
                      margin: EdgeInsets.only(left: 15, top: 8),
                      child: Image.asset(
                        "assets/images/-icon-back.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 30, top: 58),
                      child: Text(
                        "Welcome back",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Avenir",
                          fontWeight: FontWeight.w900,
                          fontSize: 34,
                          letterSpacing: 0.60714,
                          height: 1.17647,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 30, top: 1),
                      child: Text(
                        "Login to your account",
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
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 315,
                      height: 44,
                      margin: EdgeInsets.only(top: 39),
                      decoration: BoxDecoration(
                        color: AppColors.primaryElement,
                        borderRadius: Radii.k22pxRadius,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              "Email",
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
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 315,
                      height: 44,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: AppColors.primaryElement,
                        borderRadius: Radii.k22pxRadius,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              "Password",
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
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 315,
                      height: 44,
                      margin: EdgeInsets.only(top: 45),
                      decoration: BoxDecoration(
                        gradient: Gradients.primaryGradient,
                        borderRadius: Radii.k22pxRadius,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Log In",
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
                      margin: EdgeInsets.only(top: 49),
                      child: Text(
                        "Forgot your password?",
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
          ],
        ),
      ),
    );
  }
}