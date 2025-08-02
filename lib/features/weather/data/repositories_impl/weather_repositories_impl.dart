import "package:weatherapp/features/weather/domain/entities/weather_entities.dart";

import "../../domain/repositories/weather_repositories.dart";
import "../datasources/weather_datasources.dart";

class WeatherRepositoriesImpl implements WeatherRepository {
  final WeatherDataSource dataSource;

  WeatherRepositoriesImpl({required this.dataSource});

  @override
  Future<WeatherEntity> getWeather(String location) async {
    return await dataSource.getWeather(location);
  }
}
