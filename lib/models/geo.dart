import 'dart:convert';

class Geo {
  Geo({
    this.lat,
    this.lng,
  });

  String? lat;
  String? lng;

  factory Geo.fromJson(String str) => Geo.fromMap(json.decode(str));

  factory Geo.fromMap(Map<String, dynamic> json) => Geo(
        lat: json["lat"] == null ? null : json["lat"],
        lng: json["lng"] == null ? null : json["lng"],
      );
}
