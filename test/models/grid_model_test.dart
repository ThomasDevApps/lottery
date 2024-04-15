import 'package:flutter_test/flutter_test.dart';
import 'package:lottery/lottery.dart';

void main() {
  group('Test == operator', () {
    test('Test n°1', () {
      const grid1 = GridModel(
        numbers: {1, 2},
        specialNumbers: {3, 4},
        drawnAt: '15/04/2024',
      );
      const grid2 = GridModel(
        numbers: {1, 2},
        specialNumbers: {3, 4},
      );
      expect(grid1 == grid2, true);
    });
  });
}
