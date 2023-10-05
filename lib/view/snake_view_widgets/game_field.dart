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
              width: 1, style: BorderStyle.solid, color: Color.fromARGB(255, 136, 255, 0))),
      child: SizedBox(
        height: snakeController.setPlayFieldSize(),
        width: snakeController.setPlayFieldSize(),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 20,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2
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
                  ? Color.fromARGB(255, 136, 255, 0)
                  : foodOnGrid ? Colors.red : Color.fromARGB(255, 0, 0, 0),
              );
            }),
      ),
    );
  }
}
