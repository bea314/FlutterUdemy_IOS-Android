import 'package:flutter/material.dart';
import 'package:test_rutas/router/app_router.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('INICIO'),
      ),
      body: Center(
         child: ListView.separated(
           itemCount: AppRoutes.menuOptions.length,
           separatorBuilder: ( _ , __ ) => const Divider(),
           itemBuilder: (BuildContext context, int index) {
             return ListTile(
               leading: Icon(AppRoutes.menuOptions[index].icon,),
               title: Text(AppRoutes.menuOptions[index].name),
               onTap: () {Navigator.pushNamed(context, AppRoutes.menuOptions[index].route );}
    );
  },)
      ),
    );
  }
}