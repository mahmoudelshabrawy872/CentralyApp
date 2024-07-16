class ContactsModel {
  ContactsModel({
    List<Contact>? data,
  }) {
    _data = data;
  }

  ContactsModel.fromJson(dynamic json) {
    _data = [];
    json.forEach((v) {
      _data?.add(Contact.fromJson(v));
    });
  }
  List<Contact>? _data;

  List<Contact>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map[''] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Contact {
  Contact({
    String? id,
    String? userId,
    String? isPrimary,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? title,
    String? dateCreated,
    String? password,
    String? newPassKey,
    String? newPassKeyRequested,
    String? emailVerifiedAt,
    String? emailVerificationKey,
    String? emailVerificationSentAt,
    String? lastIp,
    String? lastLogin,
    String? lastPasswordChange,
    String? active,
    String? profileImage,
    String? direction,
    String? invoiceEmails,
    String? estimateEmails,
    String? creditNoteEmails,
    String? contractEmails,
    String? taskEmails,
    String? projectEmails,
    String? ticketEmail,
    String? customerApiKey,
    String? clientMessage,
    String? invoiceMessage,
    String? tasksMessage,
    String? projectsMessage,
    String? proposalsMessage,
    String? paymentsMessage,
    String? ticketMessage,
    String? clientForwardPhone,
    String? invoiceForwardPhone,
    String? tasksForwardPhone,
    String? projectsForwardPhone,
    String? proposalsForwardPhone,
    String? paymentsForwardPhone,
    String? ticketForwardPhone,
    List<CustomField>? customFields,
  }) {
    _id = id;
    _userId = userId;
    _isPrimary = isPrimary;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phoneNumber = phoneNumber;
    _title = title;
    _dateCreated = dateCreated;
    _password = password;
    _newPassKey = newPassKey;
    _newPassKeyRequested = newPassKeyRequested;
    _emailVerifiedAt = emailVerifiedAt;
    _emailVerificationKey = emailVerificationKey;
    _emailVerificationSentAt = emailVerificationSentAt;
    _lastIp = lastIp;
    _lastLogin = lastLogin;
    _lastPasswordChange = lastPasswordChange;
    _active = active;
    _profileImage = profileImage;
    _direction = direction;
    _invoiceEmails = invoiceEmails;
    _estimateEmails = estimateEmails;
    _creditNoteEmails = creditNoteEmails;
    _contractEmails = contractEmails;
    _taskEmails = taskEmails;
    _projectEmails = projectEmails;
    _ticketEmail = ticketEmail;
    _customerApiKey = customerApiKey;
    _clientMessage = clientMessage;
    _invoiceMessage = invoiceMessage;
    _tasksMessage = tasksMessage;
    _projectsMessage = projectsMessage;
    _proposalsMessage = proposalsMessage;
    _paymentsMessage = paymentsMessage;
    _ticketMessage = ticketMessage;
    _clientForwardPhone = clientForwardPhone;
    _invoiceForwardPhone = invoiceForwardPhone;
    _tasksForwardPhone = tasksForwardPhone;
    _projectsForwardPhone = projectsForwardPhone;
    _proposalsForwardPhone = proposalsForwardPhone;
    _paymentsForwardPhone = paymentsForwardPhone;
    _ticketForwardPhone = ticketForwardPhone;
    _customFields = customFields;
  }

  Contact.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['userid'];
    _isPrimary = json['is_primary'];
    _firstName = json['firstname'];
    _lastName = json['lastname'];
    _email = json['email'];
    _phoneNumber = json['phonenumber'];
    _title = json['title'];
    _dateCreated = json['datecreated'];
    _password = json['password'];
    _newPassKey = json['new_pass_key'];
    _newPassKeyRequested = json['new_pass_key_requested'];
    _emailVerifiedAt = json['email_verified_at'];
    _emailVerificationKey = json['email_verification_key'];
    _emailVerificationSentAt = json['email_verification_sent_at'];
    _lastIp = json['last_ip'];
    _lastLogin = json['last_login'];
    _lastPasswordChange = json['last_password_change'];
    _active = json['active'];
    _profileImage = json['profile_image'];
    _direction = json['direction'];
    _invoiceEmails = json['invoice_emails'];
    _estimateEmails = json['estimate_emails'];
    _creditNoteEmails = json['credit_note_emails'];
    _contractEmails = json['contract_emails'];
    _taskEmails = json['task_emails'];
    _projectEmails = json['project_emails'];
    _ticketEmail = json['ticket_email'];
    _customerApiKey = json['customer_api_key'];
    _clientMessage = json['client_message'];
    _invoiceMessage = json['invoice_message'];
    _tasksMessage = json['tasks_message'];
    _projectsMessage = json['projects_message'];
    _proposalsMessage = json['proposals_message'];
    _paymentsMessage = json['payments_message'];
    _ticketMessage = json['ticket_message'];
    _clientForwardPhone = json['client_forward_phone'];
    _invoiceForwardPhone = json['invoice_forward_phone'];
    _tasksForwardPhone = json['tasks_forward_phone'];
    _projectsForwardPhone = json['projects_forward_phone'];
    _proposalsForwardPhone = json['proposals_forward_phone'];
    _paymentsForwardPhone = json['payments_forward_phone'];
    _ticketForwardPhone = json['ticket_forward_phone'];
    if (json['customfields'] != null) {
      _customFields = [];
      json['customfields'].forEach((v) {
        _customFields?.add(CustomField.fromJson(v));
      });
    }
  }

  String? _id;
  String? _userId;
  String? _isPrimary;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phoneNumber;
  String? _title;
  String? _dateCreated;
  String? _password;
  String? _newPassKey;
  String? _newPassKeyRequested;
  String? _emailVerifiedAt;
  String? _emailVerificationKey;
  String? _emailVerificationSentAt;
  String? _lastIp;
  String? _lastLogin;
  String? _lastPasswordChange;
  String? _active;
  String? _profileImage;
  String? _direction;
  String? _invoiceEmails;
  String? _estimateEmails;
  String? _creditNoteEmails;
  String? _contractEmails;
  String? _taskEmails;
  String? _projectEmails;
  String? _ticketEmail;
  String? _customerApiKey;
  String? _clientMessage;
  String? _invoiceMessage;
  String? _tasksMessage;
  String? _projectsMessage;
  String? _proposalsMessage;
  String? _paymentsMessage;
  String? _ticketMessage;
  String? _clientForwardPhone;
  String? _invoiceForwardPhone;
  String? _tasksForwardPhone;
  String? _projectsForwardPhone;
  String? _proposalsForwardPhone;
  String? _paymentsForwardPhone;
  String? _ticketForwardPhone;
  List<CustomField>? _customFields;

  String? get id => _id;
  String? get userId => _userId;
  String? get isPrimary => _isPrimary;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  String? get title => _title;
  String? get dateCreated => _dateCreated;
  String? get password => _password;
  String? get newPassKey => _newPassKey;
  String? get newPassKeyRequested => _newPassKeyRequested;
  String? get emailVerifiedAt => _emailVerifiedAt;
  String? get emailVerificationKey => _emailVerificationKey;
  String? get emailVerificationSentAt => _emailVerificationSentAt;
  String? get lastIp => _lastIp;
  String? get lastLogin => _lastLogin;
  String? get lastPasswordChange => _lastPasswordChange;
  String? get active => _active;
  String? get profileImage => _profileImage;
  String? get direction => _direction;
  String? get invoiceEmails => _invoiceEmails;
  String? get estimateEmails => _estimateEmails;
  String? get creditNoteEmails => _creditNoteEmails;
  String? get contractEmails => _contractEmails;
  String? get taskEmails => _taskEmails;
  String? get projectEmails => _projectEmails;
  String? get ticketEmail => _ticketEmail;
  String? get customerApiKey => _customerApiKey;
  String? get clientMessage => _clientMessage;
  String? get invoiceMessage => _invoiceMessage;
  String? get tasksMessage => _tasksMessage;
  String? get projectsMessage => _projectsMessage;
  String? get proposalsMessage => _proposalsMessage;
  String? get paymentsMessage => _paymentsMessage;
  String? get ticketMessage => _ticketMessage;
  String? get clientForwardPhone => _clientForwardPhone;
  String? get invoiceForwardPhone => _invoiceForwardPhone;
  String? get tasksForwardPhone => _tasksForwardPhone;
  String? get projectsForwardPhone => _projectsForwardPhone;
  String? get proposalsForwardPhone => _proposalsForwardPhone;
  String? get paymentsForwardPhone => _paymentsForwardPhone;
  String? get ticketForwardPhone => _ticketForwardPhone;
  List<CustomField>? get customFields => _customFields;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userid'] = _userId;
    map['id'] = _id;
    map['userid'] = _userId;
    map['is_primary'] = _isPrimary;
    map['firstname'] = _firstName;
    map['lastname'] = _lastName;
    map['email'] = _email;
    map['phonenumber'] = _phoneNumber;
    map['title'] = _title;
    map['datecreated'] = _dateCreated;
    map['password'] = _password;
    map['new_pass_key'] = _newPassKey;
    map['new_pass_key_requested'] = _newPassKeyRequested;
    map['email_verified_at'] = _emailVerifiedAt;
    map['email_verification_key'] = _emailVerificationKey;
    map['email_verification_sent_at'] = _emailVerificationSentAt;
    map['last_ip'] = _lastIp;
    map['last_login'] = _lastLogin;
    map['last_password_change'] = _lastPasswordChange;
    map['active'] = _active;
    map['profile_image'] = _profileImage;
    map['direction'] = _direction;
    map['invoice_emails'] = _invoiceEmails;
    map['estimate_emails'] = _estimateEmails;
    map['credit_note_emails'] = _creditNoteEmails;
    map['contract_emails'] = _contractEmails;
    map['task_emails'] = _taskEmails;
    map['project_emails'] = _projectEmails;
    map['ticket_email'] = _ticketEmail;
    map['customer_api_key'] = _customerApiKey;
    map['client_message'] = _clientMessage;
    map['invoice_message'] = _invoiceMessage;
    map['tasks_message'] = _tasksMessage;
    map['projects_message'] = _projectsMessage;
    map['proposals_message'] = _proposalsMessage;
    map['payments_message'] = _paymentsMessage;
    map['ticket_message'] = _ticketMessage;
    map['client_forward_phone'] = _clientForwardPhone;
    map['invoice_forward_phone'] = _invoiceForwardPhone;
    map['tasks_forward_phone'] = _tasksForwardPhone;
    map['projects_forward_phone'] = _projectsForwardPhone;
    map['proposals_forward_phone'] = _proposalsForwardPhone;
    map['payments_forward_phone'] = _paymentsForwardPhone;
    map['ticket_forward_phone'] = _ticketForwardPhone;
    if (_customFields != null) {
      map['customfields'] = _customFields?.map((v) => v.toJson()).toList();
    }
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
