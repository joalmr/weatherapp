import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:weatherapp/core/constants/colors.dart';
import 'package:weatherapp/core/utils/utils.dart';
import 'package:weatherapp/features/weather/presentation/provider/weather_provider.dart';
import 'package:weatherapp/features/weather/presentation/widgets/card_weather.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();

    return SafeArea(
      child: provider.isLoading
          ? Scaffold(
              body: Shimmer(child: Container(color: AppColor.background)),
            )
          : Scaffold(
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: FloatingActionButton(
                  onPressed: () => context.push('/page'),
                  backgroundColor: AppColor.primary,
                  foregroundColor: AppColor.surface,
                  shape: CircleBorder(),
                  child: Icon(Icons.search),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              body: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: 42,
                              fit: BoxFit.cover,
                              image: AssetImage('assets/logo.png'),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Weather App',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColor.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              height: 145,
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                provider.weather!.condition!.icon!,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${provider.weather!.tempC}°',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.text,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: '${provider.weather!.name}\n',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.text,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '${provider.weather!.region}, ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                        ),
                                      ),
                                      TextSpan(
                                        text: provider.weather!.country,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Image(
                                      height: 16,
                                      image: AssetImage('assets/cloud.png'),
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      getCloudDescription(
                                        provider.weather!.cloud!,
                                      ),
                                      style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w300,
                                        color: AppColor.text,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: CardWeather(
                                  color: Color(0xFFBAE0A6),
                                  assetName: 'assets/leaf.png',
                                  condition:
                                      '${provider.weather!.airQuality} co',
                                  type: 'Calidad del aire',
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: CardWeather(
                                  color: Color(0xFFF9C793),
                                  assetName: 'assets/wind.png',
                                  condition:
                                      '${provider.weather!.windDir} ${provider.weather!.windKph} km/h',
                                  type: 'Viento',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: CardWeather(
                                  color: Color(0xFFB0E6F4),
                                  assetName: 'assets/drop.png',
                                  condition: '${provider.weather!.humidity}%',
                                  type: 'Humedad',
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: CardWeather(
                                  color: Color(0xFFCCB3CC),
                                  assetName: 'assets/uv.png',
                                  condition: getUvDescription(
                                    provider.weather!.uv!,
                                  ),
                                  type: 'Riesgo UV',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
