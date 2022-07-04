import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
   
  const BasicDesignScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Imagen
          const Image(image: AssetImage('assets/landscape.jpg'), fit: BoxFit.cover,),
          const SizedBox(height: 20,),
          // Titulo
          Title(),
          const SizedBox(height: 20,),
          // Button Section
          const ButtonSection(),
          const SizedBox(height: 20,),
          // Description
          Container(
            width: queryData.size.width * 0.9,
            child: const Text(
              'Anim Lorem labore reprehenderit ad aute veniam ipsum fugiat fugiat veniam. Mollit et Lorem reprehenderit qui ad magna. Est eu exercitation laborum Lorem quis consectetur eu adipisicing elit adipisicing consequat cillum magna excepteur.',
              textAlign: TextAlign.justify,
            )
          )
        ],
      )
    );
  }
}

class Title extends StatelessWidget {
  final String? title;
  final String? subtitle;
  
  Title({
    Key? key, this.title, this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration( 
        color: Colors.white,
        border: Border.all(color: Colors.black26), 
        borderRadius: const BorderRadius.only( topRight: Radius.circular(40), bottomLeft: Radius.circular(40), ),
        boxShadow: [ BoxShadow( color: Colors.grey.withOpacity(0.5), spreadRadius: 3, blurRadius: 7, offset: const Offset(0, 3), ), ],
      ), 
      child: Row(
        children: [
          SizedBox(
            width: queryData.size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title??'Landscape Germany', style: const TextStyle( fontWeight: FontWeight.bold ),),
                const SizedBox(height: 5,),
                Text(subtitle??'Church, Bavaria, Deutschland, Rivers, Bayern.', style: const TextStyle( color: Colors.black45 ), overflow: TextOverflow.fade, maxLines: 2,),
              ],
            ),
          ),
          Expanded(child: Container()),
          const Icon( Icons.star, color: Colors.red,),
          const Text('41')
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Container(
      width: queryData.size.width * 0.9,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration( 
        color: Colors.white,
        borderRadius: BorderRadius.all( Radius.circular(40), ),
      ), 
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          CustomButton(),
          CustomButton(icon: Icons.send, texto: 'ROUTE',),
          CustomButton(icon: Icons.share, texto: 'SHARE',),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData? icon;
  final String? texto;

  const CustomButton({
    Key? key, this.icon, this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return SizedBox(
      width: queryData.size.width * 0.2,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(icon??Icons.call, size: 30, color: Colors.green),
            const SizedBox(height: 4,),
            Text(texto??"CALL", style: const TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green ), ),
          ],
        ),
      ),
    );
  }
}