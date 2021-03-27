import 'package:test/test.dart';

void main() {
  testInterface();
  testOverride();
  testEnumClass();
  testMixin();
}

class Duck {
  String quack() {
    return 'quack';
  }
}

class Box implements Duck {
  @override
  String quack() {
    return 'box';
  }

}

void testInterface() {
  test('Duck class implicitly has interface', () {
    var duck = Duck();
    var box = Box();
    expect(duck.quack(), 'quack');
    expect(box.quack(), 'box');
  });
}


class OverDuck extends Duck {
  @override
  String quack() {
    return 'overquack';
  }
}

void testOverride() {
  test('overriding class', () {
    expect(OverDuck().quack(), 'overquack');
  });
}

enum Color { red, green, blue }


void testEnumClass() {
  test('usual enum class', () {
    expect(Color.values, [Color.red, Color.green, Color.blue]);
    expect(Color.red.index, 0);
  });
}

mixin FlyingAnimal {
  String fly() {
    return 'fly';
  }
}

class Eagle extends Duck with FlyingAnimal {

}

void testMixin() {
  test('use mixin', (){
    var eagle = Eagle();
    expect(eagle.quack(), 'quack');
    expect(eagle.fly(), 'fly');

  });
}
