import 'package:flutter/material.dart';
import 'package:project_julia_ai/sign_in/validator.dart';

class EmailSignInModel with EmailAndPasswordValidators {
  EmailSignInModel({
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.submitted = false,
  });
  final String email;
  final String password;
  final bool isLoading;
  final bool submitted;

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

  EmailSignInModel copyWith({
    String email,
    String password,
    bool isLoading,
    bool submitted,
  }) {
    return EmailSignInModel(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      submitted: submitted ?? this.submitted,
    );
  }

  @override
  int get hashCode => hashValues(email, password, isLoading, submitted);

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final EmailSignInModel otherModel = other;
    return email == otherModel.email &&
        password == otherModel.password &&
        isLoading == otherModel.isLoading &&
        submitted == otherModel.submitted;
  }

  @override
  String toString() =>
      'email: $email, password: $password, isLoading: $isLoading, submitted: $submitted';
}
