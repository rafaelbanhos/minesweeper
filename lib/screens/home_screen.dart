import 'package:flutter/material.dart';
import 'package:minesweeperapp/components/board_widget.dart';
import 'package:minesweeperapp/models/board.dart';
import 'package:minesweeperapp/models/explosion_exception.dart';
import 'package:minesweeperapp/models/field.dart';
import '../components/result_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _won;
  Board _board = Board(
    lines: 12,
    columns: 12,
    numberBombs: 3,
  );

  void _restart() {
    setState(() {
      _won = null;
      _board.restart();
    });
  }

  void _open(Field field) {
    if (_won != null) {
      return;
    }
    setState(() {
      try {
        field.open();
        if (_board.sortedOut) {
          _won = true;
        }
      } on ExplosionException {
        _won = false;
        _board.revealBombs();
      }
    });
  }

  void _switchMarkup(Field field) {
    if (_won != null) {
      return;
    }
    setState(() {
      field.changeMarkup();
      if (_board.sortedOut) {
        _won = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          won: _won,
          onRestart: _restart,
        ),
        body: Container(
          child: BoardWidget(
            board: _board,
            onOpen: _open,
            onSwitchMarkup: _switchMarkup,
          ),
        ),
      ),
    );
  }
}
