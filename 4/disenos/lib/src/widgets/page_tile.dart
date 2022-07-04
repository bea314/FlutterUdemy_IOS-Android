import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.only( left: 20, right: 80, ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Classify transaction', style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1 ),),
            SizedBox( height: 10, ),
            Text('Classify this transaction into a particular category', style: TextStyle( fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white ),)
          ],
        ),
      ),
    );
  }
}