import 'package:test/test.dart';

void main() {
  test('list support spread', () {
    var list = [1, 2];
    var list2 = [...list, 3, 4];
    expect(list2, [1, 2, 3, 4]);

    var list3;
    var list4 = [1, 2, ...?list3];
    expect(list4, [1, 2]);
  });

  test('list support collection if and for', () {
    var list = [
      1,
      2,
      if (true) 3,
      for (var i in [1, 2, 3]) i
    ];
    expect(list, [1, 2, 3, 1, 2, 3]);
  });

  test('map and set literals', () {
    var constantSet = {
      'fluorine',
      'chlorine',
      'bromine',
      'iodine',
      'astatine',
    };
    expect(constantSet.length, 5);

    var gifts = {
      // Key:    Value
      'first': 'partridge',
      'second': 'turtledoves',
      'fifth': 'golden rings'
    };
    expect(gifts.length, 3);
  });
}
