class WeatherEntity {
  String? name;
  String? region;
  String? country;
  double? tempC;
  Condition? condition;
  double? windKph;
  String? windDir;
  int? humidity;
  int? cloud;
  double? uv;
  double? airQuality;

  WeatherEntity({
    this.name,
    this.region,
    this.country,
    this.tempC,
    this.condition,
    this.windKph,
    this.windDir,
    this.humidity,
    this.cloud,
    this.uv,
    this.airQuality,
  });
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});
}
