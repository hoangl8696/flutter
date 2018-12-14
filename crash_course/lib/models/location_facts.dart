import 'package:json_annotation/json_annotation.dart';

part 'location_facts.g.dart';

@JsonSerializable()
class LocationFacts {
    final String title;
    final String text;
    LocationFacts({this.title, this.text});

  factory LocationFacts.fromJson(Map<String, dynamic> json) => _$LocationFactsFromJson(json);
}