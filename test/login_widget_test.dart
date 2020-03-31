import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project_julia_ai/services/auth.dart';
import 'package:project_julia_ai/sign_in/login_widget.dart';
import 'package:provider/provider.dart';

class MockAuth extends Mock implements AuthBase {}

void main() {
  MockAuth mockAuth;

  setUp(() {
    mockAuth = MockAuth();
  });

  Future<void> pumpLoginWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      Provider<AuthBase>(
        create: (_) => mockAuth,
        child: MaterialApp(
          home: Scaffold(
            body: LoginWidget(),
          ),
        ),
      ),
    );
  }

  group('Log In', () {
    testWidgets(
        'When user does not enter the email and password'
        'AND user taps on the login button'
        'THEN signInWithEmailAndPassword is not called',
        (WidgetTester tester) async {
      await pumpLoginWidget(tester);

      final logInButton = find.text('Log In');
      await tester.tap(logInButton);

      verifyNever(mockAuth.signInWithEmailAndPassword(any, any));
    });

    testWidgets(
        'When user enters the email and password'
        'AND user taps on the login button'
        'THEN signInWithEmailAndPassword is called',
        (WidgetTester tester) async {
      await pumpLoginWidget(tester);

      const email = 'email@email.com';
      const password = 'password';

      final emailField = find.byKey(Key('email'));
      expect(emailField, findsOneWidget);
      await tester.enterText(emailField, email);

      final passwordField = find.byKey(Key('password'));
      expect(passwordField, findsOneWidget);
      await tester.enterText(passwordField, password);

      await tester.pump();

      final logInButton = find.text('Log In');
      await tester.tap(logInButton);

      verify(mockAuth.signInWithEmailAndPassword(email, password)).called(1);
    });
  });
}
