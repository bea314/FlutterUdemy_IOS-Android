import 'package:flutter/material.dart';

class CustomCard2 extends StatelessWidget {

  final String imageUrl;
  final String? cardName;

  const CustomCard2({Key? key, required this.imageUrl, this.cardName}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      elevation: 10,
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(imageUrl),
            placeholder: const AssetImage('assets/jar-loading.gif'),
            width: double.infinity,
            height: 260,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
            ),

          if (cardName != null)
            Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: const EdgeInsets.only(right: 20, top: 10, bottom:10),
              child: Text(cardName ?? 'No Title'),
            )
        ],
      ),
    );
  }
}