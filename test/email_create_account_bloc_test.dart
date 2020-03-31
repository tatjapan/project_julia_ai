import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project_julia_ai/model/email_sign_in_model.dart';
import 'package:project_julia_ai/sign_in/email_create_account_bloc.dart';
import 'mocks.dart';

void main() {
  MockAuth mockAuth;
  EmailCreateAccountBloc bloc;

  setUp(() {
    mockAuth = MockAuth();
    bloc = EmailCreateAccountBloc(auth: mockAuth);
  });

  tearDown(() {
    bloc.dispose();
  });

  test(
      'WHEN email is updated'
      'AND password is updated'
      'AND submit is called'
      'THEN modelStream emits the correct events', () async {
    when(mockAuth.signInWithEmailAndPassword(any, any))
        .thenThrow(PlatformException(code: 'ERROR'));
    expect(
      bloc.modelStream,
      emitsInAnyOrder([
        EmailSignInModel(),
        EmailSignInModel(
          email: 'email@email.com',
        ),
        EmailSignInModel(
          email: 'email@email.com',
          password: 'password',
        ),
        EmailSignInModel(
          email: 'email@email.com',
          password: 'password',
          submitted: true,
          isLoading: true,
        ),
        EmailSignInModel(
          email: 'email@email.com',
          password: 'password',
          submitted: true,
          isLoading: false,
        ),
      ]),
    );

    bloc.updateEmail('email@email.com');

    bloc.updatePassword('password');

    try {
      await bloc.submit();
    } catch (_) {}
  });
}
