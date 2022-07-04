
import 'dart:convert';
import 'package:meta/meta.dart';

class ScanModel {
    ScanModel({
        this.id,
        this.tipo,
        required this.valor,
    }) {
      if ( valor.contains('http')){
        tipo = 'http';
      } else if ( valor.contains('geo') ) {
        tipo = 'geo';
      } else {
        tipo = 'other';
      } 
    }

    int? id;
    String? tipo;
    String valor;

    //factory ScanModel.fromJson(String str) => ScanModel.fromMap(json.decode(str));
    factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(

    //String get toJson => json.encode(toMap());

        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
    
    factory ScanModel.fromJson(Map<String, dynamic> json ) => ScanModel(
      id: json['id'],
      tipo: json['tipo'],
      valor: json['valor'],
    );

    Future<Map<String, dynamic>> toJson() async {
      return {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
    }
}
