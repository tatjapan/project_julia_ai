import 'package:flutter/material.dart';
import 'package:project_julia_ai/common_widgets/custom_gradient_button.dart';
import 'package:project_julia_ai/login_widget/login_widget.dart';
import 'package:project_julia_ai/services/auth.dart';
import 'package:project_julia_ai/sign_up_widget/sign_up_widget.dart';
import 'package:project_julia_ai/values/values.dart';

class WelcomeWidget extends StatelessWidget {
  WelcomeWidget({@required this.auth});
  final AuthBase auth;

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  void _signUpWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => SignUpWidget(auth: auth),
      ),
    );
  }

  void _logInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => LoginWidget(auth: auth),
      ),
    );
  }

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
          body: _buildContent(context),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 150.0,
          ),
          Container(
            padding: EdgeInsets.only(
              top: 30.0,
              bottom: 5.0,
            ),
            child: Text(
              "We'll be with you for a great trip",
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
              "You can connect with imaginary local AI girls no matter where you are.",
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
              onPressed: () => _logInWithEmail(context),
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
            onPressed: () => _signUpWithEmail(context),
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
                  onPressed: _signInWithFacebook,
                ),
                Container(
                  width: 25.0,
                ),
                IconButton(
                  icon: Image.asset(
                    "assets/images/-icon-google.png",
                    fit: BoxFit.none,
                  ),
                  onPressed: _signInWithGoogle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
