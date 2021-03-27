import 'package:test/test.dart';

void main() {
  test('wrong way to test Future', () {
    Future<int> slowReturn(int val) async {
      return Future.delayed(Duration(milliseconds: 300), () => val);
    };

    expect(false, slowReturn(3) == 3);
  });

  test('test returning async Future', () {
    Future<int> slowReturn(int val) async {
      return Future.delayed(Duration(milliseconds: 300), () => val);
    };

    return slowReturn(3).then(
        (value) => expect(value, 3)); // test function waits for the Future
  });
}
