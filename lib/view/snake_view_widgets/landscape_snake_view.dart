import 'package:flutter/material.dart';

import 'game_field.dart';
import 'control_buttons.dart';

class LandscapeSnakeView extends StatelessWidget {
  const LandscapeSnakeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        height: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            GameField(),
            ControlButtons(),
          ]
        ),
      ),
    );
  }
}
