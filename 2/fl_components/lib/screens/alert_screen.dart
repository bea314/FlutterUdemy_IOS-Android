import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
   
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIOS( BuildContext context ) {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context, 
      builder: ( context ) {
        return CupertinoAlertDialog(

          title: const Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Esta es la alerta'),
              SizedBox(height: 20),
              FlutterLogo(size: 70,)
          ]),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar', style: TextStyle(color: Colors.red),)
              ),
              TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK')
              )
          ],

        );
      });
  }

  void displayDialogAndroid(BuildContext context) {

    showDialog(
      barrierDismissible: true,
      context: context, 
      builder: ( context ) {
        return AlertDialog(
          elevation: 5,
          title: const Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Esta es la alerta'),
              SizedBox(height: 20),
              FlutterLogo(size: 70,)
          ]),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar', style: TextStyle(color: Colors.red),)
              ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK')
              )
          ],
        );
      });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //  child: ElevatedButton(onPressed: () => displayDialogAndroid(context), 
         child: ElevatedButton(
          onPressed: () => Platform.isIOS 
            ?displayDialogIOS(context)
            :displayDialogAndroid(context), 
         child: const Padding(
           padding: EdgeInsets.all(15),
           child: Text('MOSTAR ALERTA', style: TextStyle(fontSize: 16),),
         )),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        }),
    );
  }
}