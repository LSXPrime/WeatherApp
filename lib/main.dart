import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/weather_page.dart';

import 'services/weather_service.dart';
import 'viewmodels/weather_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => WeatherService()),
        ChangeNotifierProvider(
            create: (context) =>
                WeatherViewModel(context.read<WeatherService>())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}
