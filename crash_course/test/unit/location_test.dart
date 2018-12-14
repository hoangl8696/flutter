import 'package:crash_course/models/location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test location deserialization', () async {
    final List<Location> locations = await Location.fetchAll();
    for (Location location in locations) {
      expect(location.name, hasLength(greaterThan(0)));
      expect(location.url, hasLength(greaterThan(0)));

      final Location fetchLocation = await Location.fetchById(location.id);
      expect(fetchLocation.name, equals(location.name));
      expect(fetchLocation.url, equals(location.url));
      // expect(fetchLocation.facts, hasLength(location.facts.length));
    }
  });
}
