import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_julia_ai/common_widgets/custom_gradient_button.dart';
import 'package:project_julia_ai/common_widgets/custom_sign_in_app_bar.dart';
import 'package:project_julia_ai/common_widgets/custom_text_field.dart';
import 'package:project_julia_ai/common_widgets/platform_exception_alert_dialog.dart';
import 'package:project_julia_ai/model/email_sign_in_change_model.dart';
import 'package:project_julia_ai/model/email_sign_in_model.dart';
import 'package:project_julia_ai/services/auth.dart';
import 'package:project_julia_ai/sign_in/email_create_account_bloc.dart';
import 'package:project_julia_ai/values/values.dart';
import 'package:provider/provider.dart';

import 'validator.dart';

class SignUpWidgetChangeNotifier extends StatefulWidget {
  SignUpWidgetChangeNotifier({@required this.model});
  final EmailSignInChangeModel model;

  static Widget create(BuildContext context) {
    final AuthBase auth = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider<EmailSignInChangeModel>(
      create: (context) => EmailSignInChangeModel(auth: auth),
      child: Consumer<EmailSignInChangeModel>(
        builder: (context, model, _) =>
            SignUpWidgetChangeNotifier(model: model),
      ),
    );
  }

  @override
  _SignUpWidgetChangeNotifierState createState() =>
      _SignUpWidgetChangeNotifierState();
}

class _SignUpWidgetChangeNotifierState
    extends State<SignUpWidgetChangeNotifier> {
//  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  EmailSignInChangeModel get model => widget.model;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    try {
      await model.submit();
      Navigator.of(context).pop();
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: "Sign up failed.",
        exception: e,
      ).show(context);
    }
  }

  void _emailEditingComplete() {
    final newFocus = model.emailValidator.isValid(model.email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
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
              image: AssetImage("assets/images/background-signup.png"),
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
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Create an account",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir Next LT Pro",
                fontWeight: FontWeight.w800,
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
//            controller: _userNameController,
            hintText: "Username",
            enabled: model.isLoading == false,
          ),
          CustomTextField(
            controller: _emailController,
            hintText: "Email",
            errorText: model.emailErrorText,
            enabled: model.isLoading == false,
            keyboardType: TextInputType.emailAddress,
            focusNode: _emailFocusNode,
            onEditingComplete: () => _emailEditingComplete(),
            onChanged: model.updateEmail,
          ),
          CustomTextField(
            controller: _passwordController,
            hintText: "Password",
            errorText: model.passwordErrorText,
            enabled: model.isLoading == false,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            focusNode: _passwordFocusNode,
            onEditingComplete: _submit,
            onChanged: model.updatePassword,
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.all(30.0),
            width: 275.0,
            child: Text(
              "By clicking Sign up you agree to the following Terms and Conditions without reservation. ",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w300,
                fontSize: 18,
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
            onPressed: model.canSubmit ? _submit : null,
          ),
        ],
      ),
    );
  }
}