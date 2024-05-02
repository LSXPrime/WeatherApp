import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/geolocation_model.dart';
import 'package:weather_app/models/weather/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const BASE_URL = "https://api.open-meteo.com/v1";

  Future<Weather> getWeather(Geolocation city) async {
    final response = await http.get(Uri.parse(
        "$BASE_URL/forecast?latitude=${city.latitude}&longitude=${city.longitude}&current=temperature_2m,relative_humidity_2m,is_day,rain,showers,snowfall,wind_speed_10m,wind_direction_10m,weather_code&daily=temperature_2m_max,temperature_2m_min,weather_code,,rain_sum,wind_speed_10m_max&timezone=auto"));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body), city);
    } else {
      throw Exception("Error getting weather ${response.body}");
    }
  }

  Future<Geolocation> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final url = Uri.parse(
        'https://api.bigdatacloud.net/data/reverse-geocode-client?latitude=$position.latitude&longitude=$position.longitude&localityLanguage=en');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Geolocation.fromJson(jsonDecode(response.body));
    }

    return Future.error("Error getting geolocation");
  }
}
