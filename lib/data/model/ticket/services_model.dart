class ServiceModel {
  ServiceModel({
    List<Service>? data,
  }) {
    _data = data;
  }

  ServiceModel.fromJson(dynamic json) {
    if (json != null) {
      _data = [];
      json.forEach((v) {
        _data?.add(Service.fromJson(v));
      });
    }
  }

  List<Service>? _data;

  List<Service>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map[''] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Service {
  Service({
    String? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Service.fromJson(dynamic json) {
    _id = json['serviceid'].toString();
    _name = json['name'];
  }
  String? _id;
  String? _name;

  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceid'] = _id;
    map['name'] = _name;
    return map;
  }
}
