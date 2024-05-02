class CurrentUnits {
  final String time;
  final String interval;
  final String temperature2m;
  final String isDay;
  final String rain;
  final String showers;
  final String snowfall;
  final String windSpeed10m;
  final String windDirection10m;
  final String weatherCode;
  final String humidity;

  CurrentUnits(
      {required this.time,
      required this.interval,
      required this.temperature2m,
      required this.isDay,
      required this.rain,
      required this.showers,
      required this.snowfall,
      required this.windSpeed10m,
      required this.windDirection10m,
      required this.weatherCode,
      required this.humidity});

  factory CurrentUnits.fromJson(Map<String, dynamic> json) {
    return CurrentUnits(
        time: json['time'] as String,
        interval: json['interval'] as String,
        temperature2m: json['temperature_2m'] as String,
        isDay: json['is_day'] as String,
        rain: json['rain'] as String,
        showers: json['showers'] as String,
        snowfall: json['snowfall'] as String,
        windSpeed10m: json['wind_speed_10m'] as String,
        windDirection10m: json['wind_direction_10m'] as String,
        weatherCode: json['weather_code'] as String,
        humidity: json['relative_humidity_2m'] as String);
  }
}
