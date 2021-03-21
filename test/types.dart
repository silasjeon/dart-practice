import 'package:test/test.dart';

void main() {
  test('int type and double types are subclasses of num', () {
    var i = 3;
    expect(i.runtimeType, int);
    var d = 3.5;
    expect(d.runtimeType, double);
    expect(true, i is num);
    expect(true, d is num);

    var s = 'string';
    expect(false, s is num);
  });

  test('only int has shift op', () {
    var i = 3;
    expect(i << 1, 6);

    var d = 3.5;
    // d << 1;  Not defined
  });



}
