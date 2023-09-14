import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/snake_controller.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    final snakeController = Provider.of<SnakeController>(context);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/snake_title.png', width: 200,),
          Container(
            decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.deepPurple)),
            child: TextButton(
                onPressed: () {
                  snakeController.setGameState();
                  snakeController.startGameLoop();
                  snakeController.resetGame();
                },
                child: const Text('START NEW GAME')),
          ),
          Image.asset('assets/images/snake_icon.png', width: 200,)
        ],
      ),
    );
  }
}
