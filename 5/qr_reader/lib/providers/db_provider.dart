import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:qr_reader/models/scan_model.dart';

class DBProvider {
  late Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    bool dbState = await stateFinderDB();
    if ( dbState ) return _database;
  
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    // Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentsDirectory.path, 'ScansDB.db' );
    print( path );

    // Crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: ( Database db, int version ) async {
        await db.execute('''
          CREATE TABLE scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        ''');
      }
    );
    
  }

  Future<bool> stateFinderDB() async {
    late bool dbState;
    final String pathDB = getApplicationDocumentsDirectory().toString();
    finaldbExistsdatabaseExists(String path) => databaseFactory. databaseExists(path);
    dbState = await finaldbExistsdatabaseExists(pathDB);
    return dbState;
  }

  nuevoScanRaw( ScanModel nuevoScan) async {
    final id    = nuevoScan.id;
    final tipo  = nuevoScan.tipo;
    final valor  = nuevoScan.valor;

    // Verificar la base de datos
    final db = await database;

    final res = await db.rawInsert(
      '''
        INSERT INTO scans( id, tipo, valor)
          VALUES( $id, $tipo, $valor )
      '''
    );
    return res;
  }

  Future<int> nuevoScan( ScanModel nuevoScan ) async {
    final db  = await database;
    final res = await db.insert( 'scans', nuevoScan.toMap() );
    print(res);
    return res;
  }

  Future<ScanModel?> getScanById( int id ) async {
    final db  = await database;
    final res = await db.query('scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty?ScanModel.fromJson( res.first ):null;
  }

  Future<List<ScanModel>?> getTodosLosScans() async {
    final db  = await database;
    final res = await db.query('scans');
    return res.isNotEmpty?res.map( (s) => ScanModel.fromJson(s) ).toList():[];
  }

  Future<List<ScanModel>?> getScansPorTipo( String tipo ) async {
    final db  = await database;
    final res = await db.query('scans',  where: 'tipo = ?', whereArgs: [tipo] );
    return res.isNotEmpty?res.map( (s) => ScanModel.fromJson(s) ).toList():[];
  }

  Future<int> updateScan( ScanModel nuevoScan ) async {
    final db  = await database;
    final res = db.update('scans', nuevoScan.toJson() as Map<String, Object?>, where: 'id = ?', whereArgs: [nuevoScan.id] );
    return res;
  }

  Future<int> deleteScan( int id ) async {
    final db  = await database;
    final res = await db.delete('scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScans() async {
    final db  = await database;
    final res = await db.rawDelete(
      '''
        DELETE FROM scans
      '''
    );
    return res;
  }
}