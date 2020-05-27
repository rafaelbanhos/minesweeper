import 'package:flutter/material.dart';
import 'package:minesweeperapp/components/board_widget.dart';
import 'package:minesweeperapp/models/board.dart';
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
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          won: true,
          onRestart: _restart,
        ),
        body: Container(
          child: BoardWidget(
            board: Board(
              lines: 15,
              columns: 15,
              numberBombs: 10,
            ),
            onOpen: _open,
            onSwitchMarkup: _switchMarkup,
          ),
        ),
      ),
    );
  }
}
