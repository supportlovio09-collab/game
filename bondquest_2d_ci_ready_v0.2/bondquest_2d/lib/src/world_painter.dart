import 'package:flutter/material.dart';

class WorldPainter extends CustomPainter {
  const WorldPainter({required this.player, required this.completed});
  final Offset player;
  final Set<String> completed;
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    canvas.drawRect(rect, Paint()..shader = const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFFDDF3FF), Color(0xFFF4EFFF)]).createShader(rect));
    final path = Path()..moveTo(size.width*.12,size.height*.86)..cubicTo(size.width*.18,size.height*.63,size.width*.42,size.height*.65,size.width*.52,size.height*.44)..cubicTo(size.width*.62,size.height*.25,size.width*.73,size.height*.34,size.width*.80,size.height*.20);
    canvas.drawPath(path, Paint()..color=const Color(0xFFFFFFFF)..style=PaintingStyle.stroke..strokeWidth=34..strokeCap=StrokeCap.round);
    canvas.drawPath(path, Paint()..color=const Color(0xFFD3C8E8)..style=PaintingStyle.stroke..strokeWidth=3..strokeCap=StrokeCap.round);
    final grass=Paint()..color=const Color(0xFFBDE3C8);
    for (final p in const [Offset(.10,.18),Offset(.26,.30),Offset(.34,.78),Offset(.65,.70),Offset(.88,.50)]) {
      canvas.drawCircle(Offset(size.width*p.dx,size.height*p.dy), 26, grass);
      canvas.drawCircle(Offset(size.width*p.dx+22,size.height*p.dy+7), 20, grass);
    }
    final px=Offset(size.width*player.dx,size.height*player.dy);
    canvas.drawCircle(px, 13, Paint()..color=const Color(0xFF7257D3));
    canvas.drawCircle(px, 17, Paint()..color=Colors.white..style=PaintingStyle.stroke..strokeWidth=4);
  }
  @override bool shouldRepaint(WorldPainter old) => old.player != player || old.completed.length != completed.length;
}
