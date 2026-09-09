import 'package:flutter/material.dart';
import 'models.dart';
import 'world_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PlayMode mode = PlayMode.couple;
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: Padding(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Align(alignment: Alignment.centerLeft, child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: const Color(0xFFEDE7FF), borderRadius: BorderRadius.circular(8)), child: const Text('2D BOND ADVENTURE', style: TextStyle(fontSize: 11, letterSpacing: 1.1, fontWeight: FontWeight.w900, color: Color(0xFF5A3FB0))))),
        const Spacer(),
        const Text('BondQuest', textAlign: TextAlign.center, style: TextStyle(fontSize: 42, height: 1, fontWeight: FontWeight.w900, color: Color(0xFF302B3B))),
        const SizedBox(height: 12),
        const Text('एक world. अनेक challenges.
आणि तुमचं bond आणखी strong.', textAlign: TextAlign.center, style: TextStyle(fontSize: 17, height: 1.45, color: Color(0xFF6F6978))),
        const SizedBox(height: 36),
        Row(children: [Expanded(child: _modeCard(PlayMode.couple, '💜', 'Couple', '2 players')), const SizedBox(width: 12), Expanded(child: _modeCard(PlayMode.family, '🏠', 'Family', '3–8 players'))]),
        const SizedBox(height: 24),
        FilledButton.icon(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => WorldPage(mode: mode))),
          icon: const Icon(Icons.explore_rounded), label: const Text('Enter the world'),
          style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(56), textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
        ),
        const SizedBox(height: 12),
        const Text('Offline • Private • No ads', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Color(0xFF817B89))),
        const Spacer(),
      ]),
    )),
  );

  Widget _modeCard(PlayMode value, String emoji, String title, String sub) {
    final active = mode == value;
    return InkWell(
      onTap: () => setState(() => mode = value), borderRadius: BorderRadius.circular(18),
      child: AnimatedContainer(duration: const Duration(milliseconds: 180), padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(color: active ? const Color(0xFFEDE7FF) : Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: active ? const Color(0xFF7257D3) : const Color(0xFFE3DFE8), width: active ? 2 : 1)),
        child: Column(children: [Text(emoji, style: const TextStyle(fontSize: 34)), const SizedBox(height: 9), Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900)), const SizedBox(height: 2), Text(sub, style: const TextStyle(fontSize: 12, color: Color(0xFF77717E)))]),
      ),
    );
  }
}
