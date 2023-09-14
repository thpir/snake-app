import 'package:shared_preferences/shared_preferences.dart';

enum SnakeDirection {
  left,
  right,
  up,
  down,
}

class Coordinate {
  int x;
  int y;

  Coordinate(this.x, this.y);
}

class SnakeModel {
  static const savedScore = 'savedScore';
  bool _gameOn = false;
  bool _showGameOverDialog = false;
  double? _screenHeight;
  double? _screenWidth;
  int _currentScore = 0;
  Enum _snakeDirection = SnakeDirection.up;
  Enum _forbiddenDirection = SnakeDirection.down;
  List<Coordinate> playField = [];
  List<Coordinate> snake = [
    Coordinate(24, 24),
  ];
  List<Coordinate> food = [];
  List<Coordinate> digestedFood = [];

  SnakeModel() {
    for (int y = 0; y < 50; y++) {
      for (int x = 0; x < 50; x++) {
        playField.add(Coordinate(x, y));
      }
    }
  }

  setScreenSize(double screenHeight, double screenWidth) {
    _screenHeight = screenHeight;
    _screenWidth = screenWidth;
  }

  double? get screenHeight => _screenHeight;
  double? get screenWidth => _screenWidth;

  setShowGameOverDialog() {
    _showGameOverDialog = !_showGameOverDialog;
  }

  bool get showGameOverDialog => _showGameOverDialog;

  setGameOn() {
    _gameOn = !_gameOn;
  }

  bool get gameOn => _gameOn;

  setCurrentScore(int newScore) {
    _currentScore = newScore;
  }

  int get currentScore => _currentScore;

  setHighScore(int newHighScore) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt(savedScore, newHighScore);
  }

  Future<int> highScore() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(savedScore) ?? 0;
  }

  setSnakeDirection(Enum newDirection) {
    _snakeDirection = newDirection;
  }

  Enum get snakeDirection => _snakeDirection;

  setForbiddenSnakeDirection(Enum newForbiddenDirection) {
    _forbiddenDirection = newForbiddenDirection;
  }

  Enum get forbiddenDirection => _forbiddenDirection;
}
