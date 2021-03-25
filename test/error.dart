import 'package:test/test.dart';

void main() {
  test('try catch using `on`', () {
    void notGoodFunc() {
      var list = [];
      print(list[1]);
    }

    try {
      notGoodFunc();
    } on RangeError catch (e, s) {
      expect(e.message, 'Invalid value');
    }
  });
}
