import 'package:test/test.dart';

void main() {
  test('function is also an object ', () {
    void printOne(string) {
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
    int enableFlags ({bool? bold, bool? hidden}) {
      return 3;
    };

    expect(enableFlags(), 3); // named parameters are optional
    expect(enableFlags(bold: true), 3);
    expect(enableFlags(hidden: false, bold: true), 3);
  });

  test('non nullable named parameters should be given default values', () {
    int enableFlags ({bool bold=true, bool hidden=false}) {
      return 3;
    };

    expect(enableFlags(), 3);
  });

  test('you can specify "required" for named parameter', () {
    int enableFlags ({required bool bold, bool hidden=false}) {
      return 3;
    };

    expect(enableFlags(bold: true), 3);
  });
}
