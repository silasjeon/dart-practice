import 'package:test/test.dart';

void main() {
  test('For sure, list element can be replaced', () {
    var list = [0, 1, 2, 3];
    list[0] = 3;
    expect(list[0], 3);
  });

  test('final list element can be replaced too', () {
    final list = [0, 1, 2, 3];
    list[0] = 3;
    expect(list[0], 3);
  });

  test('But const variable is immutable', () {
    const list = [0, 1, 2, 3];
    expect(() => list[0] = 3, throwsA(TypeMatcher<UnsupportedError>()));
  });

  test('It is recursively immutable', () {
    const doubleList = [
      [0],
      [1, 2],
      [2, 3],
      []
    ];
    expect(
        () => doubleList[0][0] = 1, throwsA(TypeMatcher<UnsupportedError>()));
  });

  test('const can be used for values', () {
    var list = const [0, 1, 2, 3];
    expect(() => list[0] = 1, throwsA(TypeMatcher<UnsupportedError>()));
  });

  test('reference to const value can be changed', () {
    var list = const [0, 1, 2, 3];
    list = [0, 3];
    expect(list, [0, 3]);
  });

  testNPE();
  testConstructor();
  testSuperclassConstructor();
}

class Point {
  int x = 1;
  int y = 2;
}

void testNPE() {

  test('avoid NPE using ?.', () {
    Point? func() {
      return null;
    }

    Point? p = func();

    int? localY = p?.y;  // Not throw NPE. localY is null if p is null.
    expect(localY, null);
  });
}

class ProfileMark {
  final String name;
  final DateTime start = DateTime.now();

  ProfileMark(this.name);
  ProfileMark.unnamed() : name = '';  // named constructor
  ProfileMark.nameX({x}) : name = x;
}

void testConstructor() {
  test('Construct with named constructor', () {
    var profileMark = ProfileMark.unnamed();
    expect(profileMark.name, '');

    var profileMark2 = ProfileMark.nameX(x: 'x');
    expect(profileMark2.name, 'x');
  });
}

class Super {
  int x;
  int y;

  Super() : x = 0, y = 0;
}

class Sub extends Super {
  int z;
  Sub() : z = 1;
}


void testSuperclassConstructor() {
  test("Super class's default constructor is called in subclass", () {
    var sub = Sub();

    expect(sub.x, 0);
    expect(sub.y, 0);
    expect(sub.z, 1);
  });
}