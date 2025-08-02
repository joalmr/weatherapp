import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/core/constants/colors.dart';
import 'package:weatherapp/core/utils/utils.dart';
import 'package:weatherapp/features/weather/presentation/provider/weather_by_city_provider.dart';
import 'package:weatherapp/features/weather/presentation/widgets/card_weather.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherByCityProvider>();

    TextEditingController searchController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(Icons.arrow_back, color: AppColor.text),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onSubmitted: (value) {
                        if (value.isEmpty) return;
                        provider.fetchWeatherByCity(value);
                      },
                      style: TextStyle(color: AppColor.text),
                      decoration: InputDecoration(
                        hintText: 'Buscar ciudad...',
                        hintStyle: TextStyle(color: AppColor.text),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search, color: AppColor.text),
                          onPressed: () {
                            if (searchController.text.isEmpty) return;
                            provider.fetchWeatherByCity(searchController.text);
                          },
                        ),
                        filled: true,
                        fillColor: AppColor.surface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            provider.weather != null
                ? Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                  height: 100,
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
                                        text: '${provider.weather!.region}\n',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.text,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '${provider.weather!.name}, ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          TextSpan(
                                            text: provider.weather!.country,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
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
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CardWeather(
                                      width:
                                          MediaQuery.sizeOf(context).width *
                                          0.46,
                                      color: Color(0xFFBAE0A6),
                                      assetName: 'assets/leaf.png',
                                      condition:
                                          '${provider.weather!.airQuality} co',
                                      type: 'Calidad del aire',
                                    ),

                                    CardWeather(
                                      width:
                                          MediaQuery.sizeOf(context).width *
                                          0.46,
                                      color: Color(0xFFF9C793),
                                      assetName: 'assets/wind.png',
                                      condition:
                                          '${provider.weather!.windDir} ${provider.weather!.windKph} km/h',
                                      type: 'Viento',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CardWeather(
                                      width:
                                          MediaQuery.sizeOf(context).width *
                                          0.46,
                                      color: Color(0xFFB0E6F4),
                                      assetName: 'assets/drop.png',
                                      condition:
                                          '${provider.weather!.humidity}%',
                                      type: 'Humedad',
                                    ),

                                    CardWeather(
                                      width:
                                          MediaQuery.sizeOf(context).width *
                                          0.46,
                                      color: Color(0xFFCCB3CC),
                                      assetName: 'assets/uv.png',
                                      condition: getUvDescription(
                                        provider.weather!.uv!,
                                      ),
                                      type: 'Riesgo UV',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
