import 'package:flutter/material.dart';

import 'package:disenos/src/screens/basic_design.dart';
import 'package:disenos/src/screens/scroll_design.dart';
import 'package:disenos/src/screens/home_screen.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design',
      initialRoute: 'home_screen',
      theme: ThemeData.dark(),
      routes: {
        'basic_design'  : ( _ ) => const BasicDesignScreen(),
        'scroll_screen' : ( _ ) => ScrollScreen(),
        'home_screen'   : ( _ ) => const HomeScreen(),
      },
    );
  }
}