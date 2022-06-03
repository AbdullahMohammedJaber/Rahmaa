class LocationModel {
  double lat;
  double long;

  LocationModel({
    this.lat,
    this.long,
  });
  LocationModel.fromJson(Map<dynamic, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }
  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'long': long,
    };
  }
}
