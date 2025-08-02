import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
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
                      textCapitalization: TextCapitalization.sentences,
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
            provider.isLoading
                ? Expanded(
                    child: Shimmer(
                      child: Container(color: AppColor.background),
                    ),
                  )
                : provider.weather != null
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
                                    provider.weather!.current!.condition!.icon!,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${provider.weather!.current!.tempC}°',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.text,
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text:
                                            '${provider.weather!.location!.name}\n',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.text,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                '${provider.weather!.location!.region}, ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          TextSpan(
                                            text: provider
                                                .weather!
                                                .location!
                                                .country,
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
                                            provider.weather!.current!.cloud!,
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
                          Container(
                            height: 95,
                            margin: EdgeInsets.all(4),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: provider
                                  .weather!
                                  .forecast!
                                  .forecastday!
                                  .first
                                  .hour!
                                  .length,
                              itemBuilder: (BuildContext context, int index) {
                                final data = provider
                                    .weather!
                                    .forecast!
                                    .forecastday!
                                    .first
                                    .hour!
                                    .elementAt(index);
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  padding: EdgeInsets.all(4),
                                  height: 95,
                                  width: 54,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.surface,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(data.time!.split(' ')[1]),
                                      Image(
                                        image: NetworkImage(
                                          data.condition!.icon!,
                                        ),
                                      ),
                                      Text('${data.tempC}°'),
                                    ],
                                  ),
                                );
                              },
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
                                          '${provider.weather!.current!.airQuality!.co} co',
                                      type: 'Calidad del aire',
                                    ),

                                    CardWeather(
                                      width:
                                          MediaQuery.sizeOf(context).width *
                                          0.46,
                                      color: Color(0xFFF9C793),
                                      assetName: 'assets/wind.png',
                                      condition:
                                          '${provider.weather!.current!.windDir} ${provider.weather!.current!.windKph} km/h',
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
                                          '${provider.weather!.current!.humidity}%',
                                      type: 'Humedad',
                                    ),

                                    CardWeather(
                                      width:
                                          MediaQuery.sizeOf(context).width *
                                          0.46,
                                      color: Color(0xFFCCB3CC),
                                      assetName: 'assets/uv.png',
                                      condition: getUvDescription(
                                        provider.weather!.current!.uv!,
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
