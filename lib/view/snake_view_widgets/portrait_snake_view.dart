import 'package:flutter/material.dart';

import 'game_field.dart';
import 'control_buttons.dart';

class PortraitSnakeView extends StatelessWidget {
  const PortraitSnakeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            GameField(),
            ControlButtons(),
          ],
        ),
      ),
    );
  }
}
