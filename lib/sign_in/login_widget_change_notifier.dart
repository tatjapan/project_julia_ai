import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_julia_ai/common_widgets/custom_gradient_button.dart';
import 'package:project_julia_ai/common_widgets/custom_sign_in_app_bar.dart';
import 'package:project_julia_ai/common_widgets/custom_text_field.dart';
import 'package:project_julia_ai/common_widgets/platform_alert_dialog.dart';
import 'package:project_julia_ai/common_widgets/platform_exception_alert_dialog.dart';
import 'package:project_julia_ai/model/email_sign_in_change_model.dart';
import 'package:project_julia_ai/model/email_sign_in_model.dart';
import 'package:project_julia_ai/sign_in//forgot_password_widget.dart';
import 'package:project_julia_ai/services/auth.dart';
import 'package:project_julia_ai/sign_in/email_sign_in_bloc.dart';
import 'package:project_julia_ai/values/values.dart';
import 'package:provider/provider.dart';

import 'validator.dart';

class LoginWidgetChangeNotifier extends StatefulWidget {
  LoginWidgetChangeNotifier({@required this.model});
  final EmailSignInChangeModel model;

  static Widget create(BuildContext context) {
    final AuthBase auth = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider<EmailSignInChangeModel>(
      create: (context) => EmailSignInChangeModel(auth: auth),
      child: Consumer<EmailSignInChangeModel>(
        builder: (context, model, _) => LoginWidgetChangeNotifier(model: model),
      ),
    );
  }

  @override
  _LoginWidgetChangeNotifierState createState() =>
      _LoginWidgetChangeNotifierState();
}

class _LoginWidgetChangeNotifierState extends State<LoginWidgetChangeNotifier> {
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
        title: "Log in failed.",
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
          body: _buildContent(),
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
              "Welcome back",
              textAlign: TextAlign.left,
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
            errorText: model.emailErrorText,
            enabled: model.isLoading == false,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            focusNode: _emailFocusNode,
            onEditingComplete: () => _emailEditingComplete(),
            onChanged: model.updateEmail,
          ),
          CustomTextField(
            hintText: "Password",
            errorText: model.passwordErrorText,
            enabled: model.isLoading == false,
            controller: _passwordController,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            focusNode: _passwordFocusNode,
            onEditingComplete: _submit,
            onChanged: model.updatePassword,
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
            onPressed: model.canSubmit ? _submit : null,
          ),
          SizedBox(
            height: 40.0,
          ),
          FlatButton(
            onPressed: () =>
                !model.isLoading ? _forgotYourPassWord(context) : null,
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
