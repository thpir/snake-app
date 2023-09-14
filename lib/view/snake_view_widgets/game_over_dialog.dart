import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/snake_controller.dart';

class GameOverDialog extends StatelessWidget {
  const GameOverDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final snakeController = Provider.of<SnakeController>(context);

    return AlertDialog(
      content: const SizedBox(
        width: double.infinity,
        child: Text('GAME OVER!', textAlign: TextAlign.center, style: TextStyle(fontSize: 26, color: Colors.deepPurple),)
      ),
      actions: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.deepPurple)),
          child: TextButton(
            onPressed: () {
              snakeController.snakeModel.setShowGameOverDialog();
              snakeController.setGameState();
              snakeController.resetGame();
            },
            child: const Text(
              'EXIT',
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.deepPurple)),
          child: TextButton(
            onPressed: () {
              snakeController.snakeModel.setShowGameOverDialog();
              snakeController.startGameLoop();
              snakeController.resetGame();
            },
            child: const Text(
              'RETRY',
            ),
          ),
        ),
      ],
    );
  }
}
