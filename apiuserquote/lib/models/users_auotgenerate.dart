import 'users.dart';

class UserAutoGenerate {
  UserAutoGenerate({
    required this.users,
    required this.total,
    required this.skip,
    required this.limit,
  });
  late final List<Users> users;
  late final int total;
  late final dynamic skip;
  late final int limit;

  UserAutoGenerate.fromJson(Map<String, dynamic> json) {
    users = List.from(json['users']).map((e) => Users.fromJson(e)).toList();
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['users'] = users.map((e) => e.toJson()).toList();
    _data['total'] = total;
    _data['skip'] = skip;
    _data['limit'] = limit;
    return _data;
  }
}
