import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/snake_controller.dart';

class GameOverDialog extends StatelessWidget {
  const GameOverDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final snakeController = Provider.of<SnakeController>(context);

    return AlertDialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color.fromARGB(255, 136, 255, 0))),
      content: const SizedBox(
        width: double.infinity,
        child: Text('GAME OVER!', textAlign: TextAlign.center, style: TextStyle(fontSize: 26, color: Color.fromARGB(255, 136, 255, 0)),)
      ),
      actions: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all(width: 1, color: Color.fromARGB(255, 136, 255, 0))),
          child: TextButton(
            onPressed: () {
              snakeController.snakeModel.setShowGameOverDialog();
              snakeController.setGameState();
              snakeController.resetGame();
            },
            child: const Text(
              'EXIT', style: TextStyle(color: Color.fromARGB(255, 136, 255, 0))
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all(width: 1, color: Color.fromARGB(255, 136, 255, 0))),
          child: TextButton(
            onPressed: () {
              snakeController.snakeModel.setShowGameOverDialog();
              snakeController.startGameLoop();
              snakeController.resetGame();
            },
            child: const Text(
              'RETRY', style: TextStyle(color: Color.fromARGB(255, 136, 255, 0))
            ),
          ),
        ),
      ],
    );
  }
}
