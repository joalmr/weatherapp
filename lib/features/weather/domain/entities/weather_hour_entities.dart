class WeatherHourEntity {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherHourEntity({this.location, this.current, this.forecast});

  factory WeatherHourEntity.fromJson(Map<String, dynamic> json) =>
      WeatherHourEntity(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        current: json["current"] == null
            ? null
            : Current.fromJson(json["current"]),
        forecast: json["forecast"] == null
            ? null
            : Forecast.fromJson(json["forecast"]),
      );
}

class Current {
  double? tempC;
  Condition? condition;
  double? windKph;
  int? humidity;
  int? cloud;
  int? uv;
  AirQuality? airQuality;

  Current({
    this.tempC,
    this.condition,
    this.windKph,
    this.humidity,
    this.cloud,
    this.uv,
    this.airQuality,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    tempC: json["temp_c"]?.toDouble(),
    condition: json["condition"] == null
        ? null
        : Condition.fromJson(json["condition"]),
    windKph: json["wind_kph"]?.toDouble(),
    humidity: json["humidity"],
    cloud: json["cloud"],
    uv: json["uv"],
    airQuality: json["air_quality"] == null
        ? null
        : AirQuality.fromJson(json["air_quality"]),
  );
}

class AirQuality {
  double? co;
  double? no2;

  AirQuality({this.co, this.no2});

  factory AirQuality.fromJson(Map<String, dynamic> json) =>
      AirQuality(co: json["co"]?.toDouble(), no2: json["no2"]?.toDouble());

  Map<String, dynamic> toJson() => {"co": co, "no2": no2};
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  factory Condition.fromJson(Map<String, dynamic> json) =>
      Condition(text: json["text"], icon: json["icon"], code: json["code"]);
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
    forecastday: json["forecastday"] == null
        ? []
        : List<Forecastday>.from(
            json["forecastday"]!.map((x) => Forecastday.fromJson(x)),
          ),
  );
}

class Forecastday {
  DateTime? date;
  int? dateEpoch;
  List<Hour>? hour;

  Forecastday({this.date, this.dateEpoch, this.hour});

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    dateEpoch: json["date_epoch"],
    hour: json["hour"] == null
        ? []
        : List<Hour>.from(json["hour"]!.map((x) => Hour.fromJson(x))),
  );
}

class Hour {
  int? timeEpoch;
  String? time;
  double? tempC;
  Condition? condition;
  int? cloud;

  Hour({this.timeEpoch, this.time, this.tempC, this.condition, this.cloud});

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
    timeEpoch: json["time_epoch"],
    time: json["time"],
    tempC: json["temp_c"]?.toDouble(),
    condition: json["condition"] == null
        ? null
        : Condition.fromJson(json["condition"]),
    cloud: json["cloud"],
  );
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

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    region: json["region"],
    country: json["country"],
    localtimeEpoch: json["localtime_epoch"],
    localtime: json["localtime"],
  );
}
