class Hair {
  Hair({
    required this.color,
    required this.type,
  });
  late final String color;
  late final String type;

  Hair.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['color'] = color;
    _data['type'] = type;
    return _data;
  }
}
