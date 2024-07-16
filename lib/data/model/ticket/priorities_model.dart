class PriorityModel {
  PriorityModel({
    List<Priority>? data,
  }) {
    _data = data;
  }

  PriorityModel.fromJson(dynamic json) {
    if (json != null) {
      _data = [];
      json.forEach((v) {
        _data?.add(Priority.fromJson(v));
      });
    }
  }

  List<Priority>? _data;

  List<Priority>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map[''] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Priority {
  Priority({
    String? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Priority.fromJson(dynamic json) {
    _id = json['priorityid'].toString();
    _name = json['name'];
  }
  String? _id;
  String? _name;

  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['priorityid'] = _id;
    map['name'] = _name;
    return map;
  }
}
