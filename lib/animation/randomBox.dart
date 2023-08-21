import 'dart:math';

import 'package:flutter/material.dart';

class RandomBox extends StatefulWidget {
  const RandomBox({super.key});

  @override
  State<RandomBox> createState() => _StateBox();
}

class _StateBox extends State<RandomBox> {
  double _widthBox = 50;
  double _heigthBox = 5;
  double _borderRadius = 10;
  Color colorBox = Colors.green;

  void onRandomBox() {
    setState(() {
      final random = Random();
      _widthBox = random.nextInt(300).toDouble();
      _heigthBox = random.nextInt(300).toDouble();
      _borderRadius = random.nextInt(100).toDouble();
      colorBox = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Randdom box animation',
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: onRandomBox, child: const Icon(Icons.access_alarm)),
          appBar: AppBar(
            title: const Text('Random box animation'),
          ),
          body: Center(
              child: AnimatedContainer(
            width: _widthBox,
            height: _heigthBox,
            duration: const Duration(seconds: 1),
            decoration: BoxDecoration(
                color: colorBox,
                borderRadius: BorderRadius.circular(_borderRadius)),
            curve: Curves.ease,
          )),
        ));
  }
}
