import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeperapp/models/field.dart';

main() {
  group('Field', () {
    test('Open field WITH Explosion', () {
      Field c = Field(line: 0, column: 0);
      c.mine();

      expect(c.open, throwsException);
    });

    test('Open field WITHOUT Explosion', () {
      Field c = Field(line: 0, column: 0);
      c.open();
      expect(c.opened, isTrue);
    });

    test('Add NO neighbor', () {
      Field c1 = Field(line: 0, column: 0);
      Field c2 = Field(line: 1, column: 3);
      c1.addNeighbor(c2);
      expect(c1.neighbors.isEmpty, isTrue);
    });

    test('Add neighbor', () {
      Field c1 = Field(line: 3, column: 3);
      Field c2 = Field(line: 3, column: 4);
      Field c3 = Field(line: 2, column: 2);
      Field c4 = Field(line: 4, column: 4);

      c1.addNeighbor(c2);
      c1.addNeighbor(c3);
      c1.addNeighbor(c4);

      expect(c1.neighbors.length, 3);
    });
  });
}
