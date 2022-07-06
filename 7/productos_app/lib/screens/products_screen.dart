import 'package:flutter/material.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:productos_app/ui/input_decorations.dart';

class ProductScreen extends StatelessWidget {
   
  static const String routerName = 'product';

  const ProductScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  const ProductImage(),
                  Positioned( 
                    top: 40, 
                    left: 20,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_ios_new, size: 40, color: Colors.white,))
                  ),
                  Positioned( 
                    top: 40, 
                    right: 40,
                    child: IconButton(
                      onPressed: () {
                        // TODO Camara o galeria
                      },
                      icon: const Icon(Icons.camera_alt_outlined, size: 40, color: Colors.white,))
                  )
                ],
              ),
              const _ProductForm(),
              const SizedBox( height: 100, ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.save_outlined ),
        onPressed: (){
          // TODO Guardar producto
        },
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: _buildBoxDecoration(),
      child: Form(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Nombre del producto', 
                labelText: 'Nombre:'
              ),
            ),
            const SizedBox(height: 30,),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                hintText: '\$50.00', 
                labelText: 'Precio:'
              ),
            ),
            const SizedBox(height: 30,),
            SwitchListTile.adaptive( 
              value: true, 
              title: const Text('Disponible'),
              onChanged: (value){
                //TODO
              }
            ),
            const SizedBox(height: 30,),

          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only( bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 5,
        offset: Offset(0,5)
      )
    ]
  );
}