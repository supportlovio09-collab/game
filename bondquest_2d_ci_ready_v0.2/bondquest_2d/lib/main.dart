import 'package:flutter/material.dart';

void main() {
  runApp(const BondQuestApp());
}

class BondQuestApp extends StatelessWidget {
  const BondQuestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BondQuest 2D',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ModeSelectionScreen(),
    );
  }
}

class ModeSelectionScreen extends StatelessWidget {
  const ModeSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BondQuest 2D'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select Mode',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GameScreen(mode: 'Couple'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: const Text('Couple Mode', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GameScreen(mode: 'Family'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: const Text('Family Mode', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  final String mode;

  const GameScreen({Key? key, required this.mode}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int score = 0;
  String currentGame = 'menu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.mode} Mode - Score: $score'),
        centerTitle: true,
      ),
      body: currentGame == 'menu'
          ? _buildGameMenu(context)
          : _buildGameView(context),
    );
  }

  Widget _buildGameMenu(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Select Mini-Game',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          _gameButton('Heart Catch', 'heartCatch'),
          const SizedBox(height: 20),
          _gameButton('Memory Match', 'memoryMatch'),
          const SizedBox(height: 20),
          _gameButton('Rapid Tap', 'rapidTap'),
        ],
      ),
    );
  }

  Widget _gameButton(String label, String gameId) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          currentGame = gameId;
        });
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      ),
      child: Text(label, style: const TextStyle(fontSize: 18)),
    );
  }

  Widget _buildGameView(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: _buildGameContent(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    score += 10;
                  });
                },
                child: const Text('Add Points'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentGame = 'menu';
                  });
                },
                child: const Text('Back to Menu'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGameContent() {
    switch (currentGame) {
      case 'heartCatch':
        return const Text('Heart Catch Game', style: TextStyle(fontSize: 24));
      case 'memoryMatch':
        return const Text('Memory Match Game', style: TextStyle(fontSize: 24));
      case 'rapidTap':
        return const Text('Rapid Tap Game', style: TextStyle(fontSize: 24));
      default:
        return const SizedBox.shrink();
    }
  }
}
