import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bondquest_2d/main.dart';

void main() {
  testWidgets('BondQuest app launches and shows mode selection', (WidgetTester tester) async {
    await tester.pumpWidget(const BondQuestApp());

    expect(find.text('Select Mode'), findsOneWidget);
    expect(find.text('Couple Mode'), findsOneWidget);
    expect(find.text('Family Mode'), findsOneWidget);
  });

  testWidgets('Couple mode navigation works', (WidgetTester tester) async {
    await tester.pumpWidget(const BondQuestApp());

    await tester.tap(find.text('Couple Mode'));
    await tester.pumpAndSettle();

    expect(find.text('Select Mini-Game'), findsOneWidget);
    expect(find.text('Heart Catch'), findsOneWidget);
  });

  testWidgets('Game navigation works', (WidgetTester tester) async {
    await tester.pumpWidget(const BondQuestApp());

    await tester.tap(find.text('Couple Mode'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Heart Catch'));
    await tester.pumpAndSettle();

    expect(find.text('Heart Catch Game'), findsOneWidget);
  });
}
