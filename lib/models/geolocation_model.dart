class Geolocation {
  final String city;
  final String locality;
  final String country;
  final double latitude;
  final double longitude;

  Geolocation(
      {required this.city,
      required this.locality,
      required this.country,
      required this.latitude,
      required this.longitude});

  factory Geolocation.fromJson(Map<String, dynamic> json) {
    return Geolocation(
      city: json["city"],
      locality: json["locality"],
      country: json["countryName"],
      latitude: json["latitude"],
      longitude: json["longitude"],
    );
  }
}
