import 'package:flutter/material.dart';
import 'package:project_julia_ai/services/auth.dart';
import 'package:project_julia_ai/sign_in/validator.dart';

class EmailSignInChangeModel with EmailAndPasswordValidators, ChangeNotifier {
  EmailSignInChangeModel({
    @required this.auth,
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.submitted = false,
  });
  final AuthBase auth;
  String email;
  String password;
  bool isLoading;
  bool submitted;

  Future<void> submit() async {
    updateWith(submitted: true, isLoading: false);
    try {
      await auth.createUserWithEmailAndPassword(this.email, this.password);
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

  bool get canSubmit {
    return emailValidator.isValid(email) &&
        passwordValidator.isValid(password) &&
        !isLoading;
  }

  String get emailErrorText {
    bool showErrorTextOfEmail = submitted && !emailValidator.isValid(email);
    return showErrorTextOfEmail ? invalidEmailErrorText : null;
  }

  String get passwordErrorText {
    bool showErrorTextOfPassword =
        submitted && !passwordValidator.isValid(password);
    return showErrorTextOfPassword ? invalidPasswordErrorText : null;
  }

  void updateEmail(email) => updateWith(email: email);
  void updatePassword(password) => updateWith(password: password);

  void updateWith({
    String email,
    String password,
    bool isLoading,
    bool submitted,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.isLoading = isLoading ?? this.isLoading;
    this.submitted = submitted ?? this.submitted;
    notifyListeners();
  }
}
