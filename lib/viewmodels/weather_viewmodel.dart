import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather/display.dart';
import '../models/weather/weather_model.dart';
import '../services/weather_service.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherService _weatherService;
  Weather? _weather;
  Weather? get weather => _weather;
  Display? _display;
  Display? get display => _display;

  WeatherViewModel(this._weatherService) {
    _fetchWeather();
  }

  void _fetchWeather() async {
    final city = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(city);
      _weather = weather;
      _display = getDisplay();
      notifyListeners();
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Map<String, String> getWeatherCondition(
      {int weatherCode = 0, bool override = false}) {
    return _weather?.getWeatherCondition(
            override ? weatherCode : _weather!.current.weatherCode) ??
        {"condition": "Clear", "path": "assets/rains.json"};
  }

  String getFormattedDate(DateTime date) {
    return DateFormat('EEEE, d MMMM').format(date);
  }

  Display? getDisplay({bool override = false, int day = 0}) {
    if (weather == null) return null;

    if (override == false || day == 0) {
      return Display(
          date: getFormattedDate(DateTime.now()),
          temperature: weather!.current.temperature2m,
          temperatureMin: weather!.daily.temperature2mMin.first,
          temperatureMax: weather!.daily.temperature2mMax.first,
          isDay: weather!.current.isDay == 1,
          rain: weather!.current.rain,
          humidity: weather!.current.relativeHumidity2m,
          windSpeed: weather!.current.windSpeed10m,
          state: getWeatherCondition(
              weatherCode: weather!.current.weatherCode, override: true));
    }

    return Display(
        date: getFormattedDate(DateTime.parse(weather!.daily.time[day])),
        temperature: (weather!.daily.temperature2mMin[day] +
                weather!.daily.temperature2mMax[day]) /
            2,
        temperatureMin: weather!.daily.temperature2mMin[day],
        temperatureMax: weather!.daily.temperature2mMax[day],
        isDay: true,
        rain: weather!.daily.rainSum[day],
        humidity: 0,
        windSpeed: weather!.daily.windSpeed10mMax[day],
        state: getWeatherCondition(
            weatherCode: weather!.daily.weatherCode[day], override: true));
  }

  void changeDay(int day) {
    _display = getDisplay(override: true, day: day);
    notifyListeners();
  }
}
