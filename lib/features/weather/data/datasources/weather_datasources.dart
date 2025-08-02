import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:weatherapp/features/weather/data/models/weather_models.dart';

abstract class WeatherDataSource {
  Future<WeatherModel> getWeather(String location);
}

class WeatherDataSourceImpl implements WeatherDataSource {
  final Dio dio = Dio();

  @override
  Future<WeatherModel> getWeather(String location) async {
    final response = await dio.get(
      'http://api.weatherapi.com/v1/current.json?key=${dotenv.env['WEATHER_KEY']!}&q=$location&aqi=yes',
    );

    Logger().d(response.data);
    return WeatherModel.fromJson(response.data);
  }
}
