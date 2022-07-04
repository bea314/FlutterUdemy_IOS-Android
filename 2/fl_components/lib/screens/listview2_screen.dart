import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
   
  final options = const['Smash', 'Zelda', 'Metal Gear', 'Genshin Impact'];
  
  const Listview2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListviewScreen tipo 2'),),
      body: ListView.separated(
        itemCount: options.length + 1,
        separatorBuilder: (BuildContext context, int index) => ListTile( 
            title: Text(options[index]),
            trailing: const Icon(Icons.arrow_forward_ios_sharp, color: Colors.indigo,),
            onTap: () {print(options[index]);},),
        itemBuilder: (BuildContext _, int __) => const Divider(),
        
      ),
    );
  }
}