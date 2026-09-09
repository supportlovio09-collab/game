import 'package:bondquest_2d/main.dart';
import 'package:flutter_test/flutter_test.dart';
void main(){testWidgets('opens world',(tester)async{await tester.pumpWidget(const BondQuestApp());expect(find.text('BondQuest'),findsOneWidget);await tester.tap(find.text('Enter the world'));await tester.pumpAndSettle();expect(find.text('BondQuest World'),findsOneWidget);});}
