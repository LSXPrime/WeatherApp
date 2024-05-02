class DailyUnits {
  final String time;
  final String temperature2mMax;
  final String temperature2mMin;
  final String weatherCode;
  final String rainSum;
  final String windSpeed10mMax;

  DailyUnits({
    required this.time,
    required this.temperature2mMax,
    required this.temperature2mMin,
    required this.weatherCode,
    required this.rainSum,
    required this.windSpeed10mMax,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) {
    return DailyUnits(
      time: json['time'] as String,
      temperature2mMax: json['temperature_2m_max'] as String,
      temperature2mMin: json['temperature_2m_min'] as String,
      weatherCode: json['weather_code'] as String,
      rainSum: json['rain_sum'] as String,
      windSpeed10mMax: json['wind_speed_10m_max'] as String,
    );
  }
}
