class LoginResponseModel {
  LoginResponseModel({
    bool? status,
    String? message,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  LoginResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'].toString();
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;

  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    String? accessToken,
    String? session,
    Staff? staff,
  }) {
    _accessToken = accessToken;
    _session = session;
    _staff = staff;
  }

  Data.fromJson(dynamic json) {
    _accessToken = json['token'];
    _session = json['session'];
    _staff = Staff.fromJson(json['staff']);
  }
  String? _accessToken;
  String? _session;
  Staff? _staff;

  String? get accessToken => _accessToken;
  String? get session => _session;
  Staff? get staff => _staff;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _accessToken;
    map['session'] = _session;
    if (_staff != null) {
      map['staff'] = _staff?.toJson();
    }
    return map;
  }
}

class Staff {
  Staff({
    String? staffId,
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImage,
    String? facebook,
    String? linkedin,
    String? skype,
    String? admin,
    String? role,
    String? defaultLanguage,
    String? isNotStaff,
    String? hourlyRate,
    String? dateCreated,
    String? active,
  }) {
    _staffId = staffId;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _phoneNumber = phoneNumber;
    _profileImage = profileImage;
    _facebook = facebook;
    _linkedin = linkedin;
    _skype = skype;
    _admin = admin;
    _role = role;
    _defaultLanguage = defaultLanguage;
    _isNotStaff = isNotStaff;
    _hourlyRate = hourlyRate;
    _dateCreated = dateCreated;
    _active = active;
  }

  Staff.fromJson(Map<String, dynamic> json) {
    _staffId = json['staffid'];
    _email = json['email'];
    _firstName = json['firstname'];
    _lastName = json['lastname'];
    _phoneNumber = json['phonenumber'];
    _profileImage = json['profile_image'];
    _facebook = json['facebook'];
    _linkedin = json['linkedin'];
    _skype = json['skype'];
    _admin = json['admin'];
    _role = json['role'];
    _defaultLanguage = json['default_language'];
    _isNotStaff = json['is_not_staff'];
    _hourlyRate = json['hourly_rate'];
    _dateCreated = json['datecreated'];
    _active = json['active'];
  }

  String? _staffId;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _phoneNumber;
  String? _profileImage;
  String? _facebook;
  String? _linkedin;
  String? _skype;
  String? _admin;
  String? _role;
  String? _defaultLanguage;
  String? _isNotStaff;
  String? _hourlyRate;
  String? _dateCreated;
  String? _active;

  String? get staffId => _staffId;
  String? get email => _email;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get phoneNumber => _phoneNumber;
  String? get profileImage => _profileImage;
  String? get facebook => _facebook;
  String? get linkedin => _linkedin;
  String? get skype => _skype;
  String? get admin => _admin;
  String? get role => _role;
  String? get defaultLanguage => _defaultLanguage;
  String? get isNotStaff => _isNotStaff;
  String? get hourlyRate => _hourlyRate;
  String? get dateCreated => _dateCreated;
  String? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['staffid'] = _staffId;
    map['email'] = _email;
    map['firstname'] = _firstName;
    map['lastname'] = _lastName;
    map['phonenumber'] = _phoneNumber;
    map['profile_image'] = _profileImage;
    map['facebook'] = _facebook;
    map['linkedin'] = _linkedin;
    map['skype'] = _skype;
    map['admin'] = _admin;
    map['role'] = _role;
    map['default_language'] = _defaultLanguage;
    map['is_not_staff'] = _isNotStaff;
    map['hourly_rate'] = _hourlyRate;
    map['datecreated'] = _dateCreated;
    map['active'] = _active;
    return map;
  }
}
