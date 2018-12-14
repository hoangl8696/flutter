import 'dart:core';

class Endpoint {
  static const apiScheme = 'https';
  static const apiHost = 'fluttercrashcourse.com';
  static const prefix = '/api/v1';

  static Uri uri(String path, {Map<String, dynamic> queryParams}) {
    final uri = Uri(
      scheme: apiScheme,
      host: apiHost,
      path: '$prefix$path',
      queryParameters: queryParams,
    );
    return uri;
  }
}
