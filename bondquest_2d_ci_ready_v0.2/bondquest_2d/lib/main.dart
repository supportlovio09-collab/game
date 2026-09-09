import 'package:flutter/material.dart';
import 'src/home_page.dart';

void main() => runApp(const BondQuestApp());

class BondQuestApp extends StatelessWidget {
  const BondQuestApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'BondQuest 2D',
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7257D3)),
      scaffoldBackgroundColor: const Color(0xFFF8F6FF),
    ),
    home: const HomePage(),
  );
}
