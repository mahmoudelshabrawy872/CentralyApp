class EstimateDetailsModel {
  EstimateDetailsModel({
    Data? data,
  }) {
    _data = data;
  }

  EstimateDetailsModel.fromJson(dynamic json) {
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
    String? dateSent,
    String? clientId,
    String? projectId,
    String? number,
    String? prefix,
    String? numberFormat,
    String? dateCreated,
    String? date,
    String? expiryDate,
    String? subTotal,
    String? total,
    String? totalTax,
    String? adjustment,
    String? addedFrom,
    String? status,
    String? clientNote,
    String? adminNote,
    String? discountPercent,
    String? discountTotal,
    String? discountType,
    String? invoiceId,
    String? invoiceDate,
    String? terms,
    String? referenceNo,
    String? showQuantityAs,
    String? currency,
    String? currencySymbol,
    String? currencyName,
    String? currencyplacement,
    String? decimalSeparator,
    String? thousandSeparator,
    String? clientName,
    String? projectName,
    String? addedFromName,
    String? statusName,
    ClientData? clientData,
    List<Items>? items,
    List<Attachments>? attachments,
  }) {
    _id = id;
    _sent = sent;
    _dateSent = dateSent;
    _clientId = clientId;
    _projectId = projectId;
    _number = number;
    _prefix = prefix;
    _numberFormat = numberFormat;
    _dateCreated = dateCreated;
    _date = date;
    _expiryDate = expiryDate;
    _subTotal = subTotal;
    _total = total;
    _totalTax = totalTax;
    _adjustment = adjustment;
    _addedFrom = addedFrom;
    _status = status;
    _clientNote = clientNote;
    _adminNote = adminNote;
    _discountPercent = discountPercent;
    _discountTotal = discountTotal;
    _discountType = discountType;
    _invoiceId = invoiceId;
    _invoiceDate = invoiceDate;
    _terms = terms;
    _referenceNo = referenceNo;
    _showQuantityAs = showQuantityAs;
    _currency = currency;
    _currencySymbol = currencySymbol;
    _currencyName = currencyName;
    _currencyplacement = currencyplacement;
    _decimalSeparator = decimalSeparator;
    _thousandSeparator = thousandSeparator;
    _clientName = clientName;
    _projectName = projectName;
    _addedFromName = addedFromName;
    _statusName = statusName;
    _clientData = clientData;
    _items = items;
    _attachments = attachments;
  }

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _sent = json['sent'];
    _dateSent = json['datesend'];
    _clientId = json['clientid'];
    _projectId = json['project_id'];
    _number = json['number'];
    _prefix = json['prefix'];
    _numberFormat = json['number_format'];
    _dateCreated = json['datecreated'];
    _date = json['date'];
    _expiryDate = json['expirydate'];
    _subTotal = json['subtotal'];
    _total = json['total'];
    _totalTax = json['total_tax'];
    _adjustment = json['adjustment'];
    _addedFrom = json['addedfrom'];
    _status = json['status'];
    _clientNote = json['clientnote'];
    _adminNote = json['adminnote'];
    _discountPercent = json['discount_percent'];
    _discountTotal = json['discount_total'];
    _discountType = json['discount_type'];
    _invoiceId = json['invoiceid'];
    _invoiceDate = json['invoiced_date'];
    _terms = json['terms'];
    _referenceNo = json['reference_no'];
    _showQuantityAs = json['show_quantity_as'];
    _currency = json['currency'];
    _currencySymbol = json['symbol'];
    _currencyName = json['name'];
    _currencyplacement = json['placement'];
    _decimalSeparator = json['decimal_separator'];
    _thousandSeparator = json['thousand_separator'];
    _clientName = json['client_name'];
    _projectName = json['project_name'];
    _addedFromName = json['addedfrom_name'];
    _statusName = json['status_name'];

    _clientData = ClientData.fromJson(json['client']);

    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }

    if (json['attachments'] != null) {
      _attachments = [];
      json['attachments'].forEach((v) {
        _attachments?.add(Attachments.fromJson(v));
      });
    }
  }

  String? _id;
  String? _sent;
  String? _dateSent;
  String? _clientId;
  String? _projectId;
  String? _number;
  String? _prefix;
  String? _numberFormat;
  String? _dateCreated;
  String? _date;
  String? _expiryDate;
  String? _subTotal;
  String? _total;
  String? _totalTax;
  String? _adjustment;
  String? _addedFrom;
  String? _status;
  String? _clientNote;
  String? _adminNote;
  String? _discountPercent;
  String? _discountTotal;
  String? _discountType;
  String? _invoiceId;
  String? _invoiceDate;
  String? _terms;
  String? _referenceNo;
  String? _showQuantityAs;
  String? _currency;
  String? _currencySymbol;
  String? _currencyName;
  String? _currencyplacement;
  String? _decimalSeparator;
  String? _thousandSeparator;
  String? _clientName;
  String? _projectName;
  String? _addedFromName;
  String? _statusName;

  ClientData? _clientData;
  List<Items>? _items;
  List<Attachments>? _attachments;

  String? get id => _id;
  String? get sent => _sent;
  String? get dateSent => _dateSent;
  String? get clientId => _clientId;
  String? get projectId => _projectId;
  String? get number => _number;
  String? get prefix => _prefix;
  String? get numberFormat => _numberFormat;
  String? get dateCreated => _dateCreated;
  String? get date => _date;
  String? get expiryDate => _expiryDate;
  String? get subTotal => _subTotal;
  String? get total => _total;
  String? get totalTax => _totalTax;
  String? get adjustment => _adjustment;
  String? get addedFrom => _addedFrom;
  String? get status => _status;
  String? get clientNote => _clientNote;
  String? get adminNote => _adminNote;
  String? get discountPercent => _discountPercent;
  String? get discountTotal => _discountTotal;
  String? get discountType => _discountType;
  String? get invoiceId => _invoiceId;
  String? get invoiceDate => _invoiceDate;
  String? get terms => _terms;
  String? get referenceNo => _referenceNo;
  String? get showQuantityAs => _showQuantityAs;
  String? get currency => _currency;
  String? get currencySymbol => _currencySymbol;
  String? get currencyName => _currencyName;
  String? get currencyplacement => _currencyplacement;
  String? get decimalSeparator => _decimalSeparator;
  String? get thousandSeparator => _thousandSeparator;
  String? get clientName => _clientName;
  String? get projectName => _projectName;
  String? get addedFromName => _addedFromName;
  String? get statusName => _statusName;
  ClientData? get clientData => _clientData;
  List<Items>? get items => _items;
  List<Attachments>? get attachments => _attachments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    _id = map['id'];
    _sent = map['sent'];
    _dateSent = map['datesend'];
    _clientId = map['clientid'];
    _projectId = map['project_id'];
    _number = map['number'];
    _prefix = map['prefix'];
    _numberFormat = map['number_format'];
    _dateCreated = map['datecreated'];
    _date = map['date'];
    _expiryDate = map['expirydate'];
    _subTotal = map['subtotal'];
    _total = map['total'];
    _totalTax = map['total_tax'];
    _adjustment = map['adjustment'];
    _addedFrom = map['addedfrom'];
    _status = map['status'];
    _clientNote = map['clientnote'];
    _adminNote = map['adminnote'];
    _discountPercent = map['discount_percent'];
    _discountTotal = map['discount_total'];
    _discountType = map['discount_type'];
    _invoiceId = map['invoiceid'];
    _invoiceDate = map['invoiced_date'];
    _terms = map['terms'];
    _referenceNo = map['reference_no'];
    _showQuantityAs = map['show_quantity_as'];
    _currency = map['currency'];
    _currencySymbol = map['symbol'];
    _currencyName = map['name'];
    _currencyplacement = map['placement'];
    _decimalSeparator = map['decimal_separator'];
    _thousandSeparator = map['thousand_separator'];
    _clientName = map['client_name'];
    _projectName = map['project_name'];
    _addedFromName = map['addedfrom_name'];
    _statusName = map['status_name'];

    if (_clientData != null) {
      map['client'] = _clientData?.toJson();
    }
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    if (_attachments != null) {
      map['attachments'] = _attachments?.map((v) => v.toJson()).toList();
    }
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

class Items {
  Items({
    String? id,
    String? relId,
    String? relType,
    String? description,
    String? longDescription,
    String? qty,
    String? rate,
    String? unit,
    String? itemOrder,
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
  }

  Items.fromJson(dynamic json) {
    _id = json['id'];
    _relId = json['rel_id'];
    _relType = json['rel_type'];
    _description = json['description'];
    _longDescription = json['long_description'];
    _qty = json['qty'];
    _rate = json['rate'];
    _unit = json['unit'];
    _itemOrder = json['item_order'];
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

  String? get id => _id;
  String? get relId => _relId;
  String? get relType => _relType;
  String? get description => _description;
  String? get longDescription => _longDescription;
  String? get qty => _qty;
  String? get rate => _rate;
  String? get unit => _unit;
  String? get itemOrder => _itemOrder;

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
