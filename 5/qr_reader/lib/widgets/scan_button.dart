import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async{
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode( '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        String barcodeScanRes   = 'https://fernando-herrera.com';
        String barcodeScanRes2   = 'geo:13.701247,-89.223616';
        final scanListProvider  = Provider.of<ScanListProvider>(context, listen: false);
        scanListProvider.nuevoScan(barcodeScanRes);
        scanListProvider.nuevoScan(barcodeScanRes2);
        // scanListProvider.nuevoScan('geo:15.33,15.66');
        print( barcodeScanRes );
        print('---------------------------------');
      },
    );
  }
}