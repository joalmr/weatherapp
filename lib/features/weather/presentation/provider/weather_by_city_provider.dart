import 'package:flutter/material.dart';
import 'package:weatherapp/features/weather/domain/entities/weather_hour_entities.dart';
import 'package:weatherapp/features/weather/domain/usecases/weather_usecases.dart';

class WeatherByCityProvider extends ChangeNotifier {
  final WeatherUseCase weatherUseCase;

  WeatherByCityProvider({required this.weatherUseCase});

  WeatherHourEntity? _weather;
  bool _isLoading = false;
  String? _errorMessage;

  WeatherHourEntity? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  fetchWeatherByCity(String cityName) async {
    await fetchCurrentWeather(cityName);
  }

  Future<void> fetchCurrentWeather(String cityName) async {
    _isLoading = true;

    notifyListeners();

    final response = await weatherUseCase.getWeatherByHour(cityName);

    _weather = response;
    _isLoading = false;
    notifyListeners();
  }
}
