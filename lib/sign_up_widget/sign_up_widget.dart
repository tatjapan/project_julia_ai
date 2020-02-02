import 'package:flutter/material.dart';
import 'package:project_julia_ai/common_widgets/custom_gradient_button.dart';
import 'package:project_julia_ai/common_widgets/custom_text_field.dart';
import 'package:project_julia_ai/values/values.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background-signup.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Image.asset(
                    "assets/images/-icon-back.png",
                    fit: BoxFit.none,
                  ),
                  onPressed: () {
                    print("Back to Welcome page");
                  },
                )
              ],
            ),
          ),
          body: _buildContent(),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Create an account",
              textAlign: TextAlign.center,
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
          SizedBox(
            height: 40.0,
          ),
          CustomTextField(
            hinttext: "Username",
          ),
          CustomTextField(
            hinttext: "Email",
          ),
          CustomTextField(
            hinttext: "Password",
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.all(30.0),
            width: 275.0,
            child: Text(
              "By clicking Sign up you agree to the following Terms and Conditions without reservation ",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w300,
                fontSize: 17,
                letterSpacing: -0.41,
                height: 1.29412,
              ),
            ),
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
        ],
      ),
    );
  }
}
