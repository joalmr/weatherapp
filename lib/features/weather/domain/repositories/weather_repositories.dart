import 'package:weatherapp/features/weather/domain/entities/weather_entities.dart';
import 'package:weatherapp/features/weather/domain/entities/weather_hour_entities.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getWeather(String location);
  Future<WeatherHourEntity> getWeatherByHour(String location);
}
