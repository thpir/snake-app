import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/snake_controller.dart';

class GameField extends StatefulWidget {
  const GameField({super.key});

  @override
  State<GameField> createState() => _GameFieldState();
}

class _GameFieldState extends State<GameField> {
  @override
  Widget build(BuildContext context) {
    final snakeController = Provider.of<SnakeController>(context);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, style: BorderStyle.solid, color: Colors.deepPurple)),
      child: SizedBox(
        height: snakeController.setPlayFieldSize(),
        width: snakeController.setPlayFieldSize(),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 50,
            ),
            itemCount: snakeController.snakeModel.playField.length,
            itemBuilder: (context, index) {
              bool snakeOnGrid = false;
              bool foodOnGrid = false;
              if (snakeController.snakeModel.food.isNotEmpty) {
                if (snakeController.snakeModel.playField[index].x ==
                        snakeController.snakeModel.food[0].x &&
                    snakeController.snakeModel.playField[index].y ==
                        snakeController.snakeModel.food[0].y) {
                  foodOnGrid = true;
                }
              }
              for (int i = 0;
                  i < snakeController.snakeModel.snake.length;
                  i++) {
                if (snakeController.snakeModel.snake[i].x ==
                        snakeController.snakeModel.playField[index].x &&
                    snakeController.snakeModel.snake[i].y ==
                        snakeController.snakeModel.playField[index].y) {
                  snakeOnGrid = true;
                  //print('SNAKE!!!! AAAARRRRGGGGHHHH....');
                }
              }
              return Container(
                color: snakeOnGrid 
                  ? Colors.deepPurple 
                  : foodOnGrid ? Colors.red : Colors.deepPurple[50],
              );
            }),
      ),
    );
  }
}
