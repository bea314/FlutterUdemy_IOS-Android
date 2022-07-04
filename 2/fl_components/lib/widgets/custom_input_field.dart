import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType; 
  final bool obscureText;
  final String fontProperty;
  final Map<String, String> fontValues;


  const CustomInputField({
    Key? key, 
    this.hintText, 
    this.labelText, 
    this.helperText, 
    this.icon, 
    this.suffixIcon, 
    this.keyboardType, 
    this.obscureText = false, 
    required this.fontProperty, 
    required this.fontValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false, //focus teclado
      keyboardType: keyboardType,
      obscureText: obscureText,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      onChanged: ( value ) => fontValues[fontProperty] = value,
      validator: ( value ) {
        if ( value == null ) return 'Este campo es requerido';
        return value.length < 3 ? 'Mínimo de 3 letras' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        // prefixIcon: Icon(Icons.supervised_user_circle_sharp),
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
        icon: icon == null ? null : Icon(icon),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.circular(15),
        //     topRight: Radius.circular(15),
        //   )
        // )
      ),
    );
  }
}