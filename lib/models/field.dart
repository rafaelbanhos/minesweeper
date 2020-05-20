import 'package:flutter/foundation.dart';
import 'explosion_exception.dart';

class Field {
  final int line;
  final int column;
  final List<Field> neighbors = [];

  bool _open = false;
  bool _marked = false;
  bool _mined = false;
  bool _exploded = false;

  Field({@required this.line, @required this.column});

  void addNeighbor(Field neighbor) {
    final deltaLine = (line - neighbor.line).abs();
    final deltaColumn = (column - neighbor.column).abs();

    if (deltaLine == 0 && deltaColumn == 0) {
      return;
    }
    if (deltaLine <= 1 && deltaColumn <= 1) {
      neighbors.add(neighbor);
    }
  }

  void open() {
    if (_open) {
      return;
    }

    _open = true;

    if (_mined) {
      _exploded = true;
      throw ExplosionException();
    }

    if (safeNeighborhood) {
      neighbors.forEach((v) => v.open());
    }
  }

  void revealBombs() {
    if (_mined) {
      _open = true;
    }
  }

  void mine() {
    _mined = true;
  }

  void changeMarkup() {
    _marked = !_marked;
  }

  void restart() {
    _open = false;
    _marked = false;
    _mined = false;
    _exploded = false;
  }

  bool get mined {
    return _mined;
  }

  bool get exploded {
    return _exploded;
  }

  bool get opened {
    return _open;
  }

  bool get marked {
    return _marked;
  }

  bool get sortedOut {
    bool minedAndMarked = mined && marked;
    bool safeAndOpen = !mined && opened;
    return minedAndMarked || safeAndOpen;
  }

  bool get safeNeighborhood {
    return neighbors.every((v) => !v.mined);
  }

  int get numberMinesNeighbors {
    return neighbors.where((v) => v.mined).length;
  }
}
