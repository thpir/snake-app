import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/snake_view_widgets/game_over_dialog.dart';
import '../controller/snake_controller.dart';
import 'snake_view_widgets/portrait_snake_view.dart';
import 'snake_view_widgets/landscape_snake_view.dart';
import 'snake_view_widgets/play_button.dart';

class SnakeView extends StatefulWidget {
  const SnakeView({super.key});

  @override
  State<SnakeView> createState() => _SnakeViewState();
}

class _SnakeViewState extends State<SnakeView> {
  Future<void> showGamePauzedDialog() async {
    final snakeController =
        Provider.of<SnakeController>(context, listen: false);
    return showDialog<void>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Color.fromARGB(255, 136, 255, 0))),
            content: const SizedBox(
                width: double.infinity,
                child: Text(
                  'GAME PAUSED',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, color: Color.fromARGB(255, 136, 255, 0)),
                )),
            actions: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color.fromARGB(255, 136, 255, 0))),
                child: TextButton(
                  onPressed: () {
                    snakeController.setGameState();
                    snakeController.resetGame();
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'EXIT', style: TextStyle(color: Color.fromARGB(255, 136, 255, 0))
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color.fromARGB(255, 136, 255, 0))),
                child: TextButton(
                  onPressed: () {
                    snakeController.startGameLoop();
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'CONTINUE', style: TextStyle(color: Color.fromARGB(255, 136, 255, 0))
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final snakeController = Provider.of<SnakeController>(context);
    snakeController.setScreenSize(context);
    //print(snakeController.snakeModel.highScore());

    return Scaffold(
        appBar: snakeController.snakeModel.showGameOverDialog
            ? AppBar(
                backgroundColor: Colors.black,
              )
            : AppBar(
                title: snakeController.snakeModel.gameOn
                    ? Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 136, 255, 0),
                          ),
                          Text(
                            ' ${snakeController.highScore} | ',
                            style: const TextStyle(color: Color.fromARGB(255, 136, 255, 0)),
                          ),
                          const Icon(
                            Icons.sports_score,
                            color: Color.fromARGB(255, 136, 255, 0),
                          ),
                          Text(
                            ' ${snakeController.snakeModel.currentScore.toString()}',
                            style: const TextStyle(color: Color.fromARGB(255, 136, 255, 0)),
                          )
                        ],
                      )
                    : const Text(''),
                backgroundColor: Colors.black,
                actions: snakeController.snakeModel.gameOn
                    ? [
                        TextButton(
                            onPressed: () {
                              snakeController.stopGameLoop();
                              showGamePauzedDialog();
                            },
                            child: const Text(
                              'PAUSE',
                              style: TextStyle(color: Color.fromARGB(255, 136, 255, 0)),
                            ))
                      ]
                    : [],
              ),
        body: snakeController.snakeModel.gameOn
            ? snakeController.snakeModel.showGameOverDialog
                ? Stack(
                    children: [
                      OrientationBuilder(
                        builder: (context, orientation) {
                          if (orientation == Orientation.portrait) {
                            return const PortraitSnakeView();
                          } else {
                            return const LandscapeSnakeView();
                          }
                        },
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: const Color.fromARGB(50, 0, 0, 0),
                      ),
                      const GameOverDialog()
                    ],
                  )
                : OrientationBuilder(
                    builder: (context, orientation) {
                      if (orientation == Orientation.portrait) {
                        return const PortraitSnakeView();
                      } else {
                        return const LandscapeSnakeView();
                      }
                    },
                  )
            : Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black,
                child: const PlayButton(),
              )
    );
  }
}
