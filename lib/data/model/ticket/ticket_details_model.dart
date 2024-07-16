class TicketDetailsModel {
  TicketDetailsModel({
    Data? data,
  }) {
    _data = data;
  }

  TicketDetailsModel.fromJson(dynamic json) {
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
    String? ticketId,
    String? adminReplying,
    String? userId,
    String? contactId,
    String? mergedTicketId,
    String? email,
    String? name,
    String? department,
    String? priority,
    String? status,
    String? service,
    String? ticketKey,
    String? subject,
    String? message,
    String? admin,
    String? date,
    String? projectId,
    String? lastReply,
    String? clientRead,
    String? adminRead,
    String? assigned,
    String? staffIdReplying,
    String? cc,
    String? departmentId,
    String? imapUsername,
    String? emailFromHeader,
    String? host,
    String? password,
    String? encryption,
    String? folder,
    String? deleteAfterImport,
    String? calendarId,
    String? hideFromClient,
    String? ticketStatusId,
    String? isDefault,
    String? statusColor,
    String? statusOrder,
    String? serviceId,
    String? company,
    String? vat,
    String? phoneNumber,
    String? country,
    String? city,
    String? zip,
    String? state,
    String? address,
    String? website,
    String? dateCreated,
    String? active,
    String? leadid,
    String? billingStreet,
    String? billingCity,
    String? billingState,
    String? billingZip,
    String? billingCountry,
    String? shippingStreet,
    String? shippingCity,
    String? shippingState,
    String? shippingZip,
    String? shippingCountry,
    String? longitude,
    String? latitude,
    String? defaultLanguage,
    String? defaultCurrency,
    String? showPrimaryContact,
    String? stripeId,
    String? registrationConfirmed,
    String? addedFrom,
    String? id,
    String? isPrimary,
    String? firstName,
    String? lastName,
    String? title,
    String? newPassKey,
    String? newPassKeyRequested,
    String? emailVerifiedAt,
    String? emailVerificationKey,
    String? emailVerificationSentAt,
    String? lastIp,
    String? lastLogin,
    String? lastPasswordChange,
    String? profileImage,
    String? direction,
    String? invoiceEmails,
    String? estimateEmails,
    String? creditNoteEmails,
    String? contractEmails,
    String? taskEmails,
    String? projectEmails,
    String? ticketEmails,
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
    String? staffId,
    String? facebook,
    String? linkedin,
    String? skype,
    String? lastActivity,
    String? role,
    String? mediaPathSlug,
    String? isNotStaff,
    String? hourlyRate,
    String? twoFactorAuthEnabled,
    String? twoFactorAuthCode,
    String? twoFactorAuthCodeRequested,
    String? emailSignature,
    String? googleAuthSecret,
    String? mailPassword,
    String? mailSignature,
    String? lastEmailCheck,
    String? whatsappAuthEnabled,
    String? whatsappAuthCode,
    String? whatsappAuthCodeRequested,
    String? priorityId,
    String? fromName,
    String? ticketEmail,
    String? departmentName,
    String? priorityName,
    String? serviceName,
    String? statusName,
    String? userFirstName,
    String? userLastName,
    String? staffFirstName,
    String? staffLastName,
    List<CustomField>? customFields,
  }) {
    _ticketId = ticketId;
    _adminReplying = adminReplying;
    _userId = userId;
    _contactId = contactId;
    _mergedTicketId = mergedTicketId;
    _email = email;
    _name = name;
    _department = department;
    _priority = priority;
    _status = status;
    _service = service;
    _ticketKey = ticketKey;
    _subject = subject;
    _message = message;
    _admin = admin;
    _date = date;
    _projectId = projectId;
    _lastReply = lastReply;
    _clientRead = clientRead;
    _adminRead = adminRead;
    _assigned = assigned;
    _staffIdReplying = staffIdReplying;
    _cc = cc;
    _departmentId = departmentId;
    _imapUsername = imapUsername;
    _emailFromHeader = emailFromHeader;
    _host = host;
    _password = password;
    _encryption = encryption;
    _folder = folder;
    _deleteAfterImport = deleteAfterImport;
    _calendarId = calendarId;
    _hideFromClient = hideFromClient;
    _ticketStatusId = ticketStatusId;
    _isDefault = isDefault;
    _statusColor = statusColor;
    _statusOrder = statusOrder;
    _serviceId = serviceId;
    _company = company;
    _vat = vat;
    _phoneNumber = phoneNumber;
    _country = country;
    _city = city;
    _zip = zip;
    _state = state;
    _address = address;
    _website = website;
    _dateCreated = dateCreated;
    _active = active;
    _leadid = leadid;
    _billingStreet = billingStreet;
    _billingCity = billingCity;
    _billingState = billingState;
    _billingZip = billingZip;
    _billingCountry = billingCountry;
    _shippingStreet = shippingStreet;
    _shippingCity = shippingCity;
    _shippingState = shippingState;
    _shippingZip = shippingZip;
    _shippingCountry = shippingCountry;
    _longitude = longitude;
    _latitude = latitude;
    _defaultLanguage = defaultLanguage;
    _defaultCurrency = defaultCurrency;
    _showPrimaryContact = showPrimaryContact;
    _stripeId = stripeId;
    _registrationConfirmed = registrationConfirmed;
    _addedFrom = addedFrom;
    _id = id;
    _isPrimary = isPrimary;
    _firstName = firstName;
    _lastName = lastName;
    _title = title;
    _newPassKey = newPassKey;
    _newPassKeyRequested = newPassKeyRequested;
    _emailVerifiedAt = emailVerifiedAt;
    _emailVerificationKey = emailVerificationKey;
    _emailVerificationSentAt = emailVerificationSentAt;
    _lastIp = lastIp;
    _lastLogin = lastLogin;
    _lastPasswordChange = lastPasswordChange;
    _profileImage = profileImage;
    _direction = direction;
    _invoiceEmails = invoiceEmails;
    _estimateEmails = estimateEmails;
    _creditNoteEmails = creditNoteEmails;
    _contractEmails = contractEmails;
    _taskEmails = taskEmails;
    _projectEmails = projectEmails;
    _ticketEmails = ticketEmails;
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
    _staffId = staffId;
    _facebook = facebook;
    _linkedin = linkedin;
    _skype = skype;
    _lastActivity = lastActivity;
    _role = role;
    _mediaPathSlug = mediaPathSlug;
    _isNotStaff = isNotStaff;
    _hourlyRate = hourlyRate;
    _twoFactorAuthEnabled = twoFactorAuthEnabled;
    _twoFactorAuthCode = twoFactorAuthCode;
    _twoFactorAuthCodeRequested = twoFactorAuthCodeRequested;
    _emailSignature = emailSignature;
    _googleAuthSecret = googleAuthSecret;
    _mailPassword = mailPassword;
    _mailSignature = mailSignature;
    _lastEmailCheck = lastEmailCheck;
    _whatsappAuthEnabled = whatsappAuthEnabled;
    _whatsappAuthCode = whatsappAuthCode;
    _whatsappAuthCodeRequested = whatsappAuthCodeRequested;
    _priorityId = priorityId;
    _fromName = fromName;
    _ticketEmail = ticketEmail;
    _departmentName = departmentName;
    _priorityName = priorityName;
    _serviceName = serviceName;
    _statusName = statusName;
    _userFirstName = userFirstName;
    _userLastName = userLastName;
    _staffFirstName = staffFirstName;
    _staffLastName = staffLastName;
    _customFields = customFields;
  }

  Data.fromJson(dynamic json) {
    _ticketId = json['ticketid'];
    _adminReplying = json['adminreplying'];
    _userId = json['userid'];
    _contactId = json['contactid'];
    _mergedTicketId = json['merged_ticket_id'];
    _email = json['email'];
    _name = json['name'];
    _department = json['department'];
    _priority = json['priority'];
    _status = json['status'];
    _service = json['service'];
    _ticketKey = json['ticketkey'];
    _subject = json['subject'];
    _message = json['message'];
    _admin = json['admin'];
    _date = json['date'];
    _projectId = json['project_id'];
    _lastReply = json['lastreply'];
    _clientRead = json['clientread'];
    _adminRead = json['adminread'];
    _assigned = json['assigned'];
    _staffIdReplying = json['staff_id_replying'];
    _cc = json['cc'];
    _departmentId = json['departmentid'];
    _imapUsername = json['imap_username'];
    _emailFromHeader = json['email_from_header'];
    _host = json['host'];
    _password = json['password'];
    _encryption = json['encryption'];
    _folder = json['folder'];
    _deleteAfterImport = json['delete_after_import'];
    _calendarId = json['calendar_id'];
    _hideFromClient = json['hidefromclient'];
    _ticketStatusId = json['ticketstatusid'];
    _isDefault = json['isdefault'];
    _statusColor = json['statuscolor'];
    _statusOrder = json['statusorder'];
    _serviceId = json['serviceid'];
    _company = json['company'];
    _vat = json['vat'];
    _phoneNumber = json['phonenumber'];
    _country = json['country'];
    _city = json['city'];
    _zip = json['zip'];
    _state = json['state'];
    _address = json['address'];
    _website = json['website'];
    _dateCreated = json['datecreated'];
    _active = json['active'];
    _leadid = json['leadid'];
    _billingStreet = json['billing_street'];
    _billingCity = json['billing_city'];
    _billingState = json['billing_state'];
    _billingZip = json['billing_zip'];
    _billingCountry = json['billing_country'];
    _shippingStreet = json['shipping_street'];
    _shippingCity = json['shipping_city'];
    _shippingState = json['shipping_state'];
    _shippingZip = json['shipping_zip'];
    _shippingCountry = json['shipping_country'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _defaultLanguage = json['default_language'];
    _defaultCurrency = json['default_currency'];
    _showPrimaryContact = json['show_primary_contact'];
    _stripeId = json['stripe_id'];
    _registrationConfirmed = json['registration_confirmed'];
    _addedFrom = json['addedfrom'];
    _id = json['id'];
    _isPrimary = json['is_primary'];
    _firstName = json['firstname'];
    _lastName = json['lastname'];
    _title = json['title'];
    _newPassKey = json['new_pass_key'];
    _newPassKeyRequested = json['new_pass_key_requested'];
    _emailVerifiedAt = json['email_verified_at'];
    _emailVerificationKey = json['email_verification_key'];
    _emailVerificationSentAt = json['email_verification_sent_at'];
    _lastIp = json['last_ip'];
    _lastLogin = json['last_login'];
    _lastPasswordChange = json['last_password_change'];
    _profileImage = json['profile_image'];
    _direction = json['direction'];
    _invoiceEmails = json['invoice_emails'];
    _estimateEmails = json['estimate_emails'];
    _creditNoteEmails = json['credit_note_emails'];
    _contractEmails = json['contract_emails'];
    _taskEmails = json['task_emails'];
    _projectEmails = json['project_emails'];
    _ticketEmails = json['ticket_emails'];
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
    _staffId = json['staffid'];
    _facebook = json['facebook'];
    _linkedin = json['linkedin'];
    _skype = json['skype'];
    _lastActivity = json['last_activity'];
    _role = json['role'];
    _mediaPathSlug = json['media_path_slug'];
    _isNotStaff = json['is_not_staff'];
    _hourlyRate = json['hourly_rate'];
    _twoFactorAuthEnabled = json['two_factor_auth_enabled'];
    _twoFactorAuthCode = json['two_factor_auth_code'];
    _twoFactorAuthCodeRequested = json['two_factor_auth_code_requested'];
    _emailSignature = json['email_signature'];
    _googleAuthSecret = json['google_auth_secret'];
    _mailPassword = json['mail_password'];
    _mailSignature = json['mail_signature'];
    _lastEmailCheck = json['last_email_check'];
    _whatsappAuthEnabled = json['whatsapp_auth_enabled'];
    _whatsappAuthCode = json['whatsapp_auth_code'];
    _whatsappAuthCodeRequested = json['whatsapp_auth_code_requested'];
    _priorityId = json['priorityid'];
    _fromName = json['from_name'];
    _ticketEmail = json['ticket_email'];
    _departmentName = json['department_name'];
    _priorityName = json['priority_name'];
    _serviceName = json['service_name'];
    _statusName = json['status_name'];
    _userFirstName = json['user_firstname'];
    _userLastName = json['user_lastname'];
    _staffFirstName = json['staff_firstname'];
    _staffLastName = json['staff_lastname'];

    if (json['customfields'] != null) {
      _customFields = [];
      json['customfields'].forEach((v) {
        _customFields?.add(CustomField.fromJson(v));
      });
    }
  }

  String? _ticketId;
  String? _adminReplying;
  String? _userId;
  String? _contactId;
  String? _mergedTicketId;
  String? _email;
  String? _name;
  String? _department;
  String? _priority;
  String? _status;
  String? _service;
  String? _ticketKey;
  String? _subject;
  String? _message;
  String? _admin;
  String? _date;
  String? _projectId;
  String? _lastReply;
  String? _clientRead;
  String? _adminRead;
  String? _assigned;
  String? _staffIdReplying;
  String? _cc;
  String? _departmentId;
  String? _imapUsername;
  String? _emailFromHeader;
  String? _host;
  String? _password;
  String? _encryption;
  String? _folder;
  String? _deleteAfterImport;
  String? _calendarId;
  String? _hideFromClient;
  String? _ticketStatusId;
  String? _isDefault;
  String? _statusColor;
  String? _statusOrder;
  String? _serviceId;
  String? _company;
  String? _vat;
  String? _phoneNumber;
  String? _country;
  String? _city;
  String? _zip;
  String? _state;
  String? _address;
  String? _website;
  String? _dateCreated;
  String? _active;
  String? _leadid;
  String? _billingStreet;
  String? _billingCity;
  String? _billingState;
  String? _billingZip;
  String? _billingCountry;
  String? _shippingStreet;
  String? _shippingCity;
  String? _shippingState;
  String? _shippingZip;
  String? _shippingCountry;
  String? _longitude;
  String? _latitude;
  String? _defaultLanguage;
  String? _defaultCurrency;
  String? _showPrimaryContact;
  String? _stripeId;
  String? _registrationConfirmed;
  String? _addedFrom;
  String? _id;
  String? _isPrimary;
  String? _firstName;
  String? _lastName;
  String? _title;
  String? _newPassKey;
  String? _newPassKeyRequested;
  String? _emailVerifiedAt;
  String? _emailVerificationKey;
  String? _emailVerificationSentAt;
  String? _lastIp;
  String? _lastLogin;
  String? _lastPasswordChange;
  String? _profileImage;
  String? _direction;
  String? _invoiceEmails;
  String? _estimateEmails;
  String? _creditNoteEmails;
  String? _contractEmails;
  String? _taskEmails;
  String? _projectEmails;
  String? _ticketEmails;
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
  String? _staffId;
  String? _facebook;
  String? _linkedin;
  String? _skype;
  String? _lastActivity;
  String? _role;
  String? _mediaPathSlug;
  String? _isNotStaff;
  String? _hourlyRate;
  String? _twoFactorAuthEnabled;
  String? _twoFactorAuthCode;
  String? _twoFactorAuthCodeRequested;
  String? _emailSignature;
  String? _googleAuthSecret;
  String? _mailPassword;
  String? _mailSignature;
  String? _lastEmailCheck;
  String? _whatsappAuthEnabled;
  String? _whatsappAuthCode;
  String? _whatsappAuthCodeRequested;
  String? _priorityId;
  String? _fromName;
  String? _ticketEmail;
  String? _departmentName;
  String? _priorityName;
  String? _serviceName;
  String? _statusName;
  String? _userFirstName;
  String? _userLastName;
  String? _staffFirstName;
  String? _staffLastName;
  List<CustomField>? _customFields;

  String? get ticketId => _ticketId;
  String? get adminReplying => _adminReplying;
  String? get userId => _userId;
  String? get contactId => _contactId;
  String? get mergedTicketId => _mergedTicketId;
  String? get email => _email;
  String? get name => _name;
  String? get department => _department;
  String? get priority => _priority;
  String? get status => _status;
  String? get service => _service;
  String? get ticketKey => _ticketKey;
  String? get subject => _subject;
  String? get message => _message;
  String? get admin => _admin;
  String? get date => _date;
  String? get projectId => _projectId;
  String? get lastReply => _lastReply;
  String? get clientRead => _clientRead;
  String? get adminRead => _adminRead;
  String? get assigned => _assigned;
  String? get staffIdReplying => _staffIdReplying;
  String? get cc => _cc;
  String? get departmentId => _departmentId;
  String? get imapUsername => _imapUsername;
  String? get emailFromHeader => _emailFromHeader;
  String? get host => _host;
  String? get password => _password;
  String? get encryption => _encryption;
  String? get folder => _folder;
  String? get deleteAfterImport => _deleteAfterImport;
  String? get calendarId => _calendarId;
  String? get hideFromClient => _hideFromClient;
  String? get ticketStatusId => _ticketStatusId;
  String? get isDefault => _isDefault;
  String? get statusColor => _statusColor;
  String? get statusOrder => _statusOrder;
  String? get serviceId => _serviceId;
  String? get company => _company;
  String? get vat => _vat;
  String? get phoneNumber => _phoneNumber;
  String? get country => _country;
  String? get city => _city;
  String? get zip => _zip;
  String? get state => _state;
  String? get address => _address;
  String? get website => _website;
  String? get dateCreated => _dateCreated;
  String? get active => _active;
  String? get leadid => _leadid;
  String? get billingStreet => _billingStreet;
  String? get billingCity => _billingCity;
  String? get billingState => _billingState;
  String? get billingZip => _billingZip;
  String? get billingCountry => _billingCountry;
  String? get shippingStreet => _shippingStreet;
  String? get shippingCity => _shippingCity;
  String? get shippingState => _shippingState;
  String? get shippingZip => _shippingZip;
  String? get shippingCountry => _shippingCountry;
  String? get longitude => _longitude;
  String? get latitude => _latitude;
  String? get defaultLanguage => _defaultLanguage;
  String? get defaultCurrency => _defaultCurrency;
  String? get showPrimaryContact => _showPrimaryContact;
  String? get stripeId => _stripeId;
  String? get registrationConfirmed => _registrationConfirmed;
  String? get addedFrom => _addedFrom;
  String? get id => _id;
  String? get isPrimary => _isPrimary;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get title => _title;
  String? get newPassKey => _newPassKey;
  String? get newPassKeyRequested => _newPassKeyRequested;
  String? get emailVerifiedAt => _emailVerifiedAt;
  String? get emailVerificationKey => _emailVerificationKey;
  String? get emailVerificationSentAt => _emailVerificationSentAt;
  String? get lastIp => _lastIp;
  String? get lastLogin => _lastLogin;
  String? get lastPasswordChange => _lastPasswordChange;
  String? get profileImage => _profileImage;
  String? get direction => _direction;
  String? get invoiceEmails => _invoiceEmails;
  String? get estimateEmails => _estimateEmails;
  String? get creditNoteEmails => _creditNoteEmails;
  String? get contractEmails => _contractEmails;
  String? get taskEmails => _taskEmails;
  String? get projectEmails => _projectEmails;
  String? get ticketEmails => _ticketEmails;
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
  String? get staffId => _staffId;
  String? get facebook => _facebook;
  String? get linkedin => _linkedin;
  String? get skype => _skype;
  String? get lastActivity => _lastActivity;
  String? get role => _role;
  String? get mediaPathSlug => _mediaPathSlug;
  String? get isNotStaff => _isNotStaff;
  String? get hourlyRate => _hourlyRate;
  String? get twoFactorAuthEnabled => _twoFactorAuthEnabled;
  String? get twoFactorAuthCode => _twoFactorAuthCode;
  String? get twoFactorAuthCodeRequested => _twoFactorAuthCodeRequested;
  String? get emailSignature => _emailSignature;
  String? get googleAuthSecret => _googleAuthSecret;
  String? get mailPassword => _mailPassword;
  String? get mailSignature => _mailSignature;
  String? get lastEmailCheck => _lastEmailCheck;
  String? get whatsappAuthEnabled => _whatsappAuthEnabled;
  String? get whatsappAuthCode => _whatsappAuthCode;
  String? get whatsappAuthCodeRequested => _whatsappAuthCodeRequested;
  String? get priorityId => _priorityId;
  String? get fromName => _fromName;
  String? get ticketEmail => _ticketEmail;
  String? get departmentName => _departmentName;
  String? get priorityName => _priorityName;
  String? get serviceName => _serviceName;
  String? get statusName => _statusName;
  String? get userFirstName => _userFirstName;
  String? get userLastName => _userLastName;
  String? get staffFirstName => _staffFirstName;
  String? get staffLastName => _staffLastName;
  List<CustomField>? get customFields => _customFields;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ticketid'] = _ticketId;
    map['adminreplying'] = _adminReplying;
    map['userid'] = _userId;
    map['contactid'] = _contactId;
    map['merged_ticket_id'] = _mergedTicketId;
    map['email'] = _email;
    map['name'] = _name;
    map['department'] = _department;
    map['priority'] = _priority;
    map['status'] = _status;
    map['service'] = _service;
    map['ticketkey'] = _ticketKey;
    map['subject'] = _subject;
    map['message'] = _message;
    map['admin'] = _admin;
    map['date'] = _date;
    map['project_id'] = _projectId;
    map['lastreply'] = _lastReply;
    map['clientread'] = _clientRead;
    map['adminread'] = _adminRead;
    map['assigned'] = _assigned;
    map['staff_id_replying'] = _staffIdReplying;
    map['cc'] = _cc;
    map['departmentid'] = _departmentId;
    map['imap_username'] = _imapUsername;
    map['email_from_header'] = _emailFromHeader;
    map['host'] = _host;
    map['password'] = _password;
    map['encryption'] = _encryption;
    map['folder'] = _folder;
    map['delete_after_import'] = _deleteAfterImport;
    map['calendar_id'] = _calendarId;
    map['hidefromclient'] = _hideFromClient;
    map['ticketstatusid'] = _ticketStatusId;
    map['isdefault'] = _isDefault;
    map['statuscolor'] = _statusColor;
    map['statusorder'] = _statusOrder;
    map['serviceid'] = _serviceId;
    map['company'] = _company;
    map['vat'] = _vat;
    map['phonenumber'] = _phoneNumber;
    map['country'] = _country;
    map['city'] = _city;
    map['zip'] = _zip;
    map['state'] = _state;
    map['address'] = _address;
    map['website'] = _website;
    map['datecreated'] = _dateCreated;
    map['active'] = _active;
    map['leadid'] = _leadid;
    map['billing_street'] = _billingStreet;
    map['billing_city'] = _billingCity;
    map['billing_state'] = _billingState;
    map['billing_zip'] = _billingZip;
    map['billing_country'] = _billingCountry;
    map['shipping_street'] = _shippingStreet;
    map['shipping_city'] = _shippingCity;
    map['shipping_state'] = _shippingState;
    map['shipping_zip'] = _shippingZip;
    map['shipping_country'] = _shippingCountry;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    map['default_language'] = _defaultLanguage;
    map['default_currency'] = _defaultCurrency;
    map['show_primary_contact'] = _showPrimaryContact;
    map['stripe_id'] = _stripeId;
    map['registration_confirmed'] = _registrationConfirmed;
    map['addedfrom'] = _addedFrom;
    map['id'] = _id;
    map['is_primary'] = _isPrimary;
    map['firstname'] = _firstName;
    map['lastname'] = _lastName;
    map['title'] = _title;
    map['new_pass_key'] = _newPassKey;
    map['new_pass_key_requested'] = _newPassKeyRequested;
    map['email_verified_at'] = _emailVerifiedAt;
    map['email_verification_key'] = _emailVerificationKey;
    map['email_verification_sent_at'] = _emailVerificationSentAt;
    map['last_ip'] = _lastIp;
    map['last_login'] = _lastLogin;
    map['last_password_change'] = _lastPasswordChange;
    map['profile_image'] = _profileImage;
    map['direction'] = _direction;
    map['invoice_emails'] = _invoiceEmails;
    map['estimate_emails'] = _estimateEmails;
    map['credit_note_emails'] = _creditNoteEmails;
    map['contract_emails'] = _contractEmails;
    map['task_emails'] = _taskEmails;
    map['project_emails'] = _projectEmails;
    map['ticket_emails'] = _ticketEmails;
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
    map['staffid'] = _staffId;
    map['facebook'] = _facebook;
    map['linkedin'] = _linkedin;
    map['skype'] = _skype;
    map['last_activity'] = _lastActivity;
    map['role'] = _role;
    map['media_path_slug'] = _mediaPathSlug;
    map['is_not_staff'] = _isNotStaff;
    map['hourly_rate'] = _hourlyRate;
    map['two_factor_auth_enabled'] = _twoFactorAuthEnabled;
    map['two_factor_auth_code'] = _twoFactorAuthCode;
    map['two_factor_auth_code_requested'] = _twoFactorAuthCodeRequested;
    map['email_signature'] = _emailSignature;
    map['google_auth_secret'] = _googleAuthSecret;
    map['mail_password'] = _mailPassword;
    map['mail_signature'] = _mailSignature;
    map['last_email_check'] = _lastEmailCheck;
    map['whatsapp_auth_enabled'] = _whatsappAuthEnabled;
    map['whatsapp_auth_code'] = _whatsappAuthCode;
    map['whatsapp_auth_code_requested'] = _whatsappAuthCodeRequested;
    map['priorityid'] = _priorityId;
    map['from_name'] = _fromName;
    map['ticket_email'] = _ticketEmail;
    map['department_name'] = _departmentName;
    map['priority_name'] = _priorityName;
    map['service_name'] = _serviceName;
    map['status_name'] = _statusName;
    map['user_firstname'] = _userFirstName;
    map['user_lastname'] = _userLastName;
    map['staff_firstname'] = _staffFirstName;
    map['staff_lastname'] = _staffLastName;
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
