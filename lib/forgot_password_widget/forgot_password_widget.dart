
import 'package:flutter/material.dart';
import 'package:project_julia_ai/values/values.dart';


class ForgotPasswordWidget extends StatelessWidget {
  
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
                "assets/images/background-2.png",
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
                      width: 16,
                      height: 16,
                      child: Image.asset(
                        "assets/images/-icon-close.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 15, top: 58),
                      child: Text(
                        "Forgot password",
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
                      width: 301,
                      margin: EdgeInsets.only(left: 15, top: 11),
                      child: Text(
                        "Please enter your email address. You will receive a link to create a new password via email.",
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
                      margin: EdgeInsets.only(top: 39),
                      decoration: BoxDecoration(
                        color: AppColors.accentElement,
                        borderRadius: Radii.k22pxRadius,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              "Your email",
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
                            "Send password reset email",
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