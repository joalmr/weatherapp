import 'package:weatherapp/features/weather/domain/entities/weather_entities.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required super.name,
    required super.region,
    required super.country,
    required super.tempC,

    required super.condition,

    required super.windKph,
    required super.windDir,
    required super.humidity,
    required super.cloud,
    required super.uv,
    required super.airQuality,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    name: json["location"]["name"] ?? '',
    region: json["location"]["region"] ?? '',
    country: json["location"]["country"] ?? '',

    tempC: json["current"]["temp_c"]?.toDouble(),
    condition: ConditionModel.fromJson(json["current"]["condition"]),
    windKph: json["current"]["wind_kph"]?.toDouble(),
    windDir: json["current"]["wind_dir"] ?? '',
    humidity: json["current"]["humidity"]?.toInt(),
    cloud: json["current"]["cloud"]?.toInt(),
    uv: json["current"]?["uv"]?.toDouble(),
    airQuality: json["current"]["air_quality"]["co"]?.toDouble(),
  );
}

class ConditionModel extends Condition {
  ConditionModel({
    required super.text,
    required super.icon,
    required super.code,
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json) => ConditionModel(
    text: json["text"],
    icon: 'http:${json["icon"]}',
    code: json["code"],
  );
}
