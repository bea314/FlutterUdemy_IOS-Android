import 'package:fl_components/theme/themes.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  double _sliderValue = 100;
  bool _sliderEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders & Checks'),
      ),
      body: Column(
        children: [

          Slider.adaptive(
            activeColor: AppTheme.primary,
            //divisions: 10,
            min: 50,
            max: 400,
            value: _sliderValue, 
            onChanged: _sliderEnable
            ? (value) {
              _sliderValue = value;
              setState(() {});
            }
            : null
          ),

          // Checkbox(
          //   value: _sliderEnable, 
          //   onChanged: (value) {
          //     _sliderEnable = value ?? true;
          //     setState(() {});
          // }),
          CheckboxListTile(
            activeColor: AppTheme.primary,
            title: const Text('Habilitar Slider'),
            value: _sliderEnable, 
            onChanged: (value) => setState(() { _sliderEnable = value ?? true; }),
          ),
          // Switch(
          //   value: _sliderEnable, 
          //   onChanged: (value) => setState(() { _sliderEnable = value ?? true; }),
          // ),
          SwitchListTile.adaptive(
            activeColor: AppTheme.primary,
            title: const Text('Habilitar Slider'),
            value: _sliderEnable, 
            onChanged:(value) => setState(() { _sliderEnable = value ; }),
          ),
          Image(
            image: const NetworkImage('https://1000marcas.net/wp-content/uploads/2020/03/Nightwing-Logo-1.png'),
            fit: BoxFit.contain,
            width: _sliderValue,
            ),
          const AboutListTile(),
        ],
      )
    );
  }
}