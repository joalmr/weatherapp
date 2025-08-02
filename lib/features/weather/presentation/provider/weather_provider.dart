import 'package:flutter/material.dart';
import 'package:weatherapp/features/weather/domain/entities/weather_entities.dart';
import 'package:weatherapp/features/weather/domain/usecases/weather_usecases.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherUseCase weatherUseCase;

  WeatherProvider({required this.weatherUseCase}) {
    fetchCurrentWeather('auto:ip');
  }

  WeatherEntity? _weather;
  bool _isLoading = false;
  String? _errorMessage;

  WeatherEntity? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCurrentWeather(String cityName) async {
    _isLoading = true;

    notifyListeners();

    final response = await weatherUseCase.getWeather(cityName);

    _weather = response;
    _isLoading = false;
    notifyListeners();
  }
}
