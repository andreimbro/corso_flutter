import 'coordinates.dart';

class Address {
  Address({
    required this.address,
    required this.city,
    required this.coordinates,
    required this.postalCode,
    required this.state,
  });
  late final String address;
  late final String? city;
  late final Coordinates coordinates;
  late final String postalCode;
  late final String state;

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    coordinates = Coordinates.fromJson(json['coordinates']);
    postalCode = json['postalCode'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address;
    _data['city'] = city;
    _data['coordinates'] = coordinates.toJson();
    _data['postalCode'] = postalCode;
    _data['state'] = state;
    return _data;
  }
}
