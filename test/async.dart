import 'dart:cli';
import 'dart:io';

import 'package:test/test.dart';

void main() {
  test('test returning async Future', () {
    Future<int> slowReturn(int val) async {
      return Future(() {
        sleep(Duration(milliseconds: 300));
        return val;
      });
    }

    return slowReturn(3).then((value) => expect(value, 3)); // test function waits for the Future
  });
}
