class TaskCreateModel {
  TaskCreateModel({
    bool? status,
    String? message,
    TaskData? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  TaskCreateModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? TaskData.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  TaskData? _data;

  bool? get status => _status;
  String? get message => _message;
  TaskData? get data => _data;

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

class TaskData {
  TaskData({
    List<Priority>? priority,
    List<ProjectMembers>? projectMembers,
  }) {
    _priority = priority;
    _projectMembers = projectMembers;
  }

  TaskData.fromJson(dynamic json) {
    if (json['priority'] != null) {
      _priority = [];
      json['priority'].forEach((v) {
        _priority?.add(Priority.fromJson(v));
      });
    }
    if (json['project_members'] != null) {
      _projectMembers = [];
      json['project_members'].forEach((v) {
        _projectMembers?.add(ProjectMembers.fromJson(v));
      });
    }
  }

  List<Priority>? _priority;
  List<ProjectMembers>? _projectMembers;

  List<Priority>? get priority => _priority;
  List<ProjectMembers>? get projectMembers => _projectMembers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_priority != null) {
      map['priority'] = _priority?.map((v) => v.toJson()).toList();
    }
    if (_projectMembers != null) {
      map['project_members'] = _projectMembers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Priority {
  Priority({
    String? id,
    String? name,
    String? color,
  }) {
    _id = id;
    _name = name;
    _color = color;
  }

  Priority.fromJson(dynamic json) {
    _id = json['id'].toString();
    _name = json['name'];
    _color = json['color'];
  }
  String? _id;
  String? _name;
  String? _color;

  String? get id => _id;
  String? get name => _name;
  String? get color => _color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['color'] = _color;
    return map;
  }
}

class ProjectMembers {
  ProjectMembers({
    String? staffId,
    String? staffFirstName,
    String? staffLastName,
    String? email,
    String? projectId,
  }) {
    _staffId = staffId;
    _staffFirstName = staffFirstName;
    _staffLastName = staffLastName;
    _email = email;
    _projectId = projectId;
  }

  ProjectMembers.fromJson(dynamic json) {
    _staffId = json['staff_id'];
    _staffFirstName = json['firstname'].toString();
    _staffLastName = json['lastname'].toString();
    _email = json['email'].toString();
    _projectId = json['project_id'];
  }
  String? _staffId;
  String? _staffFirstName;
  String? _staffLastName;
  String? _email;
  String? _projectId;

  String? get staffId => _staffId;
  String? get staffFirstName => _staffFirstName;
  String? get staffLastName => _staffLastName;
  String? get email => _email;
  String? get projectId => _projectId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['staff_id'] = _staffId;
    map['firstname'] = _staffFirstName;
    map['lastname'] = _staffLastName;
    map['email'] = _email;
    map['project_id'] = _projectId;
    return map;
  }
}
