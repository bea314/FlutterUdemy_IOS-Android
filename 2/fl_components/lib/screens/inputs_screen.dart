import 'package:flutter/material.dart';

import 'package:fl_components/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
   
  const InputsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

  final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

  final Map<String, String> formValues = {
    'first_name': 'Beatriz',
    'last_name': 'Del Pinal',
    'email': 'beatriz.delpinal@optima.com.sv',
    'password': '1234',
    'role': 'admin',
  };

    return Scaffold(
      appBar: AppBar(title: const Text('Inputs y Formularios'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,

            child: Column(
              children:  [
                CustomInputField(labelText: 'Nombre', hintText: 'Nombre del usuario', fontProperty: 'first_name', fontValues: formValues,),
                const SizedBox(height: 30,),

                CustomInputField(labelText: 'Apellido', hintText: 'Apellido del usuario', fontProperty: 'last_name', fontValues: formValues,),
                const SizedBox(height: 30,),

                CustomInputField(labelText: 'Correo', hintText: 'Correo del usuario', keyboardType: TextInputType.emailAddress, fontProperty: 'email', fontValues: formValues,),
                const SizedBox(height: 30,),

                CustomInputField(labelText: 'Contraseña', hintText: 'Contraseña del usuario', keyboardType: TextInputType.emailAddress,
                obscureText: true, fontProperty: 'password', fontValues: formValues,),
                const SizedBox(height: 30,),

                DropdownButtonFormField<String>(
                  value: 'Admin',
                  items: const [
                    DropdownMenuItem( value: 'Admin', child: Text('Admin')),
                    DropdownMenuItem( value: 'Superuser', child: Text('Superuser')),
                    DropdownMenuItem( value: 'Developer', child: Text('Developer')),
                    DropdownMenuItem( value: 'Jr. Developer', child: Text('Jr. Developer')),
                  ], 
                  onChanged: (value) {
                    print(value);
                    formValues['role'] = value ?? 'Admin';
                  }
                  ),
                
          
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Guardar'))),
                  onPressed: () {
                    FocusScope.of(context).requestFocus( FocusNode() );

                    if (!myFormKey.currentState!.validate() ) {
                      print('Formulario no válido');
                      return;
                    }

                    print('$formValues');
                  }, 
                )
              ],
            ),
          ),
          ),
      )
    );
  }
}