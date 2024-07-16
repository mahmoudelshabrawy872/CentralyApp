class PaymentDetailsModel {
  PaymentDetailsModel({
    Data? data,
  }) {
    _data = data;
  }

  PaymentDetailsModel.fromJson(dynamic json) {
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
    String? invoiceId,
    String? amount,
    String? paymentMode,
    String? paymentMethod,
    String? date,
    String? dateRecorded,
    String? note,
    String? transactionId,
    String? name,
    String? description,
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
    _name = name;
    _description = description;
    _showOnPdf = showOnPdf;
    _invoicesOnly = invoicesOnly;
    _expensesOnly = expensesOnly;
    _selectedByDefault = selectedByDefault;
    _active = active;
    _paymentId = paymentId;
  }
  Data.fromJson(dynamic json) {
    _id = json['id'];
    _invoiceId = json['invoiceid'];
    _amount = json['amount'];
    _paymentMode = json['paymentmode'];
    _paymentMethod = json['paymentmethod'];
    _date = json['date'];
    _dateRecorded = json['daterecorded'];
    _note = json['note'];
    _transactionId = json['transactionid'];
    _name = json['name'];
    _description = json['description'];
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
  String? _name;
  String? _description;
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
  String? get name => _name;
  String? get description => _description;
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
    map['name'] = _name;
    map['description'] = _description;
    map['show_on_pdf'] = _showOnPdf;
    map['invoices_only'] = _invoicesOnly;
    map['expenses_only'] = _expensesOnly;
    map['selected_by_default'] = _selectedByDefault;
    map['active'] = _active;
    map['paymentid'] = _paymentId;
    return map;
  }
}
