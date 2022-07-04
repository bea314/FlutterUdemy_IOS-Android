import 'dart:math';

import 'package:flutter/material.dart';

class BackgroundHome extends StatelessWidget {
  const BackgroundHome({Key? key}) : super(key: key);
  final boxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(0xff2E305F),Color(0xff202333)],
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
      stops: [0.2, 0.8],
    )
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Purple Gradient
        Container( decoration: boxDecoration, ),
        // Pink Box
        const Positioned(
          top: -80,
          left: -30,
          child: PinkBox()
        ),
      ],
    );
  }
}

class PinkBox extends StatelessWidget {
  const PinkBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 3.0,
      child: Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(241, 142, 172, 1),
            ]
          )
        ),
      ),
    );
  }
}