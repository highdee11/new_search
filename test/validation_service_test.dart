import 'package:flutter_test/flutter_test.dart';
import 'package:newsapp/core/services/validation-service.dart';

void main() {
  test('Test Validation Services', () async {
    String? test1 = ValidationService().isValidInput("", minLength: 5);
    String? test2 = ValidationService().isValidInput("apple", minLength: 5);

    expect(test1, "Input is empty");
    expect(test2, null);


    String? test3 = ValidationService().isValidString("2323");
    String? test4 = ValidationService().isValidString("apple");

    expect(test3, "Input is not valid");
    expect(test4, null);
  });
}