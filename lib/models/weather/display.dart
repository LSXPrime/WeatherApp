class Display {
  final String date;
  final double temperature;
  final double temperatureMin;
  final double temperatureMax;
  final bool isDay;
  final double rain;
  final int humidity;
  final double windSpeed;
  final Map<String, String> state;

  Display(
      {required this.date,
      required this.temperature,
      required this.temperatureMin,
      required this.temperatureMax,
      required this.isDay,
      required this.rain,
      required this.humidity,
      required this.windSpeed,
      required this.state});
}
