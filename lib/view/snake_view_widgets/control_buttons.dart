import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/snake_controller.dart';
import '../../model/snake_model.dart';

class ControlButtons extends StatelessWidget {
  const ControlButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final snakeController = Provider.of<SnakeController>(context);
    return SizedBox(
      width: 200,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.deepPurple,
                onPressed: () {
                  Enum newDirection = SnakeDirection.up;
                  snakeController.setNewSnakeDirection(newDirection);
                },
                child: Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.deepPurple[100],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.deepPurple,
                onPressed: () {
                  Enum newDirection = SnakeDirection.left;
                  snakeController.setNewSnakeDirection(newDirection);
                },
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.deepPurple[100],
                ),
              ),
              FloatingActionButton(
                backgroundColor: Colors.deepPurple,
                onPressed: () {
                  Enum newDirection = SnakeDirection.right;
                  snakeController.setNewSnakeDirection(newDirection);
                },
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.deepPurple[100],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.deepPurple,
                onPressed: () {
                  Enum newDirection = SnakeDirection.down;
                  snakeController.setNewSnakeDirection(newDirection);
                },
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.deepPurple[100],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
