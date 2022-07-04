import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/home_page.dart';
import 'package:qr_reader/pages/mapa_page.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Colors.deepOrange;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => UiProvider() ),
        ChangeNotifierProvider( create: (_) => ScanListProvider() ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'mapa': (_) => MapaPage(),
        },
        theme: ThemeData(
    
          primaryColor: primaryColor,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: primaryColor,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: primaryColor,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: primaryColor,
          ),
          iconTheme: const IconThemeData(
            color: primaryColor,
          ),
          listTileTheme: const ListTileThemeData(
            iconColor: primaryColor,
          )
        ),
      ),
    );
  }
}