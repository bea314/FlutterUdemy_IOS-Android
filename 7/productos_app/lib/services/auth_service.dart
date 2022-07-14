import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {

  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyDuO8zMxDxiD3jrqn5yO_Vzx7TdihWpV-w';

  final storage = const FlutterSecureStorage();

// Si regresamos algo, va a ser un error
  Future<String?> createUser( String email, String password ) async {
    final Map<String, dynamic> authData = {
      'email'   : email,
      'password': password
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {
      'key': _firebaseToken
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode( resp.body );
    
    if( decodedResp.containsKey('idToken') ) {
      // return decodedResp['idToken'];
      await storage.write(key: 'idToken', value: decodedResp['idToken']);
      return null;
    } else {
      return decodedResp['error']['message'];
    }

  }

  Future<String?> login( String email, String password ) async {
    final Map<String, dynamic> authData = {
      'email'   : email,
      'password': password
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key': _firebaseToken
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode( resp.body );
    
    print(decodedResp);
    if( decodedResp.containsKey('idToken') ) {
      // Gardarlo en un lugar seguro
      // return decodedResp['idToken'];
      await storage.write(key: 'idToken', value: decodedResp['idToken']);
      return null;
    } else {
      return decodedResp['error']['message'];
    }

  }

  Future logout() async {
    await storage.delete(key: 'idToken');

    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'idToken')??'';
    
  }
}