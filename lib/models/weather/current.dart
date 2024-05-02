class Current {
  final String time;
  final int interval;
  final double temperature2m;
  final int isDay;
  final double rain;
  final double showers;
  final double snowfall;
  final double windSpeed10m;
  final int windDirection10m;
  final int weatherCode;
  final int relativeHumidity2m;

  Current({
    required this.time,
    required this.interval,
    required this.temperature2m,
    required this.isDay,
    required this.rain,
    required this.showers,
    required this.snowfall,
    required this.windSpeed10m,
    required this.windDirection10m,
    required this.weatherCode,
    required this.relativeHumidity2m,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      time: json['time'] as String,
      interval: json['interval'] as int,
      temperature2m: json['temperature_2m'] as double,
      isDay: json['is_day'] as int,
      rain: json['rain'] as double,
      showers: json['showers'] as double,
      snowfall: json['snowfall'] as double,
      windSpeed10m: json['wind_speed_10m'] as double,
      windDirection10m: json['wind_direction_10m'] as int,
      weatherCode: json['weather_code'] as int,
      relativeHumidity2m: json['relative_humidity_2m'] as int,
    );
  }
}
