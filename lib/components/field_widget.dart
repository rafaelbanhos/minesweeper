import 'package:flutter/material.dart';
import 'package:minesweeperapp/models/field.dart';

class FieldWidget extends StatelessWidget {
  final Field field;
  final void Function(Field) onOpen;
  final void Function(Field) onSwitchMarkup;

  FieldWidget(
      {@required this.field,
      @required this.onOpen,
      @required this.onSwitchMarkup});

  Widget _getImage() {
    int numberMines = field.numberMinesNeighbors;
    if (field.opened && field.mined && field.exploded) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (field.opened && field.mined) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (field.opened && numberMines > 0) {
      return Image.asset('assets/images/aberto_$numberMines.jpeg');
    } else if (field.marked) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(field),
      onLongPress: () => onSwitchMarkup(field),
      child: _getImage(),
    );
  }
}
