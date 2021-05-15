import 'package:flutter/material.dart';
import 'package:newsapp/presentation/scenes/main_screen/main_screen.dart';

class App extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsApp',
      home: Builder(builder: (context) => MainScreen()),
    );
  }
}