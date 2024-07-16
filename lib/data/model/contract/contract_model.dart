class ContractsModel {
  ContractsModel({
    List<Data>? data,
  }) {
    _data = data;
  }

  ContractsModel.fromJson(dynamic json) {
    _data = [];
    json.forEach((v) {
      _data?.add(Data.fromJson(v));
    });
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
    String? content,
    String? description,
    String? subject,
    String? client,
    String? dateStart,
    String? dateEnd,
    String? contractType,
    String? projectId,
    String? addedFrom,
    String? dateAdded,
    String? isExpiryNotified,
    String? contractValue,
    String? trash,
    String? notVisibleToClient,
    String? signed,
    String? markedAsSigned,
    String? signature,
    String? name,
    String? userId,
    String? company,
    String? typeName,
  }) {
    _id = id;
    _content = content;
    _description = description;
    _subject = subject;
    _client = client;
    _dateStart = dateStart;
    _dateEnd = dateEnd;
    _contractType = contractType;
    _projectId = projectId;
    _addedFrom = addedFrom;
    _dateAdded = dateAdded;
    _isExpiryNotified = isExpiryNotified;
    _contractValue = contractValue;
    _trash = trash;
    _notVisibleToClient = notVisibleToClient;
    _signed = signed;
    _markedAsSigned = markedAsSigned;
    _signature = signature;
    _name = name;
    _userId = userId;
    _company = company;
    _typeName = typeName;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _content = json['content'];
    _description = json['description'];
    _subject = json['subject'];
    _client = json['client'];
    _dateStart = json['datestart'];
    _dateEnd = json['dateend'];
    _contractType = json['contract_type'];
    _projectId = json['project_id'];
    _addedFrom = json['addedfrom'];
    _dateAdded = json['dateadded'];
    _isExpiryNotified = json['isexpirynotified'];
    _contractValue = json['contract_value'];
    _trash = json['trash'];
    _notVisibleToClient = json['not_visible_to_client'];
    _signed = json['signed'];
    _markedAsSigned = json['marked_as_signed'];
    _signature = json['signature'];
    _name = json['name'];
    _userId = json['userid'];
    _company = json['company'];
    _typeName = json['type_name'];
  }

  String? _id;
  String? _content;
  String? _description;
  String? _subject;
  String? _client;
  String? _dateStart;
  String? _dateEnd;
  String? _contractType;
  String? _projectId;
  String? _addedFrom;
  String? _dateAdded;
  String? _isExpiryNotified;
  String? _contractValue;
  String? _trash;
  String? _notVisibleToClient;
  String? _signed;
  String? _markedAsSigned;
  String? _signature;
  String? _name;
  String? _userId;
  String? _company;
  String? _typeName;

  String? get id => _id;
  String? get content => _content;
  String? get description => _description;
  String? get subject => _subject;
  String? get client => _client;
  String? get dateStart => _dateStart;
  String? get dateEnd => _dateEnd;
  String? get contractType => _contractType;
  String? get projectId => _projectId;
  String? get addedFrom => _addedFrom;
  String? get dateAdded => _dateAdded;
  String? get isExpiryNotified => _isExpiryNotified;
  String? get contractValue => _contractValue;
  String? get trash => _trash;
  String? get notVisibleToClient => _notVisibleToClient;
  String? get signed => _signed;
  String? get markedAsSigned => _markedAsSigned;
  String? get signature => _signature;
  String? get name => _name;
  String? get userId => _userId;
  String? get company => _company;
  String? get typeName => _typeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['content'] = _content;
    map['description'] = _description;
    map['subject'] = _subject;
    map['client'] = _client;
    map['datestart'] = _dateStart;
    map['dateend'] = _dateEnd;
    map['contract_type'] = _contractType;
    map['project_id'] = _projectId;
    map['addedfrom'] = _addedFrom;
    map['dateadded'] = _dateAdded;
    map['isexpirynotified'] = _isExpiryNotified;
    map['contract_value'] = _contractValue;
    map['trash'] = _trash;
    map['not_visible_to_client'] = _notVisibleToClient;
    map['signed'] = _signed;
    map['marked_as_signed'] = _markedAsSigned;
    map['signature'] = _signature;
    map['name'] = _name;
    map['userid'] = _userId;
    map['company'] = _company;
    map['type_name'] = _typeName;
    return map;
  }
}
