import 'package:flutter/material.dart';

enum PlayMode { couple, family }

class WorldZone {
  const WorldZone({required this.id, required this.title, required this.emoji, required this.position, required this.color, required this.game});
  final String id;
  final String title;
  final String emoji;
  final Offset position;
  final Color color;
  final MiniGameType game;
}

enum MiniGameType { heartCatch, memoryMatch, rapidTap }

const zones = <WorldZone>[
  WorldZone(id: 'garden', title: 'Love Garden', emoji: '💜', position: Offset(.20, .72), color: Color(0xFFE6D8FF), game: MiniGameType.heartCatch),
  WorldZone(id: 'forest', title: 'Memory Forest', emoji: '🌳', position: Offset(.52, .44), color: Color(0xFFD8F1DF), game: MiniGameType.memoryMatch),
  WorldZone(id: 'arena', title: 'Challenge Arena', emoji: '⚡', position: Offset(.80, .20), color: Color(0xFFFFE4BF), game: MiniGameType.rapidTap),
];
