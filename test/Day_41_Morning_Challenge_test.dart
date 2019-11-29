import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
 test('Best One Move To Win', () {
    expect(bestOneMoveToWin([[], [1], [2,3,4]]),
        [[],[],[1,2,3,4]]);
  });
 test('Best One Move To Win', () {
   expect(bestOneMoveToWin([[1], [], [2,3,4]]),
       [[],[],[1,2,3,4]]);
 });
  test('Best Two Move To Win', () {
    expect(bestTwoMoveToWin([[1], [2], [3,4]]),
        [[1],[],[2,3,4]]);
  });

 test('Best Two Move To Win', () {
   expect(bestNMoveToWin([[2], [1], [3,4]],3),
       [[],[1],[2,3,4]]);
 });

  test('Best Three Move To Win', () {
    expect(bestThreeMoveToWin([[], [1,2], [3,4]]),
        [[1],[],[2,3,4]]);
  });
 test('Best N Move To Win', () {
   expect(bestNMoveToWin([[], [1,2], [3,4]],3),
       [[1],[],[2,3,4]]);
 });
}