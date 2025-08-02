class WeatherHourEntity {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherHourEntity({this.location, this.current, this.forecast});
}

class Current {
  double? tempC;
  Condition? condition;
  String? windDir;
  double? windKph;
  int? humidity;
  int? cloud;
  double? uv;
  AirQuality? airQuality;

  Current({
    this.tempC,
    this.condition,
    this.windDir,
    this.windKph,
    this.humidity,
    this.cloud,
    this.uv,
    this.airQuality,
  });
}

class AirQuality {
  double? co;
  double? no2;

  AirQuality({this.co, this.no2});
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});
}

class Forecastday {
  DateTime? date;
  int? dateEpoch;
  List<Hour>? hour;

  Forecastday({this.date, this.dateEpoch, this.hour});
}

class Hour {
  int? timeEpoch;
  String? time;
  double? tempC;
  Condition? condition;
  int? cloud;

  Hour({this.timeEpoch, this.time, this.tempC, this.condition, this.cloud});
}

class Location {
  String? name;
  String? region;
  String? country;
  int? localtimeEpoch;
  String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.localtimeEpoch,
    this.localtime,
  });
}
