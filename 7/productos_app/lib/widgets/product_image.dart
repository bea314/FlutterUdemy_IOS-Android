import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only( left:10, right: 10, top: 10 ),
      decoration: _buildBoxDecoration(),
      width: double.infinity,
      height: 450,
      child: const ClipRRect(
        borderRadius: BorderRadius.only( topLeft: Radius.circular(45), topRight: Radius.circular(45) ),
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image: NetworkImage('https://via.placeholder.com/400x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.only( topLeft: Radius.circular(45), topRight: Radius.circular(45) ),
    boxShadow: [
      BoxShadow(
        color: Colors.black45,
        blurRadius: 10,
        offset: Offset(0,5)
      )
    ]
  );
}