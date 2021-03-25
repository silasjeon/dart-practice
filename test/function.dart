import 'package:test/test.dart';

void main() {
  test('function is also an object ', () {
    void printOne(string, {String? two}) {
      print(string);
    }

    expect(printOne is Function, true);
  });

  test('function can be passed as parameter ', () {
    int run(func) {
      return func(3);
    }

    var multiply = (x) => x * 2;

    expect(run(multiply), 6);
  });

  test('defining function with named parameters', () {
    int enableFlags({bool? bold, bool? hidden}) {
      return 3;
    }

    ;

    expect(enableFlags(), 3); // named parameters are optional
    expect(enableFlags(bold: true), 3);
    expect(enableFlags(hidden: false, bold: true), 3);
  });

  test('non nullable named parameters should be given default values', () {
    int enableFlags({bool bold = true, bool hidden = false}) {
      return 3;
    }

    ;

    expect(enableFlags(), 3);
  });

  test('you can specify "required" for named parameter', () {
    int enableFlags({required bool bold, bool hidden = false}) {
      return 3;
    }

    ;

    expect(enableFlags(bold: true), 3);
  });

  test('positional parameter is also available', () {
    int enableFlags(bool first, [bool? bold, bool hidden = false]) {
      return 3;
    }

    ;

    expect(enableFlags(true, true, false), 3);
  });

  test('anonymous function can be created', () {
    var list = [1, 2, 3];
    var x = 0;
    list.forEach((i) {
      x += i;
    });

    expect(x, 6);

    var y = 0;
    list.forEach((i) => y += i);
    expect(y, 6);
  });

  test('closure support', () {
    Function makeAdder(int addBy) {
      return (int i) => addBy + i;
    }

    var add2 = makeAdder(2);

    // Create a function that adds 4.
    var add4 = makeAdder(4);

    assert(add2(3) == 5);
    assert(add4(3) == 7);
  });

  test('every function has return value', () {
    func() {

    };
    expect(func(), null);

    void voidFunc() {

    }

    // expect(voidFunc(), null);  Analyzer prevents to use void result
  });
}
