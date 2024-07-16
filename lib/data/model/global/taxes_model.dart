class TaxesModel {
  TaxesModel({
    List<Tax>? data,
  }) {
    _data = data;
  }

  TaxesModel.fromJson(dynamic json) {
    if (json != null) {
      _data = [];
      json.forEach((v) {
        _data?.add(Tax.fromJson(v));
      });
    }
  }

  List<Tax>? _data;

  List<Tax>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map[''] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Tax {
  Tax({
    String? id,
    String? name,
    String? taxRate,
  }) {
    _id = id;
    _name = name;
    _taxRate = taxRate;
  }

  Tax.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _taxRate = json['taxrate'];
  }

  String? _id;
  String? _name;
  String? _taxRate;

  String? get id => _id;
  String? get name => _name;
  String? get taxRate => _taxRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['taxrate'] = _taxRate;
    return map;
  }
}
