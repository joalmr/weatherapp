import 'package:weatherapp/features/weather/domain/entities/weather_hour_entities.dart';

class WeatherHourModels extends WeatherHourEntity {
  WeatherHourModels({super.location, super.current, super.forecast});

  factory WeatherHourModels.fromJson(Map<String, dynamic> json) =>
      WeatherHourModels(
        location: json["location"] == null
            ? null
            : LocationModel.fromJson(json["location"]),
        current: json["current"] == null
            ? null
            : CurrentModel.fromJson(json["current"]),
        forecast: json["forecast"] == null
            ? null
            : ForecastModel.fromJson(json["forecast"]),
      );
}

class CurrentModel extends Current {
  CurrentModel({
    super.tempC,
    super.condition,
    super.windDir,
    super.windKph,
    super.humidity,
    super.cloud,
    super.uv,
    super.airQuality,
  });

  factory CurrentModel.fromJson(Map<String, dynamic> json) => CurrentModel(
    tempC: json["temp_c"]?.toDouble(),
    condition: json["condition"] == null
        ? null
        : ConditionModel.fromJson(json["condition"]),
    windDir: json["wind_dir"] ?? '',
    windKph: json["wind_kph"]?.toDouble(),
    humidity: json["humidity"],
    cloud: json["cloud"],
    uv: json["uv"]?.toDouble(),
    airQuality: json["air_quality"] == null
        ? null
        : AirQualityModel.fromJson(json["air_quality"]),
  );
}

class AirQualityModel extends AirQuality {
  AirQualityModel({super.co, super.no2});

  factory AirQualityModel.fromJson(Map<String, dynamic> json) =>
      AirQualityModel(co: json["co"]?.toDouble(), no2: json["no2"]?.toDouble());
}

class ConditionModel extends Condition {
  ConditionModel({super.text, super.icon, super.code});

  factory ConditionModel.fromJson(Map<String, dynamic> json) => ConditionModel(
    text: json["text"],
    icon: 'http:${json["icon"]}',
    code: json["code"],
  );
}

class ForecastModel extends Forecast {
  ForecastModel({super.forecastday});

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
    forecastday: json["forecastday"] == null
        ? []
        : List<ForecastdayModel>.from(
            json["forecastday"]!.map((x) => ForecastdayModel.fromJson(x)),
          ),
  );
}

class ForecastdayModel extends Forecastday {
  ForecastdayModel({super.date, super.dateEpoch, super.hour});

  factory ForecastdayModel.fromJson(Map<String, dynamic> json) =>
      ForecastdayModel(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"],
        hour: json["hour"] == null
            ? []
            : List<Hour>.from(json["hour"]!.map((x) => HourModel.fromJson(x))),
      );
}

class HourModel extends Hour {
  HourModel({
    super.timeEpoch,
    super.time,
    super.tempC,
    super.condition,
    super.cloud,
  });

  factory HourModel.fromJson(Map<String, dynamic> json) => HourModel(
    timeEpoch: json["time_epoch"],
    time: json["time"],
    tempC: json["temp_c"]?.toDouble(),
    condition: json["condition"] == null
        ? null
        : ConditionModel.fromJson(json["condition"]),
    cloud: json["cloud"],
  );
}

class LocationModel extends Location {
  LocationModel({
    super.name,
    super.region,
    super.country,
    super.localtimeEpoch,
    super.localtime,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    name: json["name"],
    region: json["region"],
    country: json["country"],
    localtimeEpoch: json["localtime_epoch"],
    localtime: json["localtime"],
  );
}
