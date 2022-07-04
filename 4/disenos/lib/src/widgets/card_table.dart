import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            SingleCard(icon: CupertinoIcons.rectangle_grid_2x2_fill, text: 'General'),
            SingleCard(icon: CupertinoIcons.bus, text: 'Transport', color: Colors.pinkAccent,),
          ]
        ),
        TableRow(
          children: [
            SingleCard(icon: CupertinoIcons.shopping_cart, text: 'Shopping', color: Colors.purple,),
            SingleCard(icon: CupertinoIcons.money_dollar, text: 'Bill', color: Colors.purpleAccent,),
          ]
        ),
        TableRow(
          children: [
            SingleCard(icon: Icons.movie, text: 'Entertainment', color: Colors.deepPurple,),
            SingleCard(icon: Icons.front_hand_outlined, text: 'Grocery', color: Colors.green,),
          ]
        ),
        TableRow(
          children: [
            SingleCard(icon: CupertinoIcons.rectangle_grid_2x2_fill, text: 'General'),
            SingleCard(icon: CupertinoIcons.bus, text: 'Transport', color: Colors.pinkAccent,),
          ]
        ),
      ],
    );
  }
}

class SingleCard extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final String text;

  const SingleCard({Key? key, required this.icon, required this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardBackground( 
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: color??Colors.blue,
            child: Icon( icon, size: 35, color: Colors.white,),
            radius: 30,
          ),
          Text(text, style: TextStyle( color: color??Colors.blue, fontSize: 18 ),)
        ],
      ), 
    );
  }
}

class CardBackground extends StatelessWidget {
  final Widget widget;

  const CardBackground({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur( sigmaX: 5, sigmaY: 5,),
          child: Container(
            height: 180,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(65, 66, 107, 0.7),
            ),
            child: widget,
          ),
        ),
      ),
    );
  }
}