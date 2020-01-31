
import 'package:flutter/material.dart';
import 'package:project_julia_ai/values/values.dart';


class SignUpWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/background.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 15,
              top: 52,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 18,
                      height: 16,
                      child: Image.asset(
                        "assets/images/-icon-back.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 15, top: 58),
                      child: Text(
                        "Create an account",
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
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 315,
                      height: 44,
                      margin: EdgeInsets.only(top: 64),
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
                              "Username",
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
                      width: 275,
                      margin: EdgeInsets.only(top: 60),
                      child: Text(
                        "By clicking Sign up you agree to the following Terms and Conditions without reservation ",
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
                      margin: EdgeInsets.only(top: 31),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}