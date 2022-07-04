import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
   
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double _width = 50;
  double _heigth = 50;
  Color _color = Colors.indigo;
  BorderRadius _border = BorderRadius.circular(15);

  void onChangeShape() {
    _width = math.Random().nextInt(200).toDouble() + 50;
    _heigth = math.Random().nextInt(200).toDouble() + 50;
    //_color = Colors.black;
    _color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    _border = BorderRadius.circular(math.Random().nextInt(100).toDouble());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ANIMATION CONTAINER')),
      body: Center(
         child: AnimatedContainer(
           duration: const Duration(milliseconds: 400),
           curve: Curves.easeOutCubic,
           width: _width,
           height: _heigth,
           decoration: BoxDecoration(
             color: _color,
             borderRadius: _border,
           ),
         ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_circle_outline_sharp),
        onPressed: () => onChangeShape()),
    );
  }
}