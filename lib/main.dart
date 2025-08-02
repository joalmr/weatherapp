import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/core/routes/routes.dart';
import 'package:weatherapp/core/theme/theme.dart';
import 'package:weatherapp/features/weather/data/datasources/weather_datasources.dart';
import 'package:weatherapp/features/weather/data/repositories_impl/weather_repositories_impl.dart';
import 'package:weatherapp/features/weather/domain/usecases/weather_usecases.dart';
import 'package:weatherapp/features/weather/presentation/provider/weather_by_city_provider.dart';
import 'package:weatherapp/features/weather/presentation/provider/weather_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(
            weatherUseCase: WeatherUseCase(
              repository: WeatherRepositoriesImpl(
                dataSource: WeatherDataSourceImpl(),
              ),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => WeatherByCityProvider(
            weatherUseCase: WeatherUseCase(
              repository: WeatherRepositoriesImpl(
                dataSource: WeatherDataSourceImpl(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: themeData,
        routerConfig: appRouter,
      ),
    );
  }
}
