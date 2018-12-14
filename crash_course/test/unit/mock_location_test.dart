import 'package:flutter_test/flutter_test.dart';
import 'package:crash_course/mocks/mock_location.dart';

void main() {
  test('test fetchAny', () {
    final mockLocation = MockLocation.FetchAny();
    expect(mockLocation, isNotNull);
    expect(mockLocation.name, isNotEmpty);
  });

  test('test fetchAll', () {
    final mockLocation = MockLocation.FetchAll();
    expect(mockLocation.length, greaterThan(0));
    expect(mockLocation[0].name, isNotEmpty);
  });
}