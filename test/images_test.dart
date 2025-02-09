import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:taski_app/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.avatar).existsSync(), isTrue);
    expect(File(Images.checked).existsSync(), isTrue);
    expect(File(Images.logo).existsSync(), isTrue);
    expect(File(Images.plus).existsSync(), isTrue);
    expect(File(Images.searchAlt).existsSync(), isTrue);
    expect(File(Images.todo).existsSync(), isTrue);
    expect(File(Images.unchecked).existsSync(), isTrue);
    expect(File(Images.undraw).existsSync(), isTrue);
  });
}
