import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/models/scan_model.dart';

import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

import 'package:qr_reader/pages/pages.dart';
import 'package:qr_reader/widgets/widgets.dart';

class HomePage extends StatelessWidget {
   
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: [
          IconButton(
            onPressed: () async { Provider.of<ScanListProvider>(context, listen: false).borrarTodo(); }, 
            icon: const Icon(Icons.delete_forever)
          )
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    // TODO TEMPORAL LEER DB
    final tempScan = ScanModel(valor: 'https://wwww.google.com');
    // DBProvider.db.nuevoScan(tempScan); // Crear nueva entrada
    // DBProvider.db.getScanById(2).then((scan) => print(scan?.valor)); // Obtener Scan por ID
    // DBProvider.db.getTodosLosScans().then((scan) {
    //   if(scan!.isNotEmpty) { for(var s in scan) {print(s.id);} }
    //   else { print('No listas'); }
    // });
    // DBProvider.db.deleteAllScans().then(print);
    // DBProvider.db.getTodosLosScans().then((scan) {
    //   if(scan!.isNotEmpty) { for(var s in scan) {print(s.valor);} }
    //   else { print('No listas'); }
    // });
    // DBProvider.db.deleteScan(3).then(print); // Eliminar por ID

    // Usar el ScanListProvider
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    switch( currentIndex ) {
      case 0: 
        scanListProvider.cargarScanPorTipo('geo');
        return const MapasPage();
      case 1: 
        scanListProvider.cargarScanPorTipo('http');
        return const DireccionesPage();
      default: return const MapasPage();
    }
  }
}