class InvoiceDetailsModel {
  InvoiceDetailsModel({
    Data? data,
  }) {
    _data = data;
  }

  InvoiceDetailsModel.fromJson(dynamic json) {
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
    String? sent,
    String? dateSend,
    String? clientId,
    String? deletedCustomerName,
    String? number,
    String? prefix,
    String? numberFormat,
    String? dateCreated,
    String? date,
    String? duedate,
    String? currency,
    String? couponId,
    String? subtotal,
    String? totalTax,
    String? couponDiscount,
    String? total,
    String? adjustment,
    String? addedFrom,
    String? hash,
    String? status,
    String? clientNote,
    String? adminNote,
    String? lastOverdueReminder,
    String? lastDueReminder,
    String? cancelOverdueReminders,
    String? allowedPaymentModes,
    String? token,
    String? discountPercent,
    String? discountTotal,
    String? discountType,
    String? recurring,
    String? recurringType,
    String? cutomRecurring,
    String? cycles,
    String? totalCycles,
    String? isRecurringFrom,
    String? lastRecurringDate,
    String? terms,
    String? saleAgent,
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
    String? includeShipping,
    String? showShippingOnInvoice,
    String? showQuantityAs,
    String? projectId,
    String? subscriptionId,
    String? shortLink,
    String? isDefault,
    String? currencyId,
    String? currencySymbol,
    String? currencyName,
    String? currencyplacement,
    String? decimalSeparator,
    String? thousandSeparator,
    String? totalLeftToPay,
    bool? visibleAttachmentsToCustomerFound,
    String? scheduledEmail,
    List<Item>? items,
    List<Attachments>? attachments,
    ProjectData? projectData,
    ClientData? clientData,
    List<Payments>? payments,
    List<CustomField>? customfields,
  }) {
    _id = id;
    _sent = sent;
    _dateSend = dateSend;
    _clientId = clientId;
    _deletedCustomerName = deletedCustomerName;
    _number = number;
    _prefix = prefix;
    _numberFormat = numberFormat;
    _dateCreated = dateCreated;
    _date = date;
    _duedate = duedate;
    _currency = currency;
    _couponId = couponId;
    _subtotal = subtotal;
    _totalTax = totalTax;
    _couponDiscount = couponDiscount;
    _total = total;
    _adjustment = adjustment;
    _addedFrom = addedFrom;
    _hash = hash;
    _status = status;
    _clientNote = clientNote;
    _adminNote = adminNote;
    _lastOverdueReminder = lastOverdueReminder;
    _lastDueReminder = lastDueReminder;
    _cancelOverdueReminders = cancelOverdueReminders;
    _allowedPaymentModes = allowedPaymentModes;
    _token = token;
    _discountPercent = discountPercent;
    _discountTotal = discountTotal;
    _discountType = discountType;
    _recurring = recurring;
    _recurringType = recurringType;
    _cutomRecurring = cutomRecurring;
    _cycles = cycles;
    _totalCycles = totalCycles;
    _isRecurringFrom = isRecurringFrom;
    _lastRecurringDate = lastRecurringDate;
    _terms = terms;
    _saleAgent = saleAgent;
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
    _includeShipping = includeShipping;
    _showShippingOnInvoice = showShippingOnInvoice;
    _showQuantityAs = showQuantityAs;
    _projectId = projectId;
    _subscriptionId = subscriptionId;
    _shortLink = shortLink;
    _isDefault = isDefault;
    _currencyId = currencyId;
    _currencySymbol = currencySymbol;
    _currencyName = currencyName;
    _currencyplacement = currencyplacement;
    _decimalSeparator = decimalSeparator;
    _thousandSeparator = thousandSeparator;
    _totalLeftToPay = totalLeftToPay;
    _visibleAttachmentsToCustomerFound = visibleAttachmentsToCustomerFound;
    _scheduledEmail = scheduledEmail;
    _items = items;
    _attachments = attachments;
    _projectData = projectData;
    _clientData = clientData;
    _payments = payments;
    _customFields = customFields;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _sent = json['sent'];
    _dateSend = json['datesend'];
    _clientId = json['clientid'];
    _deletedCustomerName = json['deleted_customer_name'];
    _number = json['number'];
    _prefix = json['prefix'];
    _numberFormat = json['number_format'];
    _dateCreated = json['datecreated'];
    _date = json['date'];
    _duedate = json['duedate'];
    _currency = json['currency'];
    _couponId = json['coupon_id'];
    _subtotal = json['subtotal'];
    _totalTax = json['total_tax'];
    _couponDiscount = json['coupon_discount'];
    _total = json['total'];
    _adjustment = json['adjustment'];
    _addedFrom = json['addedfrom'];
    _hash = json['hash'];
    _status = json['status'];
    _clientNote = json['clientnote'];
    _adminNote = json['adminnote'];
    _lastOverdueReminder = json['last_overdue_reminder'];
    _lastDueReminder = json['last_due_reminder'];
    _cancelOverdueReminders = json['cancel_overdue_reminders'];
    _allowedPaymentModes = json['allowed_payment_modes'];
    _token = json['token'];
    _discountPercent = json['discount_percent'];
    _discountTotal = json['discount_total'];
    _discountType = json['discount_type'];
    _recurring = json['recurring'];
    _recurringType = json['recurring_type'];
    _cutomRecurring = json['custom_recurring'];
    _cycles = json['cycles'];
    _totalCycles = json['total_cycles'];
    _isRecurringFrom = json['is_recurring_from'];
    _lastRecurringDate = json['last_recurring_date'];
    _terms = json['terms'];
    _saleAgent = json['sale_agent'];
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
    _includeShipping = json['include_shipping'];
    _showShippingOnInvoice = json['show_shipping_on_invoice'];
    _showQuantityAs = json['show_quantity_as'];
    _projectId = json['project_id'];
    _subscriptionId = json['subscription_id'];
    _shortLink = json['short_link'];
    _isDefault = json['isdefault'];
    _currencyId = json['currencyid'];
    _currencySymbol = json['symbol'];
    _currencyName = json['currency_name'];
    _currencyplacement = json['placement'];
    _decimalSeparator = json['decimal_separator'];
    _thousandSeparator = json['thousand_separator'];
    _totalLeftToPay = json['total_left_to_pay'];
    _visibleAttachmentsToCustomerFound =
        json['visible_attachments_to_customer_found'];
    _scheduledEmail = json['scheduled_email'];

    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Item.fromJson(v));
      });
    }
    if (json['attachments'] != null) {
      _attachments = [];
      json['attachments'].forEach((v) {
        _attachments?.add(Attachments.fromJson(v));
      });
    }
    if (json['project_data'] != null) {
      _projectData = ProjectData.fromJson(json['project_data']);
    }
    if (json['client'] != null) {
      _clientData = ClientData.fromJson(json['client']);
    }
    if (json['payments'] != null) {
      _payments = [];
      json['payments'].forEach((v) {
        _payments?.add(Payments.fromJson(v));
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
  String? _sent;
  String? _dateSend;
  String? _clientId;
  String? _deletedCustomerName;
  String? _number;
  String? _prefix;
  String? _numberFormat;
  String? _dateCreated;
  String? _date;
  String? _duedate;
  String? _currency;
  String? _couponId;
  String? _subtotal;
  String? _totalTax;
  String? _couponDiscount;
  String? _total;
  String? _adjustment;
  String? _addedFrom;
  String? _hash;
  String? _status;
  String? _clientNote;
  String? _adminNote;
  String? _lastOverdueReminder;
  String? _lastDueReminder;
  String? _cancelOverdueReminders;
  String? _allowedPaymentModes;
  String? _token;
  String? _discountPercent;
  String? _discountTotal;
  String? _discountType;
  String? _recurring;
  String? _recurringType;
  String? _cutomRecurring;
  String? _cycles;
  String? _totalCycles;
  String? _isRecurringFrom;
  String? _lastRecurringDate;
  String? _terms;
  String? _saleAgent;
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
  String? _includeShipping;
  String? _showShippingOnInvoice;
  String? _showQuantityAs;
  String? _projectId;
  String? _subscriptionId;
  String? _shortLink;
  String? _isDefault;
  String? _currencyId;
  String? _currencySymbol;
  String? _currencyName;
  String? _currencyplacement;
  String? _decimalSeparator;
  String? _thousandSeparator;
  String? _totalLeftToPay;
  bool? _visibleAttachmentsToCustomerFound;
  String? _scheduledEmail;
  ProjectData? _projectData;
  ClientData? _clientData;
  List<Item>? _items;
  List<Payments>? _payments;
  List<Attachments>? _attachments;
  List<CustomField>? _customFields;

  String? get id => _id;
  String? get sent => _sent;
  String? get dateSend => _dateSend;
  String? get clientId => _clientId;
  String? get deletedCustomerName => _deletedCustomerName;
  String? get number => _number;
  String? get prefix => _prefix;
  String? get numberFormat => _numberFormat;
  String? get dateCreated => _dateCreated;
  String? get date => _date;
  String? get duedate => _duedate;
  String? get currency => _currency;
  String? get couponId => _couponId;
  String? get subtotal => _subtotal;
  String? get totalTax => _totalTax;
  String? get couponDiscount => _couponDiscount;
  String? get total => _total;
  String? get adjustment => _adjustment;
  String? get addedFrom => _addedFrom;
  String? get hash => _hash;
  String? get status => _status;
  String? get clientNote => _clientNote;
  String? get adminNote => _adminNote;
  String? get lastOverdueReminder => _lastOverdueReminder;
  String? get lastDueReminder => _lastDueReminder;
  String? get cancelOverdueReminders => _cancelOverdueReminders;
  String? get allowedPaymentModes => _allowedPaymentModes;
  String? get token => _token;
  String? get discountPercent => _discountPercent;
  String? get discountTotal => _discountTotal;
  String? get discountType => _discountType;
  String? get recurring => _recurring;
  String? get recurringType => _recurringType;
  String? get cutomRecurring => _cutomRecurring;
  String? get cycles => _cycles;
  String? get totalCycles => _totalCycles;
  String? get isRecurringFrom => _isRecurringFrom;
  String? get lastRecurringDate => _lastRecurringDate;
  String? get terms => _terms;
  String? get saleAgent => _saleAgent;
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
  String? get includeShipping => _includeShipping;
  String? get showShippingOnInvoice => _showShippingOnInvoice;
  String? get showQuantityAs => _showQuantityAs;
  String? get projectId => _projectId;
  String? get subscriptionId => _subscriptionId;
  String? get shortLink => _shortLink;
  String? get isDefault => _isDefault;
  String? get currencyId => _currencyId;
  String? get currencySymbol => _currencySymbol;
  String? get currencyName => _currencyName;
  String? get currencyplacement => _currencyplacement;
  String? get decimalSeparator => _decimalSeparator;
  String? get thousandSeparator => _thousandSeparator;
  String? get totalLeftToPay => _totalLeftToPay;
  bool? get visibleAttachmentsToCustomerFound =>
      _visibleAttachmentsToCustomerFound;
  String? get scheduledEmail => _scheduledEmail;
  ProjectData? get projectData => _projectData;
  ClientData? get clientData => _clientData;
  List<Item>? get items => _items;
  List<Payments>? get payments => _payments;
  List<Attachments>? get attachments => _attachments;
  List<CustomField>? get customFields => _customFields;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sent'] = _sent;
    map['datesend'] = _dateSend;
    map['clientid'] = _clientId;
    map['deleted_customer_name'] = _deletedCustomerName;
    map['number'] = _number;
    map['prefix'] = _prefix;
    map['number_format'] = _numberFormat;
    map['datecreated'] = _dateCreated;
    map['date'] = _date;
    map['duedate'] = _duedate;
    map['currency'] = _currency;
    map['couponId'] = _couponId;
    map['subtotal'] = _subtotal;
    map['total_tax'] = _totalTax;
    map['coupon_discount'] = _couponDiscount;
    map['total'] = _total;
    map['adjustment'] = _adjustment;
    map['addedfrom'] = _addedFrom;
    map['hash'] = _hash;
    map['status'] = _status;
    map['clientnote'] = _clientNote;
    map['adminnote'] = _adminNote;
    map['last_overdue_reminder'] = _lastOverdueReminder;
    map['last_due_reminder'] = _lastDueReminder;
    map['cancel_overdue_reminders'] = _cancelOverdueReminders;
    map['allowed_payment_modes'] = _allowedPaymentModes;
    map['token'] = _token;
    map['discount_percent'] = _discountPercent;
    map['discount_total'] = _discountTotal;
    map['discount_type'] = _discountType;
    map['recurring'] = _recurring;
    map['recurring_type'] = _recurringType;
    map['custom_recurring'] = _cutomRecurring;
    map['cycles'] = _cycles;
    map['total_cycles'] = _totalCycles;
    map['is_recurring_from'] = _isRecurringFrom;
    map['last_recurring_date'] = _lastRecurringDate;
    map['terms'] = _terms;
    map['sale_agent'] = _saleAgent;
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
    map['include_shipping'] = _includeShipping;
    map['show_shipping_on_invoice'] = _showShippingOnInvoice;
    map['show_quantity_as'] = _showQuantityAs;
    map['project_id'] = _projectId;
    map['subscription_id'] = _subscriptionId;
    map['short_link'] = _shortLink;
    map['isdefault'] = _isDefault;
    map['currencyid'] = _currencyId;
    map['currencySymbol'] = _currencySymbol;
    map['currency_name'] = _currencyName;
    map['placement'] = _currencyplacement;
    map['decimal_separator'] = _decimalSeparator;
    map['thousand_separator'] = _thousandSeparator;
    map['total_left_to_pay'] = _totalLeftToPay;
    map['visible_attachments_to_customer_found'] =
        _visibleAttachmentsToCustomerFound;
    map['scheduled_email'] = _scheduledEmail;
    if (_projectData != null) {
      map['project_data'] = _projectData?.toJson();
    }
    if (_clientData != null) {
      map['client'] = _clientData?.toJson();
    }
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    if (_attachments != null) {
      map['attachments'] = _attachments?.map((v) => v.toJson()).toList();
    }
    if (_payments != null) {
      map['payments'] = _payments?.map((v) => v.toJson()).toList();
    }
    if (_customFields != null) {
      map['customfields'] = _customFields?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ProjectData {
  ProjectData({
    String? id,
    String? name,
    String? description,
    String? status,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _status = status;
  }

  ProjectData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _status = json['status'];
  }

  String? _id;
  String? _name;
  String? _description;
  String? _status;

  String? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['status'] = _status;
    return map;
  }
}

class ClientData {
  ClientData({
    String? userid,
    String? company,
    String? phoneNumber,
    String? country,
    String? city,
    String? zip,
    String? state,
    String? address,
    String? website,
    String? dateCreated,
    String? active,
  }) {
    _userid = userid;
    _company = company;
    _phoneNumber = phoneNumber;
    _country = country;
    _city = city;
    _zip = zip;
    _state = state;
    _address = address;
    _website = website;
    _dateCreated = dateCreated;
    _active = active;
  }

  ClientData.fromJson(Map<String, dynamic> json) {
    _userid = json['userid'];
    _company = json['company'];
    _phoneNumber = json['phonenumber'];
    _country = json['country'];
    _city = json['city'];
    _zip = json['zip'];
    _state = json['state'];
    _address = json['address'];
    _website = json['website'];
    _dateCreated = json['datecreated'];
    _active = json['active'];
  }

  String? _userid;
  String? _company;
  String? _phoneNumber;
  String? _country;
  String? _city;
  String? _zip;
  String? _state;
  String? _address;
  String? _website;
  String? _dateCreated;
  String? _active;

  String? get userid => _userid;
  String? get company => _company;
  String? get phoneNumber => _phoneNumber;
  String? get country => _country;
  String? get city => _city;
  String? get zip => _zip;
  String? get state => _state;
  String? get address => _address;
  String? get website => _website;
  String? get dateCreated => _dateCreated;
  String? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userid'] = _userid;
    map['company'] = _company;
    map['phonenumber'] = _phoneNumber;
    map['country'] = _country;
    map['city'] = _city;
    map['zip'] = _zip;
    map['state'] = _state;
    map['address'] = _address;
    map['website'] = _website;
    map['datecreated'] = _dateCreated;
    map['active'] = _active;
    return map;
  }
}

class Item {
  Item({
    String? id,
    String? relId,
    String? relType,
    String? description,
    String? longDescription,
    String? qty,
    String? rate,
    String? unit,
    String? itemOrder,
    List<CustomField>? customfields,
  }) {
    _id = id;
    _relId = relId;
    _relType = relType;
    _description = description;
    _longDescription = longDescription;
    _qty = qty;
    _rate = rate;
    _unit = unit;
    _itemOrder = itemOrder;
    _customFields = customFields;
  }

  Item.fromJson(dynamic json) {
    _id = json['id'];
    _relId = json['rel_id'];
    _relType = json['rel_type'];
    _description = json['description'];
    _longDescription = json['long_description'];
    _qty = json['qty'];
    _rate = json['rate'];
    _unit = json['unit'];
    _itemOrder = json['item_order'];
    if (json['customfields'] != null) {
      _customFields = [];
      json['customfields'].forEach((v) {
        _customFields?.add(CustomField.fromJson(v));
      });
    }
  }

  String? _id;
  String? _relId;
  String? _relType;
  String? _description;
  String? _longDescription;
  String? _qty;
  String? _rate;
  String? _unit;
  String? _itemOrder;
  List<CustomField>? _customFields;

  String? get id => _id;
  String? get relId => _relId;
  String? get relType => _relType;
  String? get description => _description;
  String? get longDescription => _longDescription;
  String? get qty => _qty;
  String? get rate => _rate;
  String? get unit => _unit;
  String? get itemOrder => _itemOrder;
  List<CustomField>? get customFields => _customFields;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['rel_id'] = _relId;
    map['rel_type'] = _relType;
    map['description'] = _description;
    map['long_description'] = _longDescription;
    map['qty'] = _qty;
    map['rate'] = _rate;
    map['unit'] = _unit;
    map['item_order'] = _itemOrder;
    if (_customFields != null) {
      map['customfields'] = _customFields?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Payments {
  Payments({
    String? id,
    String? invoiceId,
    String? amount,
    String? paymentMode,
    String? paymentMethod,
    String? date,
    String? dateRecorded,
    String? note,
    String? transactionId,
    String? methodName,
    String? methodDescription,
    String? showOnPdf,
    String? invoicesOnly,
    String? expensesOnly,
    String? selectedByDefault,
    String? active,
    String? paymentId,
  }) {
    _id = id;
    _invoiceId = invoiceId;
    _amount = amount;
    _paymentMode = paymentMode;
    _paymentMethod = paymentMethod;
    _date = date;
    _dateRecorded = dateRecorded;
    _note = note;
    _transactionId = transactionId;
    _methodName = methodName;
    _methodDescription = methodDescription;
    _showOnPdf = showOnPdf;
    _invoicesOnly = invoicesOnly;
    _expensesOnly = expensesOnly;
    _selectedByDefault = selectedByDefault;
    _active = active;
    _paymentId = paymentId;
  }

  Payments.fromJson(dynamic json) {
    _id = json['id'];
    _invoiceId = json['invoiceid'];
    _amount = json['amount'];
    _paymentMode = json['paymentmode'];
    _paymentMethod = json['paymentmethod'];
    _date = json['date'];
    _dateRecorded = json['daterecorded'];
    _note = json['note'];
    _transactionId = json['transactionid'];
    _methodName = json['name'];
    _methodDescription = json['description'];
    _showOnPdf = json['show_on_pdf'];
    _invoicesOnly = json['invoices_only'];
    _expensesOnly = json['expenses_only'];
    _selectedByDefault = json['selected_by_default'];
    _active = json['active'];
    _paymentId = json['paymentid'];
  }

  String? _id;
  String? _invoiceId;
  String? _amount;
  String? _paymentMode;
  String? _paymentMethod;
  String? _date;
  String? _dateRecorded;
  String? _note;
  String? _transactionId;
  String? _methodName;
  String? _methodDescription;
  String? _showOnPdf;
  String? _invoicesOnly;
  String? _expensesOnly;
  String? _selectedByDefault;
  String? _active;
  String? _paymentId;

  String? get id => _id;
  String? get invoiceId => _invoiceId;
  String? get amount => _amount;
  String? get paymentMode => _paymentMode;
  String? get paymentMethod => _paymentMethod;
  String? get date => _date;
  String? get dateRecorded => _dateRecorded;
  String? get note => _note;
  String? get transactionId => _transactionId;
  String? get methodName => _methodName;
  String? get methodDescription => _methodDescription;
  String? get showOnPdf => _showOnPdf;
  String? get invoicesOnly => _invoicesOnly;
  String? get expensesOnly => _expensesOnly;
  String? get selectedByDefault => _selectedByDefault;
  String? get active => _active;
  String? get paymentId => _paymentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['invoiceid'] = _invoiceId;
    map['amount'] = _amount;
    map['paymentmode'] = _paymentMode;
    map['paymentmethod'] = _paymentMethod;
    map['date'] = _date;
    map['daterecorded'] = _dateRecorded;
    map['note'] = _note;
    map['transactionid'] = _transactionId;
    map['name'] = _methodName;
    map['description'] = _methodDescription;
    map['show_on_pdf'] = _showOnPdf;
    map['invoices_only'] = _invoicesOnly;
    map['expenses_only'] = _expensesOnly;
    map['selected_by_default'] = _selectedByDefault;
    map['active'] = _active;
    map['paymentid'] = _paymentId;
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
