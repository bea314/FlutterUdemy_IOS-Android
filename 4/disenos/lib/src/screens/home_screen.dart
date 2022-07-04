import 'package:disenos/src/widgets/background.dart';
import 'package:disenos/src/widgets/card_table.dart';
import 'package:disenos/src/widgets/custom_bottom_navigation.dart';
import 'package:disenos/src/widgets/page_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          // Background
          BackgroundHome(),
          // Home Body
          HomeBody(),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          // Titulos
          PageTitle(),
          // Card Table
          CardTable(),
        ],
      ),
    );
  }
}