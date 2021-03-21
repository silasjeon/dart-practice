import 'package:test/test.dart';
import 'package:characters/characters.dart';

void main() {
  test('characters are distinguished from string ', () {
    var hi = 'Hi 🇩🇰';
    expect(hi.characters.last, '🇩🇰');
    expect(false, hi.substring(hi.length - 1) == '🇩🇰');
  });
}
