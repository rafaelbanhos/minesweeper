import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'field.dart';

class Board {
  final int lines;
  final int columns;
  final int numberBombs;

  final List<Field> _fields = [];

  Board(
      {@required this.lines,
      @required this.columns,
      @required this.numberBombs}) {
    _createFields();
    _relateNeighbors();
    _drawMines();
  }

  void restart() {
    _fields.forEach((f) => f.restart());
    _drawMines();
  }

  void revealBombs() {
    _fields.forEach((f) => f.revealBombs());
  }

  void _createFields() {
    for (int l = 0; l < lines; l++) {
      for (int c = 0; c < columns; c++) {
        _fields.add(Field(line: l, column: c));
      }
    }
  }

  void _relateNeighbors() {
    for (var field in _fields) {
      for (var neighbor in _fields) {
        field.addNeighbor(neighbor);
      }
    }
  }

  void _drawMines() {
    int drawn = 0;

    if (numberBombs < lines * columns) {
      return;
    }

    while (drawn < numberBombs) {
      int i = Random().nextInt(_fields.length);

      if (!_fields[i].mined) {
        drawn++;
        _fields[i].mine();
      }
    }
  }

  List<Field> get fields {
    return _fields;
  }

  bool get sortedOut {
    return _fields.every((f) => f.sortedOut);
  }
}
