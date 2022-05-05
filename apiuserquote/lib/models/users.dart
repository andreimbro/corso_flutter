import 'adress.dart';
import 'bank.dart';
import 'company.dart';
import 'hair.dart';

class Users {
  Users({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.domain,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
  });
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String maidenName;
  late final int age;
  late final String gender;
  late final String email;
  late final String phone;
  late final String username;
  late final String password;
  late final String birthDate;
  late final String image;
  late final String bloodGroup;
  late final int height;
  late final double? weight;
  late final String eyeColor;
  late final Hair hair;
  late final String domain;
  late final String ip;
  late final Address address;
  late final String macAddress;
  late final String university;
  late final Bank bank;
  late final Company company;
  late final String ein;
  late final String ssn;
  late final String userAgent;

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    maidenName = (json['maidenName'] as String);
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    password = json['password'];
    birthDate = json['birthDate'];
    image = json['image'];
    bloodGroup = json['bloodGroup'];
    height = json['height'];
    weight = (json['weight'] as num).toDouble();

    eyeColor = json['eyeColor'];
    hair = Hair.fromJson(json['hair']);
    domain = json['domain'];
    ip = json['ip'];
    address = Address.fromJson(json['address']);
    macAddress = json['macAddress'];
    university = json['university'];
    bank = Bank.fromJson(json['bank']);
    company = Company.fromJson(json['company']);
    ein = json['ein'];
    ssn = json['ssn'];
    userAgent = json['userAgent'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['maidenName'] = maidenName;
    _data['age'] = age;
    _data['gender'] = gender;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['username'] = username;
    _data['password'] = password;
    _data['birthDate'] = birthDate;
    _data['image'] = image;
    _data['bloodGroup'] = bloodGroup;
    _data['height'] = height;
    _data['weight'] = weight;
    _data['eyeColor'] = eyeColor;
    _data['hair'] = hair.toJson();
    _data['domain'] = domain;
    _data['ip'] = ip;
    _data['address'] = address.toJson();
    _data['macAddress'] = macAddress;
    _data['university'] = university;
    _data['bank'] = bank.toJson();
    _data['company'] = company.toJson();
    _data['ein'] = ein;
    _data['ssn'] = ssn;
    _data['userAgent'] = userAgent;
    return _data;
  }
}
