import 'package:test/test.dart';

Future<void> main() async {
  Future<int> slowReturn(int val) {
    return Future.delayed(Duration(milliseconds: 300), ()=>val);
  }

  print(await slowReturn(3)); // await is available in async function
}