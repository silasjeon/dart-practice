import 'package:test/test.dart';

void main() {
  test('function is also an object ', () {
    void printOne(string) {
      print(string);
    }

    expect(true, printOne is Function);
  });
}
