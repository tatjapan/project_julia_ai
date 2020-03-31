import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_julia_ai/common_widgets/custom_gradient_button.dart';

void main() {
  testWidgets('onPressed callback', (WidgetTester tester) async {
    var pressed = false;
    await tester.pumpWidget(
      MaterialApp(
        home: CustomGradientButton(
          child: Text('Tap'),
          onPressed: () => pressed = true,
        ),
      ),
    );
    final button = find.byType(RaisedButton);
    expect(button, findsOneWidget);
    expect(find.byType(FlatButton), findsNothing);
    expect(find.text('Tap'), findsOneWidget);
    await tester.tap(button);
    expect(pressed, true);
  });
}
