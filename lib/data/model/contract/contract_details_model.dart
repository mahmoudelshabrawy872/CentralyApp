class ContractDetailsModel {
  ContractDetailsModel({
    Data? data,
  }) {
    _data = data;
  }

  ContractDetailsModel.fromJson(dynamic json) {
    _data = json != null ? Data.fromJson(json) : null;
  }
  Data? _data;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map[''] = _data?.toJson();
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
    List<Attachments>? attachments,
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
    _attachments = attachments;
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
    if (json['attachments'] != null) {
      _attachments = [];
      json['attachments'].forEach((v) {
        _attachments?.add(Attachments.fromJson(v));
      });
    }
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
  List<Attachments>? _attachments;

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
  List<Attachments>? get attachments => _attachments;

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
    if (_attachments != null) {
      map['attachments'] = _attachments?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Attachments {
  Attachments({
    String? id,
    String? relId,
    String? relType,
    String? fileName,
    String? fileType,
    String? visibleToCustomer,
    String? attachmentKey,
    String? external,
    String? externalLink,
    String? thumbnailLink,
    String? staffId,
    String? contactId,
    String? taskCommentId,
    String? dateAdded,
  }) {
    _id = id;
    _relId = relId;
    _relType = relType;
    _fileName = fileName;
    _fileType = fileType;
    _visibleToCustomer = visibleToCustomer;
    _attachmentKey = attachmentKey;
    _external = external;
    _externalLink = externalLink;
    _thumbnailLink = thumbnailLink;
    _staffId = staffId;
    _contactId = contactId;
    _taskCommentId = taskCommentId;
    _dateAdded = dateAdded;
  }

  Attachments.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _relId = json['rel_id'];
    _relType = json['rel_type'];
    _fileName = json['file_name'];
    _fileType = json['filetype'];
    _visibleToCustomer = json['visible_to_customer'];
    _attachmentKey = json['attachment_key'];
    _external = json['external'];
    _externalLink = json['external_link'];
    _thumbnailLink = json['thumbnail_link'];
    _staffId = json['staffid'];
    _contactId = json['contact_id'];
    _taskCommentId = json['task_comment_id'];
    _dateAdded = json['dateadded'];
  }
  String? _id;
  String? _relId;
  String? _relType;
  String? _fileName;
  String? _fileType;
  String? _visibleToCustomer;
  String? _attachmentKey;
  String? _external;
  String? _externalLink;
  String? _thumbnailLink;
  String? _staffId;
  String? _contactId;
  String? _taskCommentId;
  String? _dateAdded;

  String? get id => _id;
  String? get relId => _relId;
  String? get relType => _relType;
  String? get fileName => _fileName;
  String? get fileType => _fileType;
  String? get visibleToCustomer => _visibleToCustomer;
  String? get attachmentKey => _attachmentKey;
  String? get external => _external;
  String? get externalLink => _externalLink;
  String? get thumbnailLink => _thumbnailLink;
  String? get staffId => _staffId;
  String? get contactId => _contactId;
  String? get taskCommentId => _taskCommentId;
  String? get dateAdded => _dateAdded;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['rel_id'] = _relId;
    map['rel_type'] = _relType;
    map['file_name'] = _fileName;
    map['filetype'] = _fileType;
    map['visible_to_customer'] = _visibleToCustomer;
    map['attachment_key'] = _attachmentKey;
    map['external'] = _external;
    map['external_link'] = _externalLink;
    map['thumbnail_link'] = _thumbnailLink;
    map['staffid'] = _staffId;
    map['contact_id'] = _contactId;
    map['task_comment_id'] = _taskCommentId;
    map['dateadded'] = _dateAdded;
    return map;
  }
}
