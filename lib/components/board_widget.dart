import 'package:flutter/material.dart';
import 'package:minesweeperapp/components/field_widget.dart';
import 'package:minesweeperapp/models/board.dart';
import 'package:minesweeperapp/models/field.dart';

class BoardWidget extends StatelessWidget {

  final Board board;
  final void Function(Field) onOpen;
  final void Function(Field) onSwitchMarkup;

  BoardWidget({
    @required this.board,
    @required this.onOpen,
    @required this.onSwitchMarkup
});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: board.columns,
        children: board.fields.map((f) {
          return FieldWidget(
            field: f,
            onOpen: onOpen,
            onSwitchMarkup: onSwitchMarkup,
          );
        }).toList(),
      ),
    );
  }
}
