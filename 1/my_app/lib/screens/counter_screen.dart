import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => CounterScreenState();
}

class CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    const TextStyle fontSize30 = TextStyle( fontSize: 30 );

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Counter Screen')),
        elevation: 0,
      ),
      backgroundColor: Colors.deepOrange[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Numero de Clicks', style: fontSize30, ),
            Text('$counter', style: fontSize30, ),
          ]
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActions(
        increaseFn: increase,
        decreaseFn: decrease,
        resetFn: reset,
      ),
    );
  }

}

class CustomFloatingActions extends StatelessWidget {

  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  const CustomFloatingActions({
    Key? key,
    required this.increaseFn,
    required this.decreaseFn,
    required this.resetFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          splashColor: Colors.purple,
          child: const Icon( Icons.exposure_minus_1),
          onPressed: () => decreaseFn()
          ),

        FloatingActionButton(
          splashColor: Colors.purple,
          child: Icon( Icons.recycling ),
          onPressed: () => resetFn()
        ),

        FloatingActionButton(
          splashColor: Colors.purple,
          child: Icon( Icons.plus_one ),
          onPressed: () => increaseFn()
        ),
      ],
    );
  }
}