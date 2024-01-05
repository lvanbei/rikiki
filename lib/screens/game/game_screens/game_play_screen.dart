import 'package:flutter/material.dart';

import '../game.dart';

class GamePlayScreen extends StatelessWidget {
  final GameLoadedState state;
  const GamePlayScreen({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Play !',
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
