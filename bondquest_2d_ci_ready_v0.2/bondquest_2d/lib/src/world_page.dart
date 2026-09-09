import 'package:flutter/material.dart';
import 'models.dart';
import 'mini_games.dart';
import 'world_painter.dart';

class WorldPage extends StatefulWidget {
  const WorldPage({super.key, required this.mode});
  final PlayMode mode;
  @override State<WorldPage> createState() => _WorldPageState();
}

class _WorldPageState extends State<WorldPage> {
  Offset player = const Offset(.12, .86);
  final Set<String> completed = {};
  int hearts = 0;

  void move(double dx, double dy) => setState(() {
    player = Offset(\n      (player.dx + dx).clamp(.06, .94).toDouble(),\n      (player.dy + dy).clamp(.08, .92).toDouble(),\n    );
  });

  Future<void> openZone(WorldZone zone) async {
    final points = await Navigator.push<int>(context, MaterialPageRoute(builder: (_) => MiniGamePage(zone: zone, mode: widget.mode)));
    if (points != null && mounted) setState(() { completed.add(zone.id); hearts += points; player = zone.position; });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('BondQuest World', style: TextStyle(fontWeight: FontWeight.w900)), actions: [Padding(padding: const EdgeInsets.only(right: 16), child: Center(child: Text('💜 $hearts', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16))))]),
    body: Stack(children: [
      Positioned.fill(child: CustomPaint(painter: WorldPainter(player: player, completed: completed))),
      ...zones.map((z) => Align(alignment: Alignment(z.position.dx * 2 - 1, z.position.dy * 2 - 1), child: Semantics(label: '${z.title} level', button: true, child: InkWell(onTap: () => openZone(z), customBorder: const CircleBorder(), child: Container(width: 82, height: 82, decoration: BoxDecoration(color: z.color, shape: BoxShape.circle, border: Border.all(color: completed.contains(z.id) ? const Color(0xFF43A26C) : Colors.white, width: 4), boxShadow: const [BoxShadow(color: Color(0x22000000), blurRadius: 8, offset: Offset(0, 3))]), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text(completed.contains(z.id) ? '✓' : z.emoji, style: const TextStyle(fontSize: 28)), Text(z.title.split(' ').first, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900))])))))),
      Positioned(left: 16, bottom: 18, child: _controls()),
      Positioned(right: 16, bottom: 22, child: Container(width: 64, height: 64, decoration: BoxDecoration(color: const Color(0xFF7257D3), shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 4), boxShadow: const [BoxShadow(color: Color(0x33000000), blurRadius: 10)]), child: Center(child: Text(widget.mode == PlayMode.couple ? '💑' : '👨‍👩‍👧', style: const TextStyle(fontSize: 28))))),
    ]),
  );

  Widget _controls() => Container(padding: const EdgeInsets.all(6), decoration: BoxDecoration(color: Colors.white.withOpacity(.92), borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0xFFE1DCE8))), child: Column(children: [
    _arrow(Icons.keyboard_arrow_up, () => move(0, -.06)),
    Row(children: [_arrow(Icons.keyboard_arrow_left, () => move(-.06, 0)), const SizedBox(width: 38), _arrow(Icons.keyboard_arrow_right, () => move(.06, 0))]),
    _arrow(Icons.keyboard_arrow_down, () => move(0, .06)),
  ]));
  Widget _arrow(IconData icon, VoidCallback tap) => SizedBox(width: 42, height: 38, child: IconButton(padding: EdgeInsets.zero, onPressed: tap, icon: Icon(icon), color: const Color(0xFF554B65)));
}
