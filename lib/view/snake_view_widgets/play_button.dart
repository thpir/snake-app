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
          Padding(
            padding: EdgeInsets.all(8),
            child: Image.asset(
              'assets/images/snake_title.png',
              width: MediaQuery.of(context).orientation == Orientation.portrait ? double.infinity : null,
              height: MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.height / 4 : null,
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(width: 1, color: Color.fromARGB(255, 136, 255, 0))),
            child: TextButton(
                onPressed: () {
                  snakeController.setGameState();
                  snakeController.startGameLoop();
                  snakeController.resetGame();
                },
                child: const Text(
                    'START NEW GAME',
                  style: TextStyle(color: Color.fromARGB(255, 136, 255, 0)),
                ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Image.asset(
              'assets/images/snake_icon.png',
              width: MediaQuery.of(context).orientation == Orientation.portrait ? double.infinity : null,
              height: MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.height / 6 : null,
            ),
          ),
        ],
      ),
    );
  }
}
