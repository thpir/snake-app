import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/snake_controller.dart';
import 'model/snake_model.dart';
import 'view/snake_view.dart';

void main() {
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final snakeModel = SnakeModel();
    return MaterialApp(
      title: 'Snake',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        fontFamily: 'pixeloid',
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => SnakeController(snakeModel),
        child: const SnakeView(),
      ),
    );
  }
}
