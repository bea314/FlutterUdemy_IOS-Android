import 'package:flutter/material.dart';

import 'package:test_rutas/models/models.dart';
import 'package:test_rutas/screens/screens.dart';


class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    // MenuOption(route: 'home', name: 'Inicio', screen: const HomeScreen(), icon:  Icons.square),
    MenuOption(route: 'screen1', name: 'PAGINA 1', screen: const ONEScreen(), icon:  Icons.square),
    MenuOption(route: 'screen2', name: 'PAGINA 2', screen: const TWOScreen(), icon:  Icons.square),
    MenuOption(route: 'screen3', name: 'PAGINA 3', screen: const THREEScreen(), icon:  Icons.square),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for ( final option in menuOptions ) {
        appRoutes.addAll({ option.route : (BuildContext context) => option.screen});
      }
      return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
      return MaterialPageRoute(builder: (context) => const HomeScreen(),);
    } 
}