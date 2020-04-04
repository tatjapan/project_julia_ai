import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_julia_ai/common_widgets/custom_gradient_button.dart';
import 'package:project_julia_ai/common_widgets/platform_exception_alert_dialog.dart';
import 'package:project_julia_ai/services/auth.dart';
import 'package:project_julia_ai/sign_in/login_widget_change_notifier.dart';
import 'package:project_julia_ai/sign_in/sign_in_manager.dart';
import 'package:project_julia_ai/sign_in/sign_up_widget_change_notifier.dart';
import 'package:provider/provider.dart';
import 'package:project_julia_ai/values/values.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({
    Key key,
    @required this.manager,
    @required this.isLoading,
  }) : super(key: key);
  final SignInManager manager;
  final bool isLoading;

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __) => Provider<SignInManager>(
          create: (_) => SignInManager(auth: auth, isLoading: isLoading),
          child: Consumer<SignInManager>(
            builder: (context, manager, _) => WelcomeWidget(
              manager: manager,
              isLoading: isLoading.value,
            ),
          ),
        ),
      ),
    );
  }

  void _showSignInError(BuildContext context, PlatformException exception) {
    PlatformExceptionAlertDialog(
      title: 'Sign in failed',
      exception: exception,
    ).show(context);
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await manager.signInWithGoogle();
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      await manager.signInWithFacebook();
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    }
  }

  void _signUpWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => SignUpWidgetChangeNotifier.create(context),
      ),
    );
  }

  void _logInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => LoginWidgetChangeNotifier.create(context),
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
                fontFamily: "Avenir Next LT Pro",
                fontWeight: FontWeight.w800,
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
            child: _buildHeader(),
          ),
          SizedBox(
            height: 20.0,
          ),
          ButtonTheme(
            padding: EdgeInsets.all(10.0),
            height: 45.0,
            child: RaisedButton(
              color: AppColors.secondaryElement,
              disabledColor: AppColors.secondaryElement,
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
              onPressed: isLoading ? null : () => _logInWithEmail(context),
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
            onPressed: isLoading ? null : () => _signUpWithEmail(context),
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
                  onPressed:
                      isLoading ? null : () => _signInWithFacebook(context),
                ),
                Container(
                  width: 25.0,
                ),
                IconButton(
                  icon: Image.asset(
                    "assets/images/-icon-google.png",
                    fit: BoxFit.none,
                  ),
                  onPressed:
                      isLoading ? null : () => _signInWithGoogle(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
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
    );
  }
}
