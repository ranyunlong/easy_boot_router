import 'package:easyboot_router/src/router.dart';
import 'package:test/test.dart';

void main() {
  group('Init test', () {
    Router router;

    setUp(() {
      router = Router();
    });

    test('Test router return type', () {
      expect(router.routes, isList);
    });
  });
}
