import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key
    , this.url
  }) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only( left:10, right: 10, top: 10 ),
      decoration: _buildBoxDecoration(),
      width: double.infinity,
      height: 450,
      child: Opacity(
        opacity: 0.95,
        child: ClipRRect(
          borderRadius: const BorderRadius.only( topLeft: Radius.circular(45), topRight: Radius.circular(45) ),
          child: (url == null || url == '')
            ? const Image(image: AssetImage('assets/no-image.png'), fit: BoxFit.cover,)
            : FadeInImage(
              placeholder: const AssetImage('assets/jar-loading.gif'), 
              image: NetworkImage(url!),
              fit: BoxFit.cover,
            ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Colors.black,
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