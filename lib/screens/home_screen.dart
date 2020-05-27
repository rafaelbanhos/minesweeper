import 'package:flutter/material.dart';
import 'package:minesweeperapp/components/field_widget.dart';
import 'package:minesweeperapp/models/explosion_exception.dart';
import 'package:minesweeperapp/models/field.dart';
import '../components/result_widget.dart';

class HomeScreen extends StatelessWidget {
  void _restart() {
    print('Reiniciar');
  }

  void _open(Field f) {
    print('abrir..');
  }

  void _switchMarkup(Field field) {
    print('altenar marcação...');
  }

  @override
  Widget build(BuildContext context) {
    Field neighbor1 = Field(line: 1, column: 0);
    neighbor1.mine();
    Field neighbor2 = Field(line: 1, column: 1);
    neighbor2.mine();

    Field field = Field(line: 0, column: 0);
    field.addNeighbor(neighbor1);
    field.addNeighbor(neighbor2);

    try {
      //field.mine();
      field.changeMarkup();
    } on ExplosionException {}

    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          won: true,
          onRestart: _restart,
        ),
        body: Container(
          child: FieldWidget(
            field: field,
            onOpen: _open,
            onSwitchMarkup: _switchMarkup,
          ),
        ),
      ),
    );
  }
}
