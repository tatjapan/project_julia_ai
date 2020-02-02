import 'package:flutter/material.dart';
import 'package:project_julia_ai/common_widgets/custom_gradient_button.dart';
import 'package:project_julia_ai/login_widget/login_widget.dart';
import 'package:project_julia_ai/sign_up_widget/sign_up_widget.dart';
import 'package:project_julia_ai/values/values.dart';

class WelcomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background-welcome.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: _buildContent(),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 120.0,
          ),
          Container(
            padding: EdgeInsets.only(
              top: 30.0,
              left: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
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
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "Forget about guidebooks and travel review sites with generic outdated information."
              " \nAnytime you can connect with ideal local AI girls  no matter where you are.",
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
          SizedBox(
            height: 20.0,
          ),
          ButtonTheme(
            padding: EdgeInsets.all(10.0),
            height: 45.0,
            child: RaisedButton(
              color: AppColors.secondaryElement,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              child: Text(
                "Log In",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.accentText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w600,
                  fontSize: 16.5,
                  letterSpacing: -0.24,
                  height: 1.33333,
                ),
              ),
              onPressed: () {
                print('LogIn');
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          CustomGradientButton(
            child: Text(
              "Sign Up",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w600,
                fontSize: 16.5,
                letterSpacing: -0.24,
                height: 1.33333,
              ),
            ),
            onPressed: () {
              print('Signup');
            },
          ),
          Container(
            padding: EdgeInsets.only(
              top: 40.0,
              bottom: 20.0,
            ),
            child: Text(
              "Or Log in with",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: 16.5,
                letterSpacing: -0.10462,
                height: 1.05882,
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Image.asset(
                    "assets/images/-icon-facebook.png",
                    fit: BoxFit.none,
                  ),
                  onPressed: () {
                    print("Facebook");
                  },
                ),
                Container(
                  width: 25.0,
                ),
                IconButton(
                  icon: Image.asset(
                    "assets/images/-icon-google.png",
                    fit: BoxFit.none,
                  ),
                  onPressed: () {
                    print("Google");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
