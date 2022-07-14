import 'package:flutter/material.dart';
import 'package:productos_app/screens/check_auth_screen.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => ProductsService(), ),
        ChangeNotifierProvider( create: (_) => AuthService(), )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: CheckAuthScreen.routerName,
      routes: {
        CheckAuthScreen.routerName  : ( _ ) => const CheckAuthScreen(),

        HomeScreen.routerName       : ( _ ) => const HomeScreen(),
        ProductScreen.routerName    : ( _ ) => const ProductScreen(),

        LoginScreen.routerName      : ( _ ) => const LoginScreen(),
        RegisterScreen.routerName   : ( _ ) => const RegisterScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.indigo,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 0,
          backgroundColor: Colors.indigo,
        )
      ),
    );
  }
}