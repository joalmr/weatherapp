import 'package:weatherapp/features/weather/domain/entities/weather_entities.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getWeather(String location);
}
