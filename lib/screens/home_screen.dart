import 'package:flutter/material.dart';
import '../components/result_widget.dart';

class HomeScreen extends StatelessWidget {

  _restart() {
    print('Reiniciar');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          won: true,
          onRestart: _restart,
        ),
        body: Container(
          child: Text('Tabuleiro'),
        ),
      ),
    );
  }
}
