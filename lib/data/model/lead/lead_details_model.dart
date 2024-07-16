class LeadDetailsModel {
  LeadDetailsModel({
    Data? data,
  }) {
    _data = data;
  }

  LeadDetailsModel.fromJson(dynamic json) {
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
    String? hash,
    String? name,
    String? title,
    String? company,
    String? description,
    String? country,
    String? zip,
    String? city,
    String? state,
    String? address,
    String? assigned,
    String? dateAdded,
    String? fromFormId,
    String? status,
    String? source,
    String? lastContact,
    String? dateAssigned,
    String? lastStatusChange,
    String? addedFrom,
    String? email,
    String? website,
    String? leadOrder,
    String? phoneNumber,
    String? dateConverted,
    String? lost,
    String? junk,
    String? lastLeadStatus,
    String? isImportedFromEmailIntegration,
    String? emailIntegrationUid,
    String? isPublic,
    String? defaultLanguage,
    String? clientId,
    String? leadValue,
    String? vat,
    String? statusOrder,
    String? color,
    String? isDefault,
    String? statusName,
    String? sourceName,
    String? publicUrl,
    List<Attachments>? attachments,
    List<CustomField>? customFields,
  }) {
    _id = id;
    _hash = hash;
    _name = name;
    _title = title;
    _company = company;
    _description = description;
    _country = country;
    _zip = zip;
    _city = city;
    _state = state;
    _address = address;
    _assigned = assigned;
    _dateAdded = dateAdded;
    _fromFormId = fromFormId;
    _status = status;
    _source = source;
    _lastContact = lastContact;
    _dateAssigned = dateAssigned;
    _lastStatusChange = lastStatusChange;
    _addedFrom = addedFrom;
    _email = email;
    _website = website;
    _leadOrder = leadOrder;
    _phoneNumber = phoneNumber;
    _dateConverted = dateConverted;
    _lost = lost;
    _junk = junk;
    _lastLeadStatus = lastLeadStatus;
    _isImportedFromEmailIntegration = isImportedFromEmailIntegration;
    _emailIntegrationUid = emailIntegrationUid;
    _isPublic = isPublic;
    _defaultLanguage = defaultLanguage;
    _clientId = clientId;
    _leadValue = leadValue;
    _vat = vat;
    _statusOrder = statusOrder;
    _color = color;
    _isDefault = isDefault;
    _statusName = statusName;
    _sourceName = sourceName;
    _publicUrl = publicUrl;
    _attachments = attachments;
    _customFields = customFields;
  }
  Data.fromJson(dynamic json) {
    _id = json['id'];
    _hash = json['hash'];
    _name = json['name'];
    _title = json['title'];
    _company = json['company'];
    _description = json['description'];
    _country = json['country'];
    _zip = json['zip'];
    _city = json['city'];
    _state = json['state'];
    _address = json['address'];
    _assigned = json['assigned'];
    _dateAdded = json['dateadded'];
    _fromFormId = json['from_form_id'];
    _status = json['status'];
    _source = json['source'];
    _lastContact = json['lastcontact'];
    _dateAssigned = json['dateassigned'];
    _lastStatusChange = json['last_status_change'];
    _addedFrom = json['addedfrom'];
    _email = json['email'];
    _website = json['website'];
    _leadOrder = json['leadorder'];
    _phoneNumber = json['phonenumber'];
    _dateConverted = json['date_converted'];
    _lost = json['lost'];
    _junk = json['junk'];
    _lastLeadStatus = json['last_lead_status'];
    _isImportedFromEmailIntegration =
        json['is_imported_from_email_integration'];
    _emailIntegrationUid = json['email_integration_uid'];
    _isPublic = json['is_public'];
    _defaultLanguage = json['default_language'];
    _clientId = json['client_id'];
    _leadValue = json['lead_value'];
    _vat = json['vat'];
    _statusOrder = json['statusorder'];
    _color = json['color'];
    _isDefault = json['isdefault'];
    _statusName = json['status_name'];
    _sourceName = json['source_name'];
    _publicUrl = json['public_url'];
    if (json['attachments'] != null) {
      _attachments = [];
      json['attachments'].forEach((v) {
        _attachments?.add(Attachments.fromJson(v));
      });
    }
    if (json['customfields'] != null) {
      _customFields = [];
      json['customfields'].forEach((v) {
        _customFields?.add(CustomField.fromJson(v));
      });
    }
  }

  String? _id;
  String? _hash;
  String? _name;
  String? _title;
  String? _company;
  String? _description;
  String? _country;
  String? _zip;
  String? _city;
  String? _state;
  String? _address;
  String? _assigned;
  String? _dateAdded;
  String? _fromFormId;
  String? _status;
  String? _source;
  String? _lastContact;
  String? _dateAssigned;
  String? _lastStatusChange;
  String? _addedFrom;
  String? _email;
  String? _website;
  String? _leadOrder;
  String? _phoneNumber;
  String? _dateConverted;
  String? _lost;
  String? _junk;
  String? _lastLeadStatus;
  String? _isImportedFromEmailIntegration;
  String? _emailIntegrationUid;
  String? _isPublic;
  String? _defaultLanguage;
  String? _clientId;
  String? _leadValue;
  String? _vat;
  String? _statusOrder;
  String? _color;
  String? _isDefault;
  String? _statusName;
  String? _sourceName;
  String? _publicUrl;
  List<Attachments>? _attachments;
  List<CustomField>? _customFields;

  String? get id => _id;
  String? get hash => _hash;
  String? get name => _name;
  String? get title => _title;
  String? get company => _company;
  String? get description => _description;
  String? get country => _country;
  String? get zip => _zip;
  String? get city => _city;
  String? get state => _state;
  String? get address => _address;
  String? get assigned => _assigned;
  String? get dateAdded => _dateAdded;
  String? get fromFormId => _fromFormId;
  String? get status => _status;
  String? get source => _source;
  String? get lastContact => _lastContact;
  String? get dateAssigned => _dateAssigned;
  String? get lastStatusChange => _lastStatusChange;
  String? get addedFrom => _addedFrom;
  String? get email => _email;
  String? get website => _website;
  String? get leadOrder => _leadOrder;
  String? get phoneNumber => _phoneNumber;
  String? get dateConverted => _dateConverted;
  String? get lost => _lost;
  String? get junk => _junk;
  String? get lastLeadStatus => _lastLeadStatus;
  String? get isImportedFromEmailIntegration => _isImportedFromEmailIntegration;
  String? get emailIntegrationUid => _emailIntegrationUid;
  String? get isPublic => _isPublic;
  String? get defaultLanguage => _defaultLanguage;
  String? get clientId => _clientId;
  String? get leadValue => _leadValue;
  String? get vat => _vat;
  String? get statusOrder => _statusOrder;
  String? get color => _color;
  String? get isDefault => _isDefault;
  String? get statusName => _statusName;
  String? get sourceName => _sourceName;
  String? get publicUrl => _publicUrl;
  List<Attachments>? get attachments => _attachments;
  List<CustomField>? get customFields => _customFields;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['hash'] = _hash;
    map['name'] = _name;
    map['title'] = _title;
    map['company'] = _company;
    map['description'] = _description;
    map['country'] = _country;
    map['zip'] = _zip;
    map['city'] = _city;
    map['state'] = _state;
    map['address'] = _address;
    map['assigned'] = _assigned;
    map['dateadded'] = _dateAdded;
    map['from_form_id'] = _fromFormId;
    map['status'] = _status;
    map['source'] = _source;
    map['lastcontact'] = _lastContact;
    map['dateassigned'] = _dateAssigned;
    map['last_status_change'] = _lastStatusChange;
    map['addedfrom'] = _addedFrom;
    map['email'] = _email;
    map['website'] = _website;
    map['leadorder'] = _leadOrder;
    map['phonenumber'] = _phoneNumber;
    map['date_converted'] = _dateConverted;
    map['lost'] = _lost;
    map['junk'] = _junk;
    map['last_lead_status'] = _lastLeadStatus;
    map['is_imported_from_email_integration'] = _isImportedFromEmailIntegration;
    map['email_integration_uid'] = _emailIntegrationUid;
    map['is_public'] = _isPublic;
    map['default_language'] = _defaultLanguage;
    map['client_id'] = _clientId;
    map['lead_value'] = _leadValue;
    map['vat'] = _vat;
    map['statusorder'] = _statusOrder;
    map['color'] = _color;
    map['isdefault'] = _isDefault;
    map['status_name'] = _statusName;
    map['source_name'] = _sourceName;
    map['public_url'] = _publicUrl;
    if (_attachments != null) {
      map['attachments'] = _attachments?.map((v) => v.toJson()).toList();
    }
    if (_customFields != null) {
      map['customfields'] = _customFields?.map((v) => v.toJson()).toList();
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

  Attachments.fromJson(dynamic json) {
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

class CustomField {
  CustomField({
    String? label,
    String? value,
  }) {
    _label = label;
    _value = value;
  }

  CustomField.fromJson(dynamic json) {
    _label = json['label'];
    _value = json['value'];
  }

  String? _label;
  String? _value;

  String? get label => _label;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = _label;
    map['value'] = _value;
    return map;
  }
}
