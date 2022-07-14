import 'package:flutter/material.dart';
import 'package:productos_app/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/models/models.dart';
import 'package:productos_app/services/product_service.dart';

import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  
  static const String routerName = 'home';

  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    if( productsService.isLoading ) return const LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        actions: [
          IconButton(
          onPressed: () {
            authService.logout();
            Navigator.pushReplacementNamed(context, LoginScreen.routerName);
          }, 
          icon: const Icon( Icons.logout_outlined )
          ),
        ]
      ),
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            productsService.selectedProduct = productsService.products[index].copy();
            Navigator.pushNamed(context, ProductScreen.routerName);
          },
          child: ProductCard(products: productsService.products[index],),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add ),
        onPressed: (){
          productsService.selectedProduct = Product(available: true, name: '', price: 0.0);
          Navigator.pushNamed(context, ProductScreen.routerName);
        }
      ),
    );
  }
}