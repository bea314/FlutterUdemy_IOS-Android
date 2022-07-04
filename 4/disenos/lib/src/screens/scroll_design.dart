import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
   
  ScrollScreen({Key? key}) : super(key: key);
  
  final boxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.5,0.5],
      colors: [Color(0xff5EE8C5), Color(0xff30BAD6)]
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff30BAD6),
      body: Container(
        decoration: boxDecoration,
        child: PageView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: const [
            Page1(),
            Page2(),
          ],
        ),
      )
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        // Background Image
        Background(),
        // Main Content
        MainContent()
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle( fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white, );
    return SafeArea(
      bottom: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Spacer(flex: 1),
              Text('11°', style: textStyle,),
              Text('Miércoles', style: textStyle,),
              Spacer(flex: 4),
              Icon(Icons.keyboard_arrow_down, size: 100, color: Colors.white,),
            ],
          ),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: const Image(image: AssetImage('assets/scroll-1.png'),)
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white, );
    return Container(
      color: const Color(0xff30BAD6),
      child: Center(
        child: 
        TextButton(onPressed: (){}, child: const Text('Bienvenido', style: textStyle,),
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xff0098FA),
            shape: const StadiumBorder(),
            padding: const EdgeInsets.all(30),
          ),
        )
      ),
    );
  }
}