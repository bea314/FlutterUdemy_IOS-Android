import 'package:flutter/material.dart';

class AppTheme {

  static const Color primary = Colors.indigo;
  static const Color secondary = Colors.orange;

  static final ThemeData lightTheme = ThemeData.light().copyWith(

        // Color primario
        primaryColor: primary,

        // AppBar Theme
        appBarTheme: const AppBarTheme(
          color: primary,
          elevation: 0,
          centerTitle: true
        ),

        // TextButton Theme
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: primary),
        ),

        // Card Theme
        cardTheme: CardTheme(shadowColor: primary.withOpacity(0.5) ),

        // FloatingActionButton Them
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary,
          elevation: 5),

        // ElevatedButton Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: primary,
            shape: const StadiumBorder(),
            elevation: 0,
          ),
        ),

        // AlertDialog Theme
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),),

        // InputDecoration Theme
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle( color: primary ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide( color: primary ),
            borderRadius: BorderRadius.only( bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
          )
        )
        
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(

        // Color primario
        primaryColor: secondary,

        // AppBar Theme
        appBarTheme: const AppBarTheme(
          color: secondary,
          elevation: 0,
          centerTitle: true
        ),

        // Color fondo
        scaffoldBackgroundColor: Colors.black,


  );


}