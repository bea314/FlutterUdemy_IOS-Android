import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';

class CheckAuthScreen extends StatelessWidget {

  static const String routerName = 'checkAuth';

  const CheckAuthScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
         child: FutureBuilder(
           future: authService.readToken(),
           builder: (BuildContext context, AsyncSnapshot snapshot) {
            if ( !snapshot.hasData ) {return const Center(child: CircularProgressIndicator( color: Colors.indigo, ));}
            if ( snapshot.data == '' ) {
              Future.microtask(() {
                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: (_,__,___) => const LoginScreen(),
                  transitionDuration: const Duration( seconds: 0 )
                ));
              });
            } else {
              Future.microtask(() {
                Navigator.pushReplacement(context, PageRouteBuilder(
                  pageBuilder: (_,__,___) => const HomeScreen(),
                  transitionDuration: const Duration( seconds: 0 )
                ));
              });

            }
            
            return Container();
           },
         ),
      ),
    );
  }
}