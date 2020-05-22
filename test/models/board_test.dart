import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeperapp/models/board.dart';

main() {
  test('Ganhar Jogo', () {
    Board board = Board(
      lines: 2,
      columns: 2,
      numberBombs: 0,
    );

    board.fields[0].mine();
    board.fields[3].mine();

    //simulando um jogo
    board.fields[0].changeMarkup();
    board.fields[1].open();
    board.fields[2].open();
    board.fields[3].changeMarkup();

    expect(board.sortedOut, isTrue);
  });
}
