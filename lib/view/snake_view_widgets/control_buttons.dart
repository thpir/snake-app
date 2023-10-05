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
      width: 328,
      height: 328,
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
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(border: Border.all(width: 1, color: Color.fromARGB(255, 136, 255, 0))),
                  child: IconButton(
                    onPressed: () {
                      Enum newDirection = SnakeDirection.up;
                      snakeController.setNewSnakeDirection(newDirection);
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_up,
                      color: Color.fromARGB(255, 136, 255, 0),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(border: Border.all(width: 1, color: Color.fromARGB(255, 136, 255, 0))),
                  child: IconButton(
                    onPressed: () {
                      Enum newDirection = SnakeDirection.left;
                      snakeController.setNewSnakeDirection(newDirection);
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Color.fromARGB(255, 136, 255, 0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(border: Border.all(width: 1, color: Color.fromARGB(255, 136, 255, 0))),
                  child: IconButton(
                    onPressed: () {
                      Enum newDirection = SnakeDirection.right;
                      snakeController.setNewSnakeDirection(newDirection);
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: Color.fromARGB(255, 136, 255, 0),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(border: Border.all(width: 1, color: Color.fromARGB(255, 136, 255, 0))),
                  child: IconButton(
                    onPressed: () {
                      Enum newDirection = SnakeDirection.down;
                      snakeController.setNewSnakeDirection(newDirection);
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Color.fromARGB(255, 136, 255, 0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
