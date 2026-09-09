import 'package:bondquest_2d/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('couple mode opens the 2D world', (tester) async {
    await tester.pumpWidget(const BondQuestApp());
    await tester.tap(find.text('Enter the world'));
    await tester.pumpAndSettle();
    expect(find.text('BondQuest World'), findsOneWidget);
    expect(find.text('Love'), findsOneWidget);
    expect(find.text('Memory'), findsOneWidget);
    expect(find.text('Challenge'), findsOneWidget);
  });

  testWidgets('family selection changes avatar', (tester) async {
    await tester.pumpWidget(const BondQuestApp());
    await tester.tap(find.text('Family'));
    await tester.tap(find.text('Enter the world'));
    await tester.pumpAndSettle();
    expect(find.text('👨‍👩‍👧'), findsOneWidget);
  });

  testWidgets('Love Garden launches Heart Catch', (tester) async {
    await tester.pumpWidget(const BondQuestApp());
    await tester.tap(find.text('Enter the world'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Love'));
    await tester.pumpAndSettle();
    expect(find.text('💜 Heart Catch'), findsOneWidget);
    expect(find.bySemanticsLabel('Catch heart'), findsOneWidget);
  });

  testWidgets('direction control is interactive', (tester) async {
    await tester.pumpWidget(const BondQuestApp());
    await tester.tap(find.text('Enter the world'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.keyboard_arrow_right));
    await tester.pump();
    expect(tester.takeException(), isNull);
  });
}
