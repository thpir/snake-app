import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../model/snake_model.dart';

class SnakeController extends ChangeNotifier {
  final SnakeModel snakeModel;
  late Timer _timer;
  int _highScore = 0;

  SnakeController(this.snakeModel) {
    snakeModel.highScore().then((value) {
      _highScore = value;
      notifyListeners();
    });
  }

  setGameState() {
    snakeModel.setGameOn();
    notifyListeners();
  }

  setScreenSize(BuildContext context) {
    snakeModel.setScreenSize(
        MediaQuery.of(context).size.height - AppBar().preferredSize.height,
        MediaQuery.of(context).size.width);
  }

  setNewSnakeDirection(Enum newDirection) {
    if (newDirection != snakeModel.forbiddenDirection) {
      //print('New direction allowed');
      snakeModel.setSnakeDirection(newDirection);
      if (newDirection == SnakeDirection.up) {
        snakeModel.setForbiddenSnakeDirection(SnakeDirection.down);
      } else if (newDirection == SnakeDirection.right) {
        snakeModel.setForbiddenSnakeDirection(SnakeDirection.left);
      } else if (newDirection == SnakeDirection.down) {
        snakeModel.setForbiddenSnakeDirection(SnakeDirection.up);
      } else {
        snakeModel.setForbiddenSnakeDirection(SnakeDirection.right);
      }
    } else {
      //print('Forbidden direction!!!');
    }
  }

  double setPlayFieldSize() {
    if (snakeModel.screenHeight != null && snakeModel.screenHeight != null) {
      if (snakeModel.screenHeight! > snakeModel.screenWidth!) {
        // Portrait
        if (snakeModel.screenHeight! / 2 > snakeModel.screenWidth!) {
          return snakeModel.screenWidth! * 0.8;
        }
        return (snakeModel.screenHeight! / 2) * 0.8;
      } else {
        // Landscape
        if (snakeModel.screenWidth! / 2 > snakeModel.screenHeight!) {
          return snakeModel.screenHeight! * 0.8;
        }
        return (snakeModel.screenWidth! / 2) * 0.6;
      }
    } else {
      return 300;
    }
  }

  startGameLoop() {
    const oneSecond = Duration(milliseconds: 500);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      //print('Snake moves...');
      if (snakeModel.food.isEmpty) {
        generateFood();
      }
      //print(snakeModel.highScore.toString());
      checkForFood();
      moveSnake();
      checkForGameOver();
      notifyListeners();
    });
  }

  moveSnake() {
    int growSnake = 1;
    if (snakeModel.digestedFood.isNotEmpty) {
      if (snakeModel.digestedFood[0].x ==
              snakeModel.snake[snakeModel.snake.length - 1].x &&
          snakeModel.digestedFood[0].y ==
              snakeModel.snake[snakeModel.snake.length - 1].y) {
        snakeModel.snake.add(Coordinate(
            snakeModel.digestedFood[0].x, snakeModel.digestedFood[0].y));
        snakeModel.digestedFood = [];
        growSnake = 2;
      }
    }
    for (int i = snakeModel.snake.length - growSnake; i >= 0; i--) {
      if (i > 0) {
        snakeModel.snake[i].x = snakeModel.snake[i - 1].x;
        snakeModel.snake[i].y = snakeModel.snake[i - 1].y;
      }
    }
    if (snakeModel.snakeDirection == SnakeDirection.left) {
      snakeModel.snake[0].x = snakeModel.snake[0].x - 1;
    } else if (snakeModel.snakeDirection == SnakeDirection.up) {
      snakeModel.snake[0].y = snakeModel.snake[0].y - 1;
    } else if (snakeModel.snakeDirection == SnakeDirection.right) {
      snakeModel.snake[0].x = snakeModel.snake[0].x + 1;
    } else {
      snakeModel.snake[0].y = snakeModel.snake[0].y + 1;
    }
  }

  void checkForGameOver() {
    if (snakeModel.snake[0].x < 0 ||
        snakeModel.snake[0].x > 19 ||
        snakeModel.snake[0].y < 0 ||
        snakeModel.snake[0].y > 19) {
      snakeModel.setShowGameOverDialog();
      stopGameLoop();
    }
    for (int i = 0; i < snakeModel.snake.length; i++) {
      //print('Snakepiece $i: ${snakeModel.snake[i].x}, ${snakeModel.snake[i].y}');
    }
    for (int i = 2; i < snakeModel.snake.length; i++) {
      if (snakeModel.snake[0].x == snakeModel.snake[i].x &&
          snakeModel.snake[0].y == snakeModel.snake[i].y) {
        snakeModel.setShowGameOverDialog();
        stopGameLoop();
      }
    }
  }

  resetGame() {
    snakeModel.snake = [
      Coordinate(10, 10),
    ];
    snakeModel.food = [];
    snakeModel.digestedFood = [];
    snakeModel.setCurrentScore(0);
    setNewSnakeDirection(SnakeDirection.up);
  }

  stopGameLoop() {
    _timer.cancel();
  }

  generateFood() {
    Random random = Random();
    Coordinate newFood = Coordinate(random.nextInt(20), random.nextInt(20));
    for (int i = 0; i < snakeModel.snake.length; i++) {
      if (snakeModel.snake[i].x == newFood.x &&
          snakeModel.snake[i].y == newFood.y) {
        generateFood();
      }
    }
    snakeModel.food = [newFood];
  }

  checkForFood() {
    if (snakeModel.food.isNotEmpty) {
      if (snakeModel.snake[0].x == snakeModel.food[0].x &&
          snakeModel.snake[0].y == snakeModel.food[0].y) {
        snakeModel.digestedFood = [
          Coordinate(snakeModel.food[0].x, snakeModel.food[0].y)
        ];
        snakeModel.food = [];
        snakeModel.setCurrentScore(snakeModel.currentScore + 1);
        if (snakeModel.currentScore > _highScore) {
          setNewHighscore(snakeModel.currentScore);
        }
      }
    }
  }

  int get highScore => _highScore;

  setNewHighscore(int newHighScore) {
    _highScore = newHighScore;
    snakeModel.setHighScore(newHighScore);
    notifyListeners();
  }
}
