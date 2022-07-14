import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:productos_app/models/models.dart';

class ProductsService extends ChangeNotifier {

  final String _baseUrl = "flutter-varios-d92a5-default-rtdb.firebaseio.com";
  final List<Product> products = [];
  late Product selectedProduct;

  final _storage = const FlutterSecureStorage();

  File? newPictureFile;
  
  bool isLoading = true;
  bool isSaving = false;

  ProductsService() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {

    isLoading = true;
    notifyListeners();

    final url = Uri.https( _baseUrl, 'products.json', {
      'auth': await _storage.read(key: 'idToken') ?? ''
    });
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode( resp.body );
    
    if (productsMap == null ) return [];
    
    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      products.add( tempProduct );
    });

    isLoading = false;
    notifyListeners();

    return products;
  }

  Future saveOrCreateProduct( Product product ) async {
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      // Create
      await createProduct(product);
    } else {
      // Update
      await updateProduct(product);
    }
    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct( Product product ) async {

    final url = Uri.https( _baseUrl, 'products/${product.id}.json', {
      'auth': await _storage.read(key: 'idToken') ?? ''
    });
    final resp = await http.put(url, body: product.toJson());
    final decodedData = resp.body;

    print(decodedData);

    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;

    return product.id!;

  }

  Future<String> createProduct( Product product ) async {

    final url = Uri.https( _baseUrl, 'products.json');
    final resp = await http.post(url, body: product.toJson());
    final decodedData = json.decode(resp.body);

    product.id = decodedData['name'];

    products.add(product);

    return product.id!;

  }

  void updateSelectedProductImage( String path ) {
    selectedProduct.picture = path;
    newPictureFile = File.fromUri( Uri(path: path) );

    notifyListeners();
  }

  Future<String> uploadImage() async {
    if( newPictureFile == null ) return '';
    notifyListeners();

    final url = Uri.parse( 'https://api.cloudinary.com/v1_1/df2skhki8/image/upload?upload_preset=weit50ni' );
    final imaUploafRequest = http.MultipartRequest( 'POST', url );
    final file = await http.MultipartFile.fromPath('file', newPictureFile!.path);
    imaUploafRequest.files.add(file);

    final streamResponse = await imaUploafRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if( resp.statusCode != 200 && resp.statusCode != 201 ) {
      print('Algo salió mal');
      print( resp.body );
      return '';
    }

    final decodedData = json.decode( resp.body );
    print(decodedData['secure_url']);
    return decodedData['secure_url'];

  }
}