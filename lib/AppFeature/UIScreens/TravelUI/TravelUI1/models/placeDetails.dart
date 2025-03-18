

class PlaceDetails {
  final String name;
  final String country;
  final String details;
  final String videoPath;
  final String imagePath;
  final String localimagePath;
  final String blurUrl;

  final String address;
  final String review;
  final String cost;
  final String duration;
  final String temperature;
  final String distance;

  PlaceDetails({
    required this.country,
    required this.details,
    required this.name,
    required this.videoPath,
    required this.imagePath,
    required this.address,
    required this.review,
    required this.cost,
    required this.duration,
    required this.temperature,
    required this.distance,
    required this.localimagePath,
    required this.blurUrl,
  });
}
