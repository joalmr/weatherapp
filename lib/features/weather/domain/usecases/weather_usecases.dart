import "package:weatherapp/features/weather/domain/entities/weather_entities.dart";

import "../repositories/weather_repositories.dart";

class WeatherUseCase {
  final WeatherRepository repository;

  WeatherUseCase({required this.repository});

  Future<WeatherEntity> getWeather(String location) async {
    return await repository.getWeather(location);
  }
}
