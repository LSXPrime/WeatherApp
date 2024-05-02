class Daily {
  final List<String> time;
  final List<double> temperature2mMax;
  final List<double> temperature2mMin;
  final List<int> weatherCode;
  final List<double> rainSum;
  final List<double> windSpeed10mMax;

  Daily({
    required this.time,
    required this.temperature2mMax,
    required this.temperature2mMin,
    required this.weatherCode,
    required this.rainSum,
    required this.windSpeed10mMax,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      time: List<String>.from(json['time']),
      temperature2mMax: List<double>.from(json['temperature_2m_max']),
      temperature2mMin: List<double>.from(json['temperature_2m_min']),
      weatherCode: List<int>.from(json['weather_code']),
      rainSum: List<double>.from(json['rain_sum']),
      windSpeed10mMax: List<double>.from(json['wind_speed_10m_max']),
    );
  }
}
