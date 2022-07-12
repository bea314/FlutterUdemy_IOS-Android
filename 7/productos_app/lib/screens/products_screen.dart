import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:image_picker/image_picker.dart';

import 'package:productos_app/providers/product_form_provider.dart';
import 'package:productos_app/services/product_service.dart';

import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
   
  static const String routerName = 'product';

  const ProductScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    final productService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      create: (context) => ProductFormProvider( productService.selectedProduct ),
      child: _ProductScreenBody(productService: productService),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductsService productService;

  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  ProductImage(
                    url: productService.selectedProduct.picture,
                  ),
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
                      onPressed: () async {
                        
                        final picker = ImagePicker();
                        final XFile? pickedFile = await picker.pickImage(
                          //source: ImageSource.camera,
                          source: ImageSource.gallery,
                          imageQuality: 100
                        );

                        if( pickedFile == null ) {
                          print('No seleccionó nada');
                          return;
                        }

                        productService.updateSelectedProductImage(pickedFile.path);
                      },
                      icon: const Icon(Icons.camera_alt_outlined, size: 40, color: Colors.white,))
                  )
                ],
              ),
              _ProductForm(productForm: productForm,),
              const SizedBox( height: 100, ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: productService.isSaving
        ? null
        : () async {
          if( !productForm.isValidForm() ) return;

          final String imageUrl = await productService.uploadImage();

          if ( imageUrl.isNotEmpty || imageUrl != '' ) { productForm.product.picture = imageUrl; }

          await productService.saveOrCreateProduct(productForm.product);
        },
        child: productService.isSaving
        ? const CircularProgressIndicator( color: Colors.white, )
        : const Icon( Icons.save_outlined ),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  _ProductForm({
    Key? key
    , required this.productForm
  }) : super(key: key,);

  final ProductFormProvider productForm;

  @override
  Widget build(BuildContext context) {
    
    final product = productForm.product;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: _buildBoxDecoration(),
      child: Form(
        key: productForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            const SizedBox(height: 10,),
            TextFormField(
              initialValue: product.name,
              onChanged: ( value ) => product.name = value,
              validator: ( value ) {
                if( value == null || value.isEmpty ) {
                  return 'El nombre es obligatorio';
                }
              },
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Nombre del producto', 
                labelText: 'Nombre:'
              ),
            ),
            const SizedBox(height: 30,),
            TextFormField(
              initialValue: '${product.price}',
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),
              ],
              onChanged: ( value ) {
                if( double.tryParse(value) == null) {
                  product.price = 0;
                } else {
                  product.price = double.parse(value);
                }
              },
              validator: ( value ) {
                if( value == null || value.isEmpty ) {
                  return 'El nombre es obligatorio';
                }
              },
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                hintText: '\$50.00', 
                labelText: 'Precio:'
              ),
            ),
            const SizedBox(height: 30,),
            SwitchListTile.adaptive( 
              value: product.available, 
              title: const Text('Disponible'),
              onChanged: (value) => productForm.updateAvailability(value)
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