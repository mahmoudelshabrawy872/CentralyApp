class InvoicesModel {
  InvoicesModel({
    List<Data>? data,
  }) {
    _data = data;
  }

  InvoicesModel.fromJson(dynamic json) {
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
