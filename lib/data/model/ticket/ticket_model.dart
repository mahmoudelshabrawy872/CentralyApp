class TicketsModel {
  TicketsModel({
    List<Data>? data,
  }) {
    _data = data;
  }

  TicketsModel.fromJson(dynamic json) {
    if (json != null) {
      _data = [];
      json.forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? _data;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map[''] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    String? id,
    String? userId,
    String? name,
    String? email,
    String? subject,
    String? message,
    String? ticketKey,
    String? projectId,
    String? projectName,
    String? lastReply,
    String? clientRead,
    String? adminRead,
    String? assigned,
    String? dateCreated,
    String? company,
    String? profileImage,
    String? department,
    String? departmentName,
    String? priority,
    String? priorityName,
    String? service,
    String? serviceName,
    String? status,
    String? statusName,
    String? statusColor,
    String? userFirstName,
    String? userLastName,
    String? staffFirstName,
    String? staffLastName,
  }) {
    _id = id;
    _userId = userId;
    _name = name;
    _email = email;
    _subject = subject;
    _message = message;
    _ticketKey = ticketKey;
    _projectId = projectId;
    _projectName = projectName;
    _lastReply = lastReply;
    _clientRead = clientRead;
    _adminRead = adminRead;
    _assigned = assigned;
    _dateCreated = dateCreated;
    _company = company;
    _profileImage = profileImage;
    _department = department;
    _departmentName = departmentName;
    _priority = priority;
    _priorityName = priorityName;
    _service = service;
    _serviceName = serviceName;
    _status = status;
    _statusName = statusName;
    _statusColor = statusColor;
    _userFirstName = userFirstName;
    _userLastName = userLastName;
    _staffFirstName = staffFirstName;
    _staffLastName = staffLastName;
  }

  Data.fromJson(dynamic json) {
    _id = json['ticketid'];
    _userId = json['userid'];
    _name = json['name'];
    _email = json['email'];
    _subject = json['subject'];
    _message = json['message'];
    _ticketKey = json['ticketkey'];
    _projectId = json['priorityid'];
    _projectName = json['project_name'];
    _lastReply = json['lastreply'];
    _clientRead = json['clientread'];
    _adminRead = json['adminread'];
    _assigned = json['assigned'];
    _dateCreated = json['date'];
    _company = json['company'];
    _profileImage = json['profile_image'];
    _department = json['department'];
    _departmentName = json['department_name'];
    _priority = json['priority'];
    _priorityName = json['priority_name'];
    _service = json['service'];
    _serviceName = json['service_name'];
    _status = json['status'];
    _statusName = json['status_name'];
    _statusColor = json['statuscolor'];
    _userFirstName = json['user_firstname'];
    _userLastName = json['user_lastname'];
    _staffFirstName = json['staff_firstname'];
    _staffLastName = json['staff_lastname'];
  }

  String? _id;
  String? _userId;
  String? _name;
  String? _email;
  String? _subject;
  String? _message;
  String? _ticketKey;
  String? _projectId;
  String? _projectName;
  String? _lastReply;
  String? _clientRead;
  String? _adminRead;
  String? _assigned;
  String? _dateCreated;
  String? _company;
  String? _profileImage;
  String? _department;
  String? _departmentName;
  String? _priority;
  String? _priorityName;
  String? _service;
  String? _serviceName;
  String? _status;
  String? _statusName;
  String? _statusColor;
  String? _userFirstName;
  String? _userLastName;
  String? _staffFirstName;
  String? _staffLastName;

  String? get id => _id;
  String? get userId => _userId;
  String? get name => _name;
  String? get email => _email;
  String? get subject => _subject;
  String? get message => _message;
  String? get ticketKey => _ticketKey;
  String? get projectId => _projectId;
  String? get projectName => _projectName;
  String? get lastReply => _lastReply;
  String? get clientRead => _clientRead;
  String? get adminRead => _adminRead;
  String? get assigned => _assigned;
  String? get dateCreated => _dateCreated;
  String? get company => _company;
  String? get profileImage => _profileImage;
  String? get department => _department;
  String? get departmentName => _departmentName;
  String? get priority => _priority;
  String? get priorityName => _priorityName;
  String? get service => _service;
  String? get serviceName => _serviceName;
  String? get status => _status;
  String? get statusName => _statusName;
  String? get statusColor => _statusColor;
  String? get userFirstName => _userFirstName;
  String? get userLastName => _userLastName;
  String? get staffFirstName => _staffFirstName;
  String? get staffLastName => _staffLastName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ticketid'] = _id;
    map['userid'] = _userId;
    map['name'] = _name;
    map['email'] = _email;
    map['subject'] = _subject;
    map['message'] = _message;
    map['ticketkey'] = _ticketKey;
    map['priorityid'] = _projectId;
    map['project_name'] = _projectName;
    map['lastreply'] = _lastReply;
    map['clientread'] = _clientRead;
    map['adminread'] = _adminRead;
    map['assigned'] = _assigned;
    map['date'] = _dateCreated;
    map['company'] = _company;
    map['profile_image'] = _profileImage;
    map['department'] = _department;
    map['department_name'] = _departmentName;
    map['priority'] = _priority;
    map['priority_name'] = _priorityName;
    map['service'] = _service;
    map['service_name'] = _serviceName;
    map['status'] = _status;
    map['status_name'] = _statusName;
    map['statuscolor'] = _statusColor;
    map['user_firstname'] = _userFirstName;
    map['user_lastname'] = _userLastName;
    map['staff_firstname'] = _staffFirstName;
    map['staff_lastname'] = _staffLastName;
    return map;
  }
}
