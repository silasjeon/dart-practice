import 'package:test/test.dart';

void main() {
  test('For sure, list element can be replaced', () {
    var list = [0, 1, 2, 3];
    list[0] = 3;
    expect(3, list[0]);
  });

  test('final list element can be replaced too', () {
    final list = [0, 1, 2, 3];
    list[0] = 3;
    expect(3, list[0]);
  });

  test('But const variable is immutable', () {
    const list = [0, 1, 2, 3];
    expect(() => list[0] = 3, throwsA(TypeMatcher<UnsupportedError>()));
  });

  test('It is recursively immutable', () {
    const doubleList = [[0], [1, 2], [2, 3], []];
    expect(() => doubleList[0][0] = 1, throwsA(TypeMatcher<UnsupportedError>()));
  });
}
