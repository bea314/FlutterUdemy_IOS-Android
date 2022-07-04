import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const TextStyle fontSize30 = TextStyle( fontSize: 30 );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Scree'),
        elevation: 0,
      ),
      backgroundColor: Colors.amberAccent,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Numero de Clicks', style: fontSize30, ),
            Text('10', style: fontSize30, ),
          ]
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.purple,
        child: const Icon( Icons.plus_one ),
        onPressed: () { 
 
         },
      ),
    );
  }

}