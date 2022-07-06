import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  ProductCard({Key? key}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      width: double.infinity,
      height: 400,
      decoration: _cardBorders(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: const [
          _BackgroundImage(),
          _ProductDetails(),
          Positioned( top:0, right:0, child: _PriceTag() ),
          Positioned( top:0, left:0, child: _NotAvailable() ),
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
    Key? key,
  }) : super(key: key);

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
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Text(
          'No disponible',
          style: TextStyle( fontSize: 20, color: Colors.white, ),
        ),
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  const _PriceTag({
    Key? key,
  }) : super(key: key);

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
      child: const FittedBox(fit: BoxFit.contain, child: Text('\$103.99', style: TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold ),)),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({
    Key? key,
  }) : super(key: key);

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
        children: const [
          Text(
            'Disco Duro G', 
            style: TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'Id del disco duro', 
            style: TextStyle( fontSize: 15, color: Colors.white, fontWeight: FontWeight.w300 ),
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: const FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}