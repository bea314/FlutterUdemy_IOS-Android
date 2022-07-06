import 'package:flutter/material.dart';

import 'package:productos_app/models/models.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.products}) : super(key: key);

  final Product products;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      width: double.infinity,
      height: 400,
      decoration: _cardBorders(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          _BackgroundImage( url: products.picture, ),
          _ProductDetails(name: products.name, id: products.id!,),
          Positioned( top:0, right:0, child: _PriceTag(price: products.price,) ),
          if(!products.available)Positioned( top:0, left:0, child: _NotAvailable(isAvailable: products.available,) ),
        ],
      ),
    );
  }

  BoxDecoration _cardBorders() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(0,5),
          blurRadius: 10
        ) 
      ]
    );
  }
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({
    Key? key, required this.isAvailable,
  }) : super(key: key);
  
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 70,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.yellow[800],
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25),)
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          (isAvailable) ?'Disponible' :'No disponible' ,
          style: const TextStyle( fontSize: 20, color: Colors.white, ),
        ),
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  const _PriceTag({
    Key? key, required this.price,
  }) : super(key: key);

  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 70,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(topRight: Radius.circular(25), bottomLeft: Radius.circular(25),)
      ),
      child: FittedBox(fit: BoxFit.contain, child: Text('\$$price', style: const TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold ),)),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({
    Key? key, required this.name, required this.id,
  }) : super(key: key);

  final String name;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 80),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 70,
      decoration: _builBoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name, 
            style: const TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            id, 
            style: const TextStyle( fontSize: 15, color: Colors.white, fontWeight: FontWeight.w300 ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  BoxDecoration _builBoxDecoration() {
    return const BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topRight: Radius.circular(25),)
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    Key? key, this.url,
  }) : super(key: key);

  final String? url;
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: (url == null) 
        ? const Image(image: AssetImage('assets/no-image.png'), fit: BoxFit.cover,)
        : FadeInImage(
          placeholder: const AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(url!,),
          fit: BoxFit.cover,
          imageErrorBuilder: (_,__,error) => Image.asset('assets/no-image.png', fit: BoxFit.cover,),
        ),
      ),
    );
  }
}