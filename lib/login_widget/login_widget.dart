import 'package:flutter/material.dart';
import 'package:project_julia_ai/common_widgets/custom_gradient_button.dart';
import 'package:project_julia_ai/common_widgets/custom_sign_in_app_bar.dart';
import 'package:project_julia_ai/common_widgets/custom_text_field.dart';
import 'package:project_julia_ai/forgot_password_widget/forgot_password_widget.dart';
import 'package:project_julia_ai/values/values.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background-login.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomSignInAppBar(
            icon: Image.asset(
              "assets/images/-icon-back.png",
              fit: BoxFit.none,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          body: _buildContent(context),
        ),
      ],
    );
  }

  void _forgotYourPassWord(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => ForgotPasswordWidget(),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
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
          Container(
            padding: EdgeInsets.only(
              left: 10.0,
              right: 10.0,
            ),
            child: Text(
              "Login to your account",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: 18,
                letterSpacing: -0.41,
                height: 1.29412,
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          CustomTextField(
            hintText: "Email",
          ),
          CustomTextField(
            hintText: "Password",
          ),
          SizedBox(
            height: 25.0,
          ),
          CustomGradientButton(
            child: Text(
              "Log In",
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
              print('Login');
            },
          ),
          SizedBox(
            height: 40.0,
          ),
          FlatButton(
            onPressed: () => _forgotYourPassWord(context),
            child: Text(
              "Forgot your password?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
