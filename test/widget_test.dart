// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quest_phase/pages/new_game_page/new_game_page.dart';

void main() {
  Widget createPageForTesting({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  String? fromRichTextToPlainText(Widget widget) {
    if (widget is RichText) {
      return widget.text.toPlainText();
    }
    return null;
  }

  testWidgets('welcome smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(createPageForTesting(child: const NewGamePage()));
    expect(
      find.byWidgetPredicate(
        (widget) => fromRichTextToPlainText(widget) == 'WELCOME',
      ),
      findsOneWidget,
    );
  });
}
