class ProposalsModel {
  ProposalsModel({
    List<Data>? data,
  }) {
    _data = data;
  }

  ProposalsModel.fromJson(dynamic json) {
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
    String? subject,
    String? content,
    String? addedFrom,
    String? dateCreated,
    String? total,
    String? subtotal,
    String? totalTax,
    String? adjustment,
    String? discountPercent,
    String? discountTotal,
    String? discountType,
    String? showQuantityAs,
    String? currency,
    String? openTill,
    String? date,
    String? relId,
    String? relType,
    String? assigned,
    String? hash,
    String? proposalTo,
    String? country,
    String? zip,
    String? state,
    String? city,
    String? address,
    String? email,
    String? phone,
    String? allowComments,
    String? status,
    String? estimateId,
    String? invoiceId,
    String? dateConverted,
    String? pipelineOrder,
    String? isExpiryNotified,
    String? acceptanceFirstname,
    String? acceptanceLastname,
    String? acceptanceEmail,
    String? acceptanceDate,
    String? acceptanceIp,
    String? signature,
    String? shortLink,
    String? symbol,
    String? name,
    String? decimalSeparator,
    String? thousandSeparator,
    String? placement,
    String? isdefault,
    String? currencyid,
    String? currencyName,
    List<Attachment>? attachments,
    List<Item>? items,
    bool? visibleAttachmentsToCustomerFound,
    List<CustomField>? customfields,
  }) {
    _id = id;
    _subject = subject;
    _content = content;
    _addedFrom = addedFrom;
    _dateCreated = dateCreated;
    _total = total;
    _subtotal = subtotal;
    _totalTax = totalTax;
    _adjustment = adjustment;
    _discountPercent = discountPercent;
    _discountTotal = discountTotal;
    _discountType = discountType;
    _showQuantityAs = showQuantityAs;
    _currency = currency;
    _openTill = openTill;
    _date = date;
    _relId = relId;
    _relType = relType;
    _assigned = assigned;
    _hash = hash;
    _proposalTo = proposalTo;
    _country = country;
    _zip = zip;
    _state = state;
    _city = city;
    _address = address;
    _email = email;
    _phone = phone;
    _allowComments = allowComments;
    _status = status;
    _estimateId = estimateId;
    _invoiceId = invoiceId;
    _dateConverted = dateConverted;
    _pipelineOrder = pipelineOrder;
    _isExpiryNotified = isExpiryNotified;
    _acceptanceFirstname = acceptanceFirstname;
    _acceptanceLastname = acceptanceLastname;
    _acceptanceEmail = acceptanceEmail;
    _acceptanceDate = acceptanceDate;
    _acceptanceIp = acceptanceIp;
    _signature = signature;
    _shortLink = shortLink;
    _symbol = symbol;
    _name = name;
    _decimalSeparator = decimalSeparator;
    _thousandSeparator = thousandSeparator;
    _placement = placement;
    _isdefault = isdefault;
    _currencyid = currencyid;
    _currencyName = currencyName;
    _attachments = attachments;
    _items = items;
    _visibleAttachmentsToCustomerFound = visibleAttachmentsToCustomerFound;
    _customfields = customfields;
  }
  Data.fromJson(dynamic json) {
    _id = json["id"];
    _subject = json["subject"];
    _content = json["content"];
    _addedFrom = json["addedfrom"];
    _dateCreated = json["datecreated"];
    _total = json["total"];
    _subtotal = json["subtotal"];
    _totalTax = json["total_tax"];
    _adjustment = json["adjustment"];
    _discountPercent = json["discount_percent"];
    _discountTotal = json["discount_total"];
    _discountType = json["discount_type"];
    _showQuantityAs = json["show_quantity_as"];
    _currency = json["currency"];
    _openTill = json["open_till"];
    _date = json["date"];
    _relId = json["rel_id"];
    _relType = json["rel_type"];
    _assigned = json["assigned"];
    _hash = json["hash"];
    _proposalTo = json["proposal_to"];
    _country = json["country"];
    _zip = json["zip"];
    _state = json["state"];
    _city = json["city"];
    _address = json["address"];
    _email = json["email"];
    _phone = json["phone"];
    _allowComments = json["allow_comments"];
    _status = json["status"];
    _estimateId = json["estimate_id"];
    _invoiceId = json["invoice_id"];
    _dateConverted = json["date_converted"];
    _pipelineOrder = json["pipeline_order"];
    _isExpiryNotified = json["is_expiry_notified"];
    _acceptanceFirstname = json["acceptance_firstname"];
    _acceptanceLastname = json["acceptance_lastname"];
    _acceptanceEmail = json["acceptance_email"];
    _acceptanceDate = json["acceptance_date"];
    _acceptanceIp = json["acceptance_ip"];
    _signature = json["signature"];
    _shortLink = json["short_link"];
    _symbol = json["symbol"];
    _name = json["name"];
    _decimalSeparator = json["decimal_separator"];
    _thousandSeparator = json["thousand_separator"];
    _placement = json["placement"];
    _isdefault = json["isdefault"];
    _currencyid = json["currencyid"];
    _currencyName = json["currency_name"];
    _visibleAttachmentsToCustomerFound =
        json["visible_attachments_to_customer_found"];

    if (json['attachments'] != null) {
      _attachments = [];
      json['attachments'].forEach((v) {
        _attachments?.add(Attachment.fromJson(v));
      });
    }
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Item.fromJson(v));
      });
    }
    if (json['customfields'] != null) {
      _customfields = [];
      json['customfields'].forEach((v) {
        _customfields?.add(CustomField.fromJson(v));
      });
    }
  }

  String? _id;
  String? _subject;
  String? _content;
  String? _addedFrom;
  String? _dateCreated;
  String? _total;
  String? _subtotal;
  String? _totalTax;
  String? _adjustment;
  String? _discountPercent;
  String? _discountTotal;
  String? _discountType;
  String? _showQuantityAs;
  String? _currency;
  String? _openTill;
  String? _date;
  String? _relId;
  String? _relType;
  String? _assigned;
  String? _hash;
  String? _proposalTo;
  String? _country;
  String? _zip;
  String? _state;
  String? _city;
  String? _address;
  String? _email;
  String? _phone;
  String? _allowComments;
  String? _status;
  String? _estimateId;
  String? _invoiceId;
  String? _dateConverted;
  String? _pipelineOrder;
  String? _isExpiryNotified;
  String? _acceptanceFirstname;
  String? _acceptanceLastname;
  String? _acceptanceEmail;
  String? _acceptanceDate;
  String? _acceptanceIp;
  String? _signature;
  String? _shortLink;
  String? _symbol;
  String? _name;
  String? _decimalSeparator;
  String? _thousandSeparator;
  String? _placement;
  String? _isdefault;
  String? _currencyid;
  String? _currencyName;
  List<Attachment>? _attachments;
  List<Item>? _items;
  bool? _visibleAttachmentsToCustomerFound;
  List<CustomField>? _customfields;

  String? get id => _id;
  String? get subject => _subject;
  String? get content => _content;
  String? get addedFrom => _addedFrom;
  String? get dateCreated => _dateCreated;
  String? get total => _total;
  String? get subtotal => _subtotal;
  String? get totalTax => _totalTax;
  String? get adjustment => _adjustment;
  String? get discountPercent => _discountPercent;
  String? get discountTotal => _discountTotal;
  String? get discountType => _discountType;
  String? get showQuantityAs => _showQuantityAs;
  String? get currency => _currency;
  String? get openTill => _openTill;
  String? get date => _date;
  String? get relId => _relId;
  String? get relType => _relType;
  String? get assigned => _assigned;
  String? get hash => _hash;
  String? get proposalTo => _proposalTo;
  String? get country => _country;
  String? get zip => _zip;
  String? get state => _state;
  String? get city => _city;
  String? get address => _address;
  String? get email => _email;
  String? get phone => _phone;
  String? get allowComments => _allowComments;
  String? get status => _status;
  String? get estimateId => _estimateId;
  String? get invoiceId => _invoiceId;
  String? get dateConverted => _dateConverted;
  String? get pipelineOrder => _pipelineOrder;
  String? get isExpiryNotified => _isExpiryNotified;
  String? get acceptanceFirstname => _acceptanceFirstname;
  String? get acceptanceLastname => _acceptanceLastname;
  String? get acceptanceEmail => _acceptanceEmail;
  String? get acceptanceDate => _acceptanceDate;
  String? get acceptanceIp => _acceptanceIp;
  String? get signature => _signature;
  String? get shortLink => _shortLink;
  String? get symbol => _symbol;
  String? get name => _name;
  String? get decimalSeparator => _decimalSeparator;
  String? get thousandSeparator => _thousandSeparator;
  String? get placement => _placement;
  String? get isdefault => _isdefault;
  String? get currencyid => _currencyid;
  String? get currencyName => _currencyName;
  List<Attachment>? get attachments => _attachments;
  List<Item>? get items => _items;
  bool? get visibleAttachmentsToCustomerFound =>
      _visibleAttachmentsToCustomerFound;
  List<CustomField>? get customfields => _customfields;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['subject'] = _subject;
    map['content'] = _content;
    map['addedfrom'] = _addedFrom;
    map['datecreated'] = _dateCreated;
    map['total'] = _total;
    map['subtotal'] = _subtotal;
    map['total_tax'] = _totalTax;
    map['adjustment'] = _adjustment;
    map['discount_percent'] = _discountPercent;
    map['discount_total'] = _discountTotal;
    map['discount_type'] = _discountType;
    map['show_quantity_as'] = _showQuantityAs;
    map['currency'] = _currency;
    map['open_till'] = _openTill;
    map['date'] = _date;
    map['rel_id'] = _relId;
    map['rel_type'] = _relType;
    map['assigned'] = _assigned;
    map['hash'] = _hash;
    map['proposal_to'] = _proposalTo;
    map['country'] = _country;
    map['zip'] = _zip;
    map['state'] = _state;
    map['city'] = _city;
    map['address'] = _address;
    map['email'] = _email;
    map['phone'] = _phone;
    map['allow_comments'] = _allowComments;
    map['status'] = _status;
    map['estimate_id'] = _estimateId;
    map['invoice_id'] = _invoiceId;
    map['date_converted'] = _dateConverted;
    map['pipeline_order'] = _pipelineOrder;
    map['is_expiry_notified'] = _isExpiryNotified;
    map['acceptance_firstname'] = _acceptanceFirstname;
    map['acceptance_lastname'] = _acceptanceLastname;
    map['acceptance_email'] = _acceptanceEmail;
    map['acceptance_date'] = _acceptanceDate;
    map['acceptance_ip'] = _acceptanceIp;
    map['signature'] = _signature;
    map['short_link'] = _shortLink;
    map['symbol'] = _symbol;
    map['name'] = _name;
    map['decimal_separator'] = _decimalSeparator;
    map['thousand_separator'] = _thousandSeparator;
    map['placement'] = _placement;
    map['isdefault'] = _isdefault;
    map['currencyid'] = _currencyid;
    map['currency_name'] = _currencyName;
    map['attachments'] = _attachments;
    map['items'] = _items;
    map['visible_attachments_to_customer_found'] =
        _visibleAttachmentsToCustomerFound;
    map['customfields'] = _customfields;
    return map;
  }
}

class Attachment {
  Attachment({
    String? id,
    String? ticketId,
    String? replyId,
    String? fileName,
    String? fileType,
    String? dateAdded,
  }) {
    _id = id;
    _ticketId = ticketId;
    _replyId = replyId;
    _fileName = fileName;
    _fileType = fileType;
    _dateAdded = dateAdded;
  }

  Attachment.fromJson(dynamic json) {
    _id = json['id'];
    _ticketId = json['ticketid'];
    _replyId = json['replyid'];
    _fileName = json['file_name'];
    _fileType = json['filetype'];
    _dateAdded = json['dateadded'];
  }

  String? _id;
  String? _ticketId;
  String? _replyId;
  String? _fileName;
  String? _fileType;
  String? _dateAdded;

  String? get id => _id;
  String? get ticketId => _ticketId;
  String? get replyId => _replyId;
  String? get fileName => _fileName;
  String? get fileType => _fileType;
  String? get dateAdded => _dateAdded;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ticketid'] = _ticketId;
    map['replyid'] = _replyId;
    map['file_name'] = _fileName;
    map['filetype'] = _fileType;
    map['dateadded'] = _dateAdded;
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
