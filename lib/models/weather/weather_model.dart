import 'package:weather_app/models/geolocation_model.dart';
import 'current.dart';
import 'currentunits.dart';
import 'daily.dart';
import 'dailyunits.dart';

class Weather {
  final Geolocation location;
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentUnits currentUnits;
  final Current current;
  final DailyUnits dailyUnits;
  final Daily daily;

  Weather({
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
    required this.dailyUnits,
    required this.daily,
  });

  factory Weather.fromJson(Map<String, dynamic> json, Geolocation geolocation) {
    return Weather(
      location: geolocation,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      generationtimeMs: (json['generationtime_ms'] as num?)?.toDouble() ?? 0.0,
      utcOffsetSeconds: json['utc_offset_seconds'] as int? ?? 0,
      timezone: json['timezone'] as String? ?? '',
      timezoneAbbreviation: json['timezone_abbreviation'] as String? ?? '',
      elevation: (json['elevation'] as num?)?.toDouble() ?? 0.0,
      currentUnits: CurrentUnits.fromJson(json['current_units']),
      current: Current.fromJson(json['current']),
      dailyUnits: DailyUnits.fromJson(json['daily_units']),
      daily: Daily.fromJson(json['daily']),
    );
  }

  Map<String, String> getWeatherCondition(int wmoCode) {
    switch (wmoCode) {
      case 0:
        return {"condition": "Clear", "path": "assets/sunny.json"};
      case 1:
        return {"condition": "Partly cloudy", "path": "assets/cloudy.json"};
      case 2:
        return {"condition": "Cloudy", "path": "assets/cloudy.json"};
      case 3:
        return {"condition": "Overcast", "path": "assets/cloudy.json"};
      case 4:
        return {"condition": "Fog", "path": "assets/thunder.json"};
      case 5:
        return {"condition": "Freezing fog", "path": "assets/thunder.json"};
      case 10:
        return {"condition": "Shower of rain", "path": "assets/rains.json"};
      case 11:
        return {"condition": "Rain", "path": "assets/rains.json"};
      case 12:
        return {
          "condition": "Thunderstorm",
          "path": "assets/heavy rain and thunder.json"
        };
      case 18:
        return {"condition": "Freezing rain", "path": "assets/rains.json"};
      case 20:
        return {"condition": "Shower of snow", "path": "assets/cloudy.json"};
      case 21:
        return {"condition": "Snow", "path": "assets/cloudy.json"};
      case 22:
        return {
          "condition": "Shower of snow pellets/grains",
          "path": "assets/cloudy.json"
        };
      case 23:
        return {
          "condition": "Snow pellets/grains",
          "path": "assets/cloudy.json"
        };
      case 24:
        return {"condition": "Shower of hail", "path": "assets/cloudy.json"};
      case 25:
        return {"condition": "Hail", "path": "assets/cloudy.json"};
      case 26:
        return {
          "condition": "Shower of hail pellets/grains",
          "path": "assets/cloudy.json"
        };
      case 27:
        return {
          "condition": "Hail pellets/grains",
          "path": "assets/cloudy.json"
        };
      case 28:
        return {
          "condition": "Shower of small hail/snow pellets",
          "path": "assets/cloudy.json"
        };
      case 29:
        return {
          "condition": "Small hail/snow pellets",
          "path": "assets/cloudy.json"
        };
      case 30:
        return {"condition": "Mist", "path": "assets/cloudy.json"};
      case 31:
        return {"condition": "Patchy light rain", "path": "assets/rains.json"};
      case 32:
        return {
          "condition": "Patchy moderate rain",
          "path": "assets/rains.json"
        };
      case 33:
        return {
          "condition": "Patchy heavy rain",
          "path": "assets/heavy rain and thunder.json"
        };
      case 34:
        return {"condition": "Patchy light snow", "path": "assets/cloudy.json"};
      case 35:
        return {
          "condition": "Patchy moderate snow",
          "path": "assets/cloudy.json"
        };
      case 36:
        return {"condition": "Patchy heavy snow", "path": "assets/cloudy.json"};
      case 37:
        return {
          "condition": "Patchy light sleet",
          "path": "assets/cloudy.json"
        };
      case 38:
        return {
          "condition": "Patchy moderate sleet",
          "path": "assets/cloudy.json"
        };
      case 39:
        return {
          "condition": "Patchy heavy sleet",
          "path": "assets/cloudy.json"
        };
      case 40:
        return {
          "condition": "Patchy light snow grains",
          "path": "assets/cloudy.json"
        };
      case 41:
        return {
          "condition": "Patchy moderate snow grains",
          "path": "assets/cloudy.json"
        };
      case 42:
        return {
          "condition": "Patchy heavy snow grains",
          "path": "assets/cloudy.json"
        };
      case 43:
        return {
          "condition": "Patchy light snow with thunder",
          "path": "assets/thunder.json"
        };
      case 44:
        return {
          "condition": "Patchy moderate snow with thunder",
          "path": "assets/thunder.json"
        };
      case 45:
        return {
          "condition": "Patchy heavy snow with thunder",
          "path": "assets/thunder.json"
        };
      case 46:
        return {
          "condition": "Patchy light freezing drizzle",
          "path": "assets/cloudy.json"
        };
      case 47:
        return {
          "condition": "Patchy moderate freezing drizzle",
          "path": "assets/cloudy.json"
        };
      case 48:
        return {
          "condition": "Patchy heavy freezing drizzle",
          "path": "assets/cloudy.json"
        };
      case 50:
        return {"condition": "Blowing snow", "path": "assets/cloudy.json"};
      case 51:
        return {"condition": "Blizzard", "path": "assets/cloudy.json"};
      case 52:
        return {"condition": "Fog", "path": "assets/thunder.json"};
      case 53:
        return {"condition": "Freezing fog", "path": "assets/thunder.json"};
      case 54:
        return {"condition": "Drizzle", "path": "assets/rains.json"};
      case 55:
        return {"condition": "Freezing drizzle", "path": "assets/rains.json"};
      case 56:
        return {
          "condition": "Thunderstorm (with or without precipitation)",
          "path": "assets/heavy rain and thunder.json"
        };
      default:
        return {"condition": "Unknown", "path": "assets/cloudy.json"};
    }
  }
}
