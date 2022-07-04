import 'package:flutter/material.dart';

import 'package:fl_components/widgets/widgets.dart';


class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card Widget'),),
      body: ListView(

        padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10),

        children: const [

          CustomCard1(),
          SizedBox(height: 10,),
          CustomCard2(imageUrl: 'https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg', 
            cardName: 'Paisaje 1',),
          SizedBox(height: 10,),
          CustomCard2(imageUrl: 'https://img.freepik.com/free-vector/nature-scene-with-river-hills-forest-mountain-landscape-flat-cartoon-style-illustration_1150-37326.jpg', 
            cardName: 'Paisaje 2',),
          SizedBox(height: 10,),
          CustomCard2(imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/8/86/Landscape_mountain.jpg',),
          SizedBox(height: 10,),
          CustomCard2(imageUrl: 'https://www.becomeabetterphotographer.co.uk/wp-content/uploads/2014/05/landscape-focusing2.jpg', 
            cardName: 'Paisaje 4',),
          SizedBox(height: 100,),
        ],
      )
    );
  }
}

