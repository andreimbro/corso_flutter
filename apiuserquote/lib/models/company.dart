import 'adress.dart';

class Company {
  Company({
    required this.address,
    required this.department,
    required this.name,
    required this.title,
  });
  late final Address address;
  late final String department;
  late final String name;
  late final String title;

  Company.fromJson(Map<String, dynamic> json) {
    address = Address.fromJson(json['address']);
    department = json['department'];
    name = json['name'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address.toJson();
    _data['department'] = department;
    _data['name'] = name;
    _data['title'] = title;
    return _data;
  }
}
