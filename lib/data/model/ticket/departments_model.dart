class DepartmentModel {
  DepartmentModel({
    List<Department>? data,
  }) {
    _data = data;
  }

  DepartmentModel.fromJson(dynamic json) {
    if (json != null) {
      _data = [];
      json.forEach((v) {
        _data?.add(Department.fromJson(v));
      });
    }
  }

  List<Department>? _data;

  List<Department>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map[''] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Department {
  Department({
    String? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Department.fromJson(dynamic json) {
    _id = json['departmentid'].toString();
    _name = json['name'];
  }
  String? _id;
  String? _name;

  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['departmentid'] = _id;
    map['name'] = _name;
    return map;
  }
}
