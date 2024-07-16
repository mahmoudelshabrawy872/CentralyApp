class RegistrationResponseModel {
  RegistrationResponseModel({
    bool? status,
    String? message,
  }) {
    _status = status;
    _message = message;
  }

  RegistrationResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'].toString();
  }
  bool? _status;
  String? _message;

  bool? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }
}
