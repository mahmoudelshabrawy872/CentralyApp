class HomeResponseModel {
  HomeResponseModel({
    bool? status,
    String? message,
    Overview? overview,
    Data? data,
    Staff? staff,
    MenuItems? menuItems,
  }) {
    _status = status;
    _message = message;
    _overview = overview;
    _data = data;
    _staff = staff;
    _menuItems = menuItems;
  }

  HomeResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _overview =
        json['overview'] != null ? Overview.fromJson(json['overview']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _staff = json['staff'] != null ? Staff.fromJson(json['staff']) : null;
    _menuItems = json['menu_items'] != null
        ? MenuItems.fromJson(json['menu_items'])
        : null;
  }
  bool? _status;
  String? _message;
  Overview? _overview;
  Data? _data;
  Staff? _staff;
  MenuItems? _menuItems;

  bool? get status => _status;
  String? get message => _message;
  Overview? get overview => _overview;
  Data? get data => _data;
  Staff? get staff => _staff;
  MenuItems? get menuItems => _menuItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_overview != null) {
      map['overview'] = _overview?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (_staff != null) {
      map['staff'] = _staff?.toJson();
    }
    if (_menuItems != null) {
      map['menu_items'] = _menuItems?.toJson();
    }
    return map;
  }
}

class Overview {
  Overview({
    String? perfexLogo,
    String? perfexLogoDark,
    int? totalInvoices,
    int? invoicesAwaitingPaymentTotal,
    String? invoicesAwaitingPaymentPercent,
    int? totalLeads,
    int? leadsConvertedTotal,
    String? leadsConvertedPercent,
    int? totalProjects,
    int? projectsInProgressTotal,
    String? inProgressProjectsPercent,
    int? totalTasks,
    int? notFinishedTasksTotal,
    String? notFinishedTasksPercent,
  }) {
    _perfexLogo = perfexLogo;
    _perfexLogoDark = perfexLogoDark;
    _totalInvoices = totalInvoices;
    _invoicesAwaitingPaymentTotal = invoicesAwaitingPaymentTotal;
    _invoicesAwaitingPaymentPercent = invoicesAwaitingPaymentPercent;
    _totalLeads = totalLeads;
    _leadsConvertedTotal = leadsConvertedTotal;
    _leadsConvertedPercent = leadsConvertedPercent;
    _totalProjects = totalProjects;
    _projectsInProgressTotal = projectsInProgressTotal;
    _inProgressProjectsPercent = inProgressProjectsPercent;
    _totalTasks = totalTasks;
    _notFinishedTasksTotal = notFinishedTasksTotal;
    _notFinishedTasksPercent = notFinishedTasksPercent;
  }

  Overview.fromJson(dynamic json) {
    _perfexLogo = json['perfex_logo'];
    _perfexLogoDark = json['perfex_logo_dark'];
    _totalInvoices = json['total_invoices'];
    _invoicesAwaitingPaymentTotal = json['invoices_awaiting_payment_total'];
    _invoicesAwaitingPaymentPercent = json['invoices_awaiting_payment_percent'];
    _totalLeads = json['total_leads'];
    _leadsConvertedTotal = json['leads_converted_total'];
    _leadsConvertedPercent = json['leads_converted_percent'];
    _totalProjects = json['total_projects'];
    _projectsInProgressTotal = json['projects_in_progress_total'];
    _inProgressProjectsPercent = json['projects_in_progress_percent'];
    _totalTasks = json['total_tasks'];
    _notFinishedTasksTotal = json['tasks_not_finished_total'];
    _notFinishedTasksPercent = json['tasks_not_finished_percent'];
  }
  String? _perfexLogo;
  String? _perfexLogoDark;
  int? _totalInvoices;
  int? _invoicesAwaitingPaymentTotal;
  String? _invoicesAwaitingPaymentPercent;
  int? _totalLeads;
  int? _leadsConvertedTotal;
  String? _leadsConvertedPercent;
  int? _totalProjects;
  int? _projectsInProgressTotal;
  String? _inProgressProjectsPercent;
  int? _totalTasks;
  int? _notFinishedTasksTotal;
  String? _notFinishedTasksPercent;

  String? get perfexLogo => _perfexLogo;
  String? get perfexLogoDark => _perfexLogoDark;
  int? get totalInvoices => _totalInvoices;
  int? get invoicesAwaitingPaymentTotal => _invoicesAwaitingPaymentTotal;
  String? get invoicesAwaitingPaymentPercent => _invoicesAwaitingPaymentPercent;
  int? get totalLeads => _totalLeads;
  int? get leadsConvertedTotal => _leadsConvertedTotal;
  String? get leadsConvertedPercent => _leadsConvertedPercent;
  int? get totalProjects => _totalProjects;
  int? get projectsInProgressTotal => _projectsInProgressTotal;
  String? get inProgressProjectsPercent => _inProgressProjectsPercent;
  int? get totalTasks => _totalTasks;
  int? get notFinishedTasksTotal => _notFinishedTasksTotal;
  String? get notFinishedTasksPercent => _notFinishedTasksPercent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['perfex_logo_dark'] = _perfexLogo;
    map['perfex_logo'] = _perfexLogoDark;
    map['total_invoices'] = _totalInvoices;
    map['invoices_awaiting_payment_total'] = _invoicesAwaitingPaymentTotal;
    map['invoices_awaiting_payment_percent'] = _invoicesAwaitingPaymentPercent;
    map['total_leads'] = _totalLeads;
    map['leads_converted_total'] = _leadsConvertedTotal;
    map['leads_converted_percent'] = _leadsConvertedPercent;
    map['total_projects'] = _totalProjects;
    map['projects_in_progress_total'] = _projectsInProgressTotal;
    map['projects_in_progress_percent'] = _inProgressProjectsPercent;
    map['total_tasks'] = _totalTasks;
    map['tasks_not_finished_total'] = _notFinishedTasksTotal;
    map['tasks_not_finished_percent'] = _notFinishedTasksPercent;
    return map;
  }
}

class Data {
  Data({
    List<DataField>? invoices,
    List<DataField>? estimates,
    List<DataField>? proposals,
    List<DataField>? projects,
    List<DataField>? leads,
    List<DataField>? tickets,
    CustomerSummery? customers,
  }) {
    _invoices = invoices;
    _estimates = estimates;
    _proposals = proposals;
    _projects = projects;
    _leads = leads;
    _tickets = tickets;
    _customers = customers;
  }

  Data.fromJson(dynamic json) {
    if (json['invoices'] != null) {
      _invoices = [];
      json['invoices'].forEach((v) {
        _invoices?.add(DataField.fromJson(v));
      });
    }
    if (json['estimates'] != null) {
      _estimates = [];
      json['estimates'].forEach((v) {
        _estimates?.add(DataField.fromJson(v));
      });
    }
    if (json['proposals'] != null) {
      _proposals = [];
      json['proposals'].forEach((v) {
        _proposals?.add(DataField.fromJson(v));
      });
    }
    if (json['projects'] != null) {
      _projects = [];
      json['projects'].forEach((v) {
        _projects?.add(DataField.fromJson(v));
      });
    }
    if (json['leads'] != null) {
      _leads = [];
      json['leads'].forEach((v) {
        _leads?.add(DataField.fromJson(v));
      });
    }
    if (json['tickets'] != null) {
      _tickets = [];
      json['tickets'].forEach((v) {
        _tickets?.add(DataField.fromJson(v));
      });
    }
    _customers = CustomerSummery.fromJson(json['customers']);
  }

  List<DataField>? _invoices;
  List<DataField>? _estimates;
  List<DataField>? _proposals;
  List<DataField>? _projects;
  List<DataField>? _leads;
  List<DataField>? _tickets;
  CustomerSummery? _customers;

  List<DataField>? get invoices => _invoices;
  List<DataField>? get estimates => _estimates;
  List<DataField>? get proposals => _proposals;
  List<DataField>? get projects => _projects;
  List<DataField>? get leads => _leads;
  List<DataField>? get tickets => _tickets;
  CustomerSummery? get customers => _customers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_invoices != null) {
      map['invoices'] = _invoices?.map((v) => v.toJson()).toList();
    }
    if (_estimates != null) {
      map['estimates'] = _estimates?.map((v) => v.toJson()).toList();
    }
    if (_proposals != null) {
      map['proposals'] = _proposals?.map((v) => v.toJson()).toList();
    }
    if (_projects != null) {
      map['projects'] = _projects?.map((v) => v.toJson()).toList();
    }
    if (_leads != null) {
      map['leads'] = _leads?.map((v) => v.toJson()).toList();
    }
    if (_tickets != null) {
      map['tickets'] = _tickets?.map((v) => v.toJson()).toList();
    }
    if (_customers != null) {
      map['customers'] = _customers?.toJson();
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
    String? facebook,
    String? linkedin,
    String? phoneNumber,
    String? skype,
    String? dateCreated,
    String? profileImage,
    String? admin,
    String? role,
    String? active,
    String? defaultLanguage,
    String? direction,
    String? mediaPathSlug,
    String? isNotStaff,
    String? hourlyRate,
  }) {
    _staffId = staffId;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _facebook = facebook;
    _linkedin = linkedin;
    _phoneNumber = phoneNumber;
    _skype = skype;
    _dateCreated = dateCreated;
    _profileImage = profileImage;
    _admin = admin;
    _role = role;
    _active = active;
    _defaultLanguage = defaultLanguage;
    _direction = direction;
    _mediaPathSlug = mediaPathSlug;
    _isNotStaff = isNotStaff;
    _hourlyRate = hourlyRate;
  }

  Staff.fromJson(dynamic json) {
    _staffId = json['staffid'];
    _email = json['email'];
    _firstName = json['firstname'];
    _lastName = json['lastname'];
    _facebook = json['facebook'];
    _linkedin = json['linkedin'];
    _phoneNumber = json['phonenumber'];
    _skype = json['skype'];
    _dateCreated = json['datecreated'];
    _profileImage = json['profile_image'];
    _admin = json['admin'];
    _role = json['role'];
    _active = json['active'];
    _defaultLanguage = json['default_language'];
    _direction = json['direction'];
    _mediaPathSlug = json['media_path_slug'];
    _isNotStaff = json['is_not_staff'];
    _hourlyRate = json['hourly_rate'];
  }
  String? _staffId;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _facebook;
  String? _linkedin;
  String? _phoneNumber;
  String? _skype;
  String? _dateCreated;
  String? _profileImage;
  String? _admin;
  String? _role;
  String? _active;
  String? _defaultLanguage;
  String? _direction;
  String? _mediaPathSlug;
  String? _isNotStaff;
  String? _hourlyRate;

  String? get staffId => _staffId;
  String? get email => _email;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get facebook => _facebook;
  String? get linkedin => _linkedin;
  String? get phoneNumber => _phoneNumber;
  String? get skype => _skype;
  String? get dateCreated => _dateCreated;
  String? get profileImage => _profileImage;
  String? get admin => _admin;
  String? get role => _role;
  String? get active => _active;
  String? get defaultLanguage => _defaultLanguage;
  String? get direction => _direction;
  String? get mediaPathSlug => _mediaPathSlug;
  String? get isNotStaff => _isNotStaff;
  String? get hourlyRate => _hourlyRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['staffId'] = _staffId;
    map['email'] = _email;
    map['firstname'] = _firstName;
    map['lastname'] = _lastName;
    map['facebook'] = _facebook;
    map['linkedin'] = _linkedin;
    map['phonenumber'] = _phoneNumber;
    map['skype'] = _skype;
    map['datecreated'] = _dateCreated;
    map['profile_image'] = _profileImage;
    map['admin'] = _admin;
    map['role'] = _role;
    map['active'] = _active;
    map['default_language'] = _defaultLanguage;
    map['direction'] = _direction;
    map['media_path_slug'] = _mediaPathSlug;
    map['is_not_staff'] = _isNotStaff;
    map['hourly_rate'] = _hourlyRate;
    return map;
  }
}

class MenuItems {
  MenuItems({
    bool? customers,
    bool? proposals,
    bool? estimates,
    bool? invoices,
    bool? payments,
    bool? creditNotes,
    bool? items,
    bool? subscriptions,
    bool? expenses,
    bool? contracts,
    bool? projects,
    bool? tasks,
    bool? tickets,
    bool? leads,
    bool? staff,
  }) {
    _customers = customers;
    _proposals = proposals;
    _estimates = estimates;
    _invoices = invoices;
    _payments = payments;
    _creditNotes = creditNotes;
    _items = items;
    _subscriptions = subscriptions;
    _expenses = expenses;
    _contracts = contracts;
    _projects = projects;
    _tasks = tasks;
    _tickets = tickets;
    _leads = leads;
    _staff = staff;
  }

  MenuItems.fromJson(dynamic json) {
    _customers = json['customers'];
    _proposals = json['proposals'];
    _estimates = json['estimates'];
    _invoices = json['invoices'];
    _payments = json['payments'];
    _creditNotes = json['credit_notes'];
    _items = json['items'];
    _subscriptions = json['subscriptions'];
    _expenses = json['expenses'];
    _contracts = json['contracts'];
    _projects = json['projects'];
    _tasks = json['tasks'];
    _tickets = json['tickets'];
    _leads = json['leads'];
    _staff = json['staff'];
  }
  bool? _customers;
  bool? _proposals;
  bool? _estimates;
  bool? _invoices;
  bool? _payments;
  bool? _creditNotes;
  bool? _items;
  bool? _subscriptions;
  bool? _expenses;
  bool? _contracts;
  bool? _projects;
  bool? _tasks;
  bool? _tickets;
  bool? _leads;
  bool? _staff;

  bool? get customers => _customers;
  bool? get proposals => _proposals;
  bool? get estimates => _estimates;
  bool? get invoices => _invoices;
  bool? get payments => _payments;
  bool? get creditNotes => _creditNotes;
  bool? get items => _items;
  bool? get subscriptions => _subscriptions;
  bool? get expenses => _expenses;
  bool? get contracts => _contracts;
  bool? get projects => _projects;
  bool? get tasks => _tasks;
  bool? get tickets => _tickets;
  bool? get leads => _leads;
  bool? get staff => _staff;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customers'] = _customers;
    map['proposals'] = _proposals;
    map['estimates'] = _estimates;
    map['invoices'] = _invoices;
    map['payments'] = _payments;
    map['credit_notes'] = _creditNotes;
    map['items'] = _items;
    map['subscriptions'] = _subscriptions;
    map['expenses'] = _expenses;
    map['contracts'] = _contracts;
    map['projects'] = _projects;
    map['tasks'] = _tasks;
    map['tickets'] = _tickets;
    map['leads'] = _leads;
    map['staff'] = _staff;
    return map;
  }
}

class DataField {
  DataField({
    String? status,
    int? total,
    String? percent,
  }) {
    _status = status;
    _total = total;
    _percent = percent;
  }

  DataField.fromJson(dynamic json) {
    _status = json['status'];
    _total = json['total'];
    _percent = json['percent'];
  }

  String? _status;
  int? _total;
  String? _percent;

  String? get status => _status;
  int? get total => _total;
  String? get percent => _percent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['total'] = _total;
    map['percent'] = _percent;
    return map;
  }
}

class CustomerSummery {
  CustomerSummery({
    int? customersTotal,
    int? customersActive,
    int? customersInactive,
    int? contactsActive,
    int? contactsInactive,
    int? contactsLastLogin,
  }) {
    _customersTotal = customersTotal;
    _customersActive = customersActive;
    _customersInactive = customersInactive;
    _contactsActive = contactsActive;
    _contactsInactive = contactsInactive;
    _contactsLastLogin = contactsLastLogin;
  }

  CustomerSummery.fromJson(dynamic json) {
    _customersTotal = json['customers_total'];
    _customersActive = json['customers_active'];
    _customersInactive = json['customers_inactive'];
    _contactsActive = json['contacts_active'];
    _contactsInactive = json['contacts_inactive'];
    _contactsLastLogin = json['contacts_last_login'];
  }
  int? _userid;
  int? _customersTotal;
  int? _customersActive;
  int? _customersInactive;
  int? _contactsActive;
  int? _contactsInactive;
  int? _contactsLastLogin;

  int? get userid => _userid;
  int? get customersTotal => _customersTotal;
  int? get customersActive => _customersActive;
  int? get customersInactive => _customersInactive;
  int? get contactsActive => _contactsActive;
  int? get contactsInactive => _contactsInactive;
  int? get contactsLastLogin => _contactsLastLogin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userid'] = _userid;
    map['customers_total'] = _customersTotal;
    map['customers_active'] = _customersActive;
    map['customers_inactive'] = _customersInactive;
    map['contacts_active'] = _contactsActive;
    map['contacts_inactive'] = _contactsInactive;
    map['contacts_last_login'] = _contactsLastLogin;
    return map;
  }
}
