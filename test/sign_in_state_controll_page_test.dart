import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project_julia_ai/home/home.dart';
import 'package:project_julia_ai/sign_in/sign_in_state_controll_page.dart';
import 'package:project_julia_ai/sign_in/welcome_widget.dart';
import 'package:provider/provider.dart';
import 'package:project_julia_ai/services/auth.dart';

import 'mocks.dart';

void main() {
  MockAuth mockAuth;
  StreamController<User> onAuthStateChangedController;

  setUp(() {
    mockAuth = MockAuth();
    onAuthStateChangedController = StreamController<User>();
  });

  tearDown(() {
    onAuthStateChangedController.close();
  });

  Future<void> pumpSignInStateControllPage(WidgetTester tester) async {
    await tester.pumpWidget(
      Provider<AuthBase>(
        create: (_) => mockAuth,
        child: MaterialApp(
          home: SignInStateControllPage(),
        ),
      ),
    );
    await tester.pump();
  }

  void stubOnAuthStateChangedYields(Iterable<User> onAuthStateChanged) {
    onAuthStateChangedController
        .addStream(Stream<User>.fromIterable(onAuthStateChanged));
    when(mockAuth.onAuthStateChanged).thenAnswer((_) {
      return onAuthStateChangedController.stream;
    });
  }

  testWidgets('stream waiting', (WidgetTester tester) async {
    stubOnAuthStateChangedYields([]);

    await pumpSignInStateControllPage(tester);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('null user', (WidgetTester tester) async {
    stubOnAuthStateChangedYields([null]);

    await pumpSignInStateControllPage(tester);

    expect(find.byType(WelcomeWidget), findsOneWidget);
  });

  testWidgets('non null user', (WidgetTester tester) async {
    stubOnAuthStateChangedYields([User(uid: '123')]);

    await pumpSignInStateControllPage(tester);

    expect(find.byType(Home), findsOneWidget);
  });
}
