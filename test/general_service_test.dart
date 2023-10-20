import 'package:flutter_test/flutter_test.dart';
import 'package:newsapp/core/services/general_service.dart';

void main() {
  test('Test General Services', () async {
    String? test1 = GeneralService.formatDate("2023-10-03T20:30:00Z");
    String? test2 = GeneralService.formatDate("2023-1");

    expect(test1, "2023/10/03 08:30 PM");
    expect(test2, null);
  });
}