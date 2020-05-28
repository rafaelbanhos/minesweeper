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
  Board _board;

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

  Board _getBoard(double width, double height) {
    if (_board == null) {
      int numberColumns = 15;
      double fieldSize = width / numberColumns;
      int numberLines = (height / fieldSize).floor();

      _board =
          Board(lines: numberLines, columns: numberColumns, numberBombs: 3);
    }
    return _board;
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
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return BoardWidget(
                board: _getBoard(
                    constraints.maxWidth,
                    constraints.maxHeight
                ),
                onOpen: _open,
                onSwitchMarkup: _switchMarkup,
              );
            },
          ),
        ),
      ),
    );
  }
}
