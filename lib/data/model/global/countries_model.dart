class CountriesModel {
  CountriesModel({
    List<Country>? data,
  }) {
    _data = data;
  }

  CountriesModel.fromJson(dynamic json) {
    if (json != null) {
      _data = [];
      json.forEach((v) {
        _data?.add(Country.fromJson(v));
      });
    }
  }

  List<Country>? _data;

  List<Country>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map[''] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Country {
  Country({
    String? countryId,
    String? iso2,
    String? shortName,
    String? longName,
    String? iso3,
    String? numCode,
    String? unMember,
    String? callingCode,
    String? cctld,
  }) {
    _countryId = countryId;
    _iso2 = iso2;
    _shortName = shortName;
    _longName = longName;
    _iso3 = iso3;
    _numCode = numCode;
    _unMember = unMember;
    _callingCode = callingCode;
    _cctld = cctld;
  }

  Country.fromJson(dynamic json) {
    _countryId = json['country_id'];
    _iso2 = json['iso2'];
    _shortName = json['short_name'];
    _longName = json['long_name'];
    _iso3 = json['iso3'];
    _numCode = json['numcode'];
    _unMember = json['un_member'];
    _callingCode = json['calling_code'];
    _cctld = json['cctld'];
  }

  String? _countryId;
  String? _iso2;
  String? _shortName;
  String? _longName;
  String? _iso3;
  String? _numCode;
  String? _unMember;
  String? _callingCode;
  String? _cctld;

  String? get countryId => _countryId;
  String? get iso2 => _iso2;
  String? get shortName => _shortName;
  String? get longName => _longName;
  String? get iso3 => _iso3;
  String? get numCode => _numCode;
  String? get unMember => _unMember;
  String? get callingCode => _callingCode;
  String? get cctld => _cctld;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_id'] = _countryId;
    map['iso2'] = _iso2;
    map['short_name'] = _shortName;
    map['long_name'] = _longName;
    map['iso3'] = _iso3;
    map['numcode'] = _numCode;
    map['un_member'] = _unMember;
    map['calling_code'] = _callingCode;
    map['cctld'] = _cctld;
    return map;
  }
}
