import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

onLaunchURL( BuildContext context, ScanModel scan) async {
  Uri url = Uri.parse(scan.valor);
  print(url);
  if ( scan.tipo == 'http') {
    if(await canLaunchUrl(url)) {
      await launchUrl(url);
    }else {
      print('No se pudo, sorry not sorry');
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}