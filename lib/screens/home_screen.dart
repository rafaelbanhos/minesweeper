import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Campo Minado'),
        ),
        body: Container(
          child: Text('Tabuleiro'),
        ),
      ),
    );
  }
}
