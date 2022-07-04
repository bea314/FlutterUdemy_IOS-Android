import 'package:flutter/material.dart';
import 'package:fl_components/models/models.dart';
import 'package:fl_components/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    //MenuOption(route: 'Home', name: 'Home', screen: const HomeScreen(), icon: Icons.home_filled,),
    MenuOption(route: 'ListView1', name: 'ListView Tipo 1', screen: const Listview1Screen(), icon: Icons.list_alt_sharp,),
    MenuOption(route: 'ListView2', name: 'ListView Tipo 2', screen: const Listview2Screen(), icon: Icons.list_alt_sharp,),
    MenuOption(route: 'alert', name: 'Alertas - Alerts', screen: const AlertScreen(), icon: Icons.notifications_sharp),
    MenuOption(route: 'card', name: 'Tarjetas - Cards', screen: const CardScreen(), icon: Icons.category_outlined),
    MenuOption(route: 'avatar', name: 'Circle Avatar', screen: const AvatarScreen(), icon: Icons.person),
    MenuOption(route: 'animated', name: 'Animation', screen: const AnimatedScreen(), icon: Icons.animation),
    MenuOption(route: 'inputs', name: 'Text Input', screen: const InputsScreen(), icon: Icons.info_outline_rounded),
    MenuOption(route: 'slider', name: 'Slider & Checks', screen: const SliderScreen(), icon: Icons.photo_size_select_small),
    MenuOption(route: 'listviewbuilder', name: 'InfiniteScroll & Pull', screen: const ListViewVuilderScreen(), icon: Icons.build_circle_outlined),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({ 'home' : (BuildContext context) => const HomeScreen()});

    for ( final option in menuOptions ) {
      appRoutes.addAll({ option.route : (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //       'Home'      : ( BuildContext context ) => const HomeScreen(),
  //       'ListView1' : ( BuildContext context ) => const Listview1Screen(),
  //       'ListView2' : ( BuildContext context ) => const Listview2Screen(),
  //       'alert'     : ( BuildContext context ) => const AlertScreen(),
  //       'card'      : ( BuildContext context ) => const CardScreen(),
  // };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const Listview1Screen(),);
  }  

}

