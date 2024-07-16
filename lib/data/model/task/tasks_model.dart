class TasksModel {
  TasksModel({
    bool? status,
    String? message,
    List<Data>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }
  TasksModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Data>? _data;

  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    String? id,
    String? name,
    String? description,
    String? priority,
    String? dateAdded,
    String? startDate,
    String? dueDate,
    String? dateFinished,
    String? addedFrom,
    String? isAddedFromContact,
    String? status,
    String? recurring,
    String? cycles,
    String? totalCycles,
    String? customRecurring,
    String? relId,
    String? relType,
    String? isPublic,
    String? billable,
    String? billed,
    String? invoiceId,
    String? hourlyRate,
    String? milestone,
    String? kanbanOrder,
    String? milestoneOrder,
    String? visibleToClient,
    String? deadlineNotified,
    String? assigneesIds,
    String? statusName,
    String? addedFromName,
    List<Assignees>? assignees,
    List<FollowersIds>? followersIds,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _priority = priority;
    _dateAdded = dateAdded;
    _startDate = startDate;
    _dueDate = dueDate;
    _dateFinished = dateFinished;
    _addedFrom = addedFrom;
    _isAddedFromContact = isAddedFromContact;
    _status = status;
    _recurring = recurring;
    _cycles = cycles;
    _totalCycles = totalCycles;
    _customRecurring = customRecurring;
    _relId = relId;
    _relType = relType;
    _isPublic = isPublic;
    _billable = billable;
    _billed = billed;
    _invoiceId = invoiceId;
    _hourlyRate = hourlyRate;
    _milestone = milestone;
    _kanbanOrder = kanbanOrder;
    _milestoneOrder = milestoneOrder;
    _visibleToClient = visibleToClient;
    _deadlineNotified = deadlineNotified;
    _assigneesIds = assigneesIds;
    _statusName = statusName;
    _addedFromName = addedFromName;
    _assignees = assignees;
    _followersIds = followersIds;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _priority = json['priority'];
    _dateAdded = json['dateadded'];
    _startDate = json['startdate'];
    _dueDate = json['duedate'];
    _dateFinished = json['datefinished'];
    _addedFrom = json['addedfrom'];
    _isAddedFromContact = json['is_added_from_contact'];
    _status = json['status'];
    _recurring = json['recurring'];
    _cycles = json['cycles'];
    _totalCycles = json['total_cycles'];
    _customRecurring = json['custom_recurring'];
    _relId = json['rel_id'];
    _relType = json['rel_type'];
    _isPublic = json['is_public'];
    _billable = json['billable'];
    _billed = json['billed'];
    _invoiceId = json['invoice_id'];
    _hourlyRate = json['hourly_rate'];
    _milestone = json['milestone'];
    _kanbanOrder = json['kanban_order'];
    _milestoneOrder = json['milestone_order'];
    _visibleToClient = json['visible_to_client'];
    _deadlineNotified = json['deadline_notified'];
    _assigneesIds = json['assignees_ids'];
    _statusName = json['status_name'];
    _addedFromName = json['addedfrom_name'];
    if (json['assignees'] != null) {
      _assignees = [];
      json['assignees'].forEach((v) {
        _assignees?.add(Assignees.fromJson(v));
      });
    }
    if (json['followers_ids'] != null) {
      _followersIds = [];
      json['followers_ids'].forEach((v) {
        _followersIds?.add(FollowersIds.fromJson(v));
      });
    }
  }
  String? _id;
  String? _name;
  String? _description;
  String? _priority;
  String? _dateAdded;
  String? _startDate;
  String? _dueDate;
  String? _dateFinished;
  String? _addedFrom;
  String? _isAddedFromContact;
  String? _status;
  String? _recurring;
  String? _cycles;
  String? _totalCycles;
  String? _customRecurring;
  String? _relId;
  String? _relType;
  String? _isPublic;
  String? _billable;
  String? _billed;
  String? _invoiceId;
  String? _hourlyRate;
  String? _milestone;
  String? _kanbanOrder;
  String? _milestoneOrder;
  String? _visibleToClient;
  String? _deadlineNotified;
  String? _assigneesIds;
  String? _statusName;
  String? _addedFromName;
  List<Assignees>? _assignees;
  List<FollowersIds>? _followersIds;

  String? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get priority => _priority;
  String? get dateAdded => _dateAdded;
  String? get startDate => _startDate;
  String? get dueDate => _dueDate;
  String? get dateFinished => _dateFinished;
  String? get addedFrom => _addedFrom;
  String? get isAddedFromContact => _isAddedFromContact;
  String? get status => _status;
  String? get recurring => _recurring;
  String? get cycles => _cycles;
  String? get totalCycles => _totalCycles;
  String? get customRecurring => _customRecurring;
  String? get relId => _relId;
  String? get relType => _relType;
  String? get isPublic => _isPublic;
  String? get billable => _billable;
  String? get billed => _billed;
  String? get invoiceId => _invoiceId;
  String? get hourlyRate => _hourlyRate;
  String? get milestone => _milestone;
  String? get kanbanOrder => _kanbanOrder;
  String? get milestoneOrder => _milestoneOrder;
  String? get visibleToClient => _visibleToClient;
  String? get deadlineNotified => _deadlineNotified;
  String? get assigneesIds => _assigneesIds;
  String? get statusName => _statusName;
  String? get addedFromName => _addedFromName;
  List<Assignees>? get assignees => _assignees;
  List<FollowersIds>? get followersIds => _followersIds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['priority'] = _priority;
    map['dateadded'] = _dateAdded;
    map['startdate'] = _startDate;
    map['duedate'] = _dueDate;
    map['datefinished'] = _dateFinished;
    map['addedfrom'] = _addedFrom;
    map['is_added_from_contact'] = _isAddedFromContact;
    map['status'] = _status;
    map['recurring'] = _recurring;
    map['cycles'] = _cycles;
    map['total_cycles'] = _totalCycles;
    map['custom_recurring'] = _customRecurring;
    map['rel_id'] = _relId;
    map['rel_type'] = _relType;
    map['is_public'] = _isPublic;
    map['billable'] = _billable;
    map['billed'] = _billed;
    map['invoice_id'] = _invoiceId;
    map['hourly_rate'] = _hourlyRate;
    map['milestone'] = _milestone;
    map['kanban_order'] = _kanbanOrder;
    map['milestone_order'] = _milestoneOrder;
    map['visible_to_client'] = _visibleToClient;
    map['deadline_notified'] = _deadlineNotified;
    map['assignees_ids'] = _assigneesIds;
    map['status_name'] = _statusName;
    map['addedfrom_name'] = _addedFromName;
    if (_assignees != null) {
      map['assignees'] = _assignees?.map((v) => v.toJson()).toList();
    }
    if (_followersIds != null) {
      map['followers_ids'] = _followersIds?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Assignees {
  Assignees({
    String? id,
    String? assigneeId,
    String? assignedFrom,
    String? firstname,
    String? lastname,
    String? fullName,
    String? isAssignedFromContact,
  }) {
    _id = id;
    _assigneeId = assigneeId;
    _assignedFrom = assignedFrom;
    _firstname = firstname;
    _lastname = lastname;
    _fullName = fullName;
    _isAssignedFromContact = isAssignedFromContact;
  }

  Assignees.fromJson(dynamic json) {
    _id = json['id'];
    _assigneeId = json['assigneeid'];
    _assignedFrom = json['assigned_from'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _fullName = json['full_name'];
    _isAssignedFromContact = json['is_assigned_from_contact'];
  }
  String? _id;
  String? _assigneeId;
  String? _assignedFrom;
  String? _firstname;
  String? _lastname;
  String? _fullName;
  String? _isAssignedFromContact;

  String? get id => _id;
  String? get assigneeId => _assigneeId;
  String? get assignedFrom => _assignedFrom;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get fullName => _fullName;
  String? get isAssignedFromContact => _isAssignedFromContact;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['assigneeid'] = _assigneeId;
    map['assigned_from'] = _assignedFrom;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['full_name'] = _fullName;
    map['is_assigned_from_contact'] = _isAssignedFromContact;
    return map;
  }
}

class FollowersIds {
  FollowersIds({
    String? id,
    String? followerId,
    String? fullName,
  }) {
    _id = id;
    _followerId = followerId;
    _fullName = fullName;
  }
  FollowersIds.fromJson(dynamic json) {
    _id = json['id'];
    _followerId = json['followerid'];
    _fullName = json['full_name'];
  }
  String? _id;
  String? _followerId;
  String? _fullName;

  String? get id => _id;
  String? get followerId => _followerId;
  String? get fullName => _fullName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['followerid'] = _followerId;
    map['full_name'] = _fullName;
    return map;
  }
}
