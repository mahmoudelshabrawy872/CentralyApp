class ProposalDetailsModel {
  ProposalDetailsModel({
    Data? data,
  }) {
    _data = data;
  }

  ProposalDetailsModel.fromJson(dynamic json) {
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
    String? projectId,
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
    String? isDefault,
    String? currencyId,
    String? currencyName,
    String? addedFromName,
    String? statusName,
    bool? visibleAttachmentsToCustomerFound,
    List<Attachments>? attachments,
    List<Items>? items,
    List<Comments>? comments,
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
    _projectId = projectId;
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
    _isDefault = isDefault;
    _currencyId = currencyId;
    _currencyName = currencyName;
    _addedFromName = addedFromName;
    _statusName = statusName;
    _visibleAttachmentsToCustomerFound = visibleAttachmentsToCustomerFound;
    _attachments = attachments;
    _items = items;
    _comments = comments;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _subject = json['subject'];
    _content = json['content'];
    _addedFrom = json['addedfrom'];
    _dateCreated = json['datecreated'];
    _total = json['total'];
    _subtotal = json['subtotal'];
    _totalTax = json['total_tax'];
    _adjustment = json['adjustment'];
    _discountPercent = json['discount_percent'];
    _discountTotal = json['discount_total'];
    _discountType = json['discount_type'];
    _showQuantityAs = json['show_quantity_as'];
    _currency = json['currency'];
    _openTill = json['open_till'];
    _date = json['date'];
    _relId = json['rel_id'];
    _relType = json['rel_type'];
    _assigned = json['assigned'];
    _hash = json['hash'];
    _proposalTo = json['proposal_to'];
    _projectId = json['project_id'];
    _country = json['country'];
    _zip = json['zip'];
    _state = json['state'];
    _city = json['city'];
    _address = json['address'];
    _email = json['email'];
    _phone = json['phone'];
    _allowComments = json['allow_comments'];
    _status = json['status'];
    _estimateId = json['estimate_id'];
    _invoiceId = json['invoice_id'];
    _dateConverted = json['date_converted'];
    _pipelineOrder = json['pipeline_order'];
    _isExpiryNotified = json['is_expiry_notified'];
    _acceptanceFirstname = json['acceptance_firstname'];
    _acceptanceLastname = json['acceptance_lastname'];
    _acceptanceEmail = json['acceptance_email'];
    _acceptanceDate = json['acceptance_date'];
    _acceptanceIp = json['acceptance_ip'];
    _signature = json['signature'];
    _shortLink = json['short_link'];
    _symbol = json['symbol'];
    _name = json['name'];
    _decimalSeparator = json['decimal_separator'];
    _thousandSeparator = json['thousand_separator'];
    _placement = json['placement'];
    _isDefault = json['isdefault'];
    _currencyId = json['currencyid'];
    _currencyName = json['currency_name'];
    _addedFromName = json['addedfrom_name'];
    _statusName = json['status_name'];
    _visibleAttachmentsToCustomerFound =
        json['visible_attachments_to_customer_found'];
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
    if (json['comments'] != null) {
      _comments = [];
      json['comments'].forEach((v) {
        _comments?.add(Comments.fromJson(v));
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
  String? _projectId;
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
  String? _isDefault;
  String? _currencyId;
  String? _currencyName;
  String? _addedFromName;
  String? _statusName;
  bool? _visibleAttachmentsToCustomerFound;
  List<Items>? _items;
  List<Attachments>? _attachments;
  List<Comments>? _comments;

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
  String? get projectId => _projectId;
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
  String? get isDefault => _isDefault;
  String? get currencyId => _currencyId;
  String? get currencyName => _currencyName;
  String? get addedFromName => _addedFromName;
  String? get statusName => _statusName;
  bool? get visibleAttachmentsToCustomerFound =>
      _visibleAttachmentsToCustomerFound;
  List<Items>? get items => _items;
  List<Attachments>? get attachments => _attachments;
  List<Comments>? get comments => _comments;

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
    map['project_id'] = _projectId;
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
    map['isdefault'] = _isDefault;
    map['currencyid'] = _currencyId;
    map['currency_name'] = _currencyName;
    map['addedfrom_name'] = _addedFromName;
    map['status_name'] = _statusName;
    map['visibleAttachmentsToCustomerFound'] =
        _visibleAttachmentsToCustomerFound;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    if (_attachments != null) {
      map['attachments'] = _attachments?.map((v) => v.toJson()).toList();
    }
    if (_comments != null) {
      map['comments'] = _comments?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Comments {
  Comments({
    String? id,
    String? content,
    String? contractId,
    String? staffId,
    String? dateAdded,
  }) {
    _id = id;
    _content = content;
    _contractId = contractId;
    _staffId = staffId;
    _dateAdded = dateAdded;
  }

  Comments.fromJson(dynamic json) {
    _id = json['id'];
    _content = json['content'];
    _contractId = json['contract_id'];
    _staffId = json['staffid'];
    _dateAdded = json['dateadded'];
  }
  String? _id;
  String? _content;
  String? _contractId;
  String? _staffId;
  String? _dateAdded;

  String? get id => _id;
  String? get content => _content;
  String? get contractId => _contractId;
  String? get staffId => _staffId;
  String? get dateAdded => _dateAdded;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['content'] = _content;
    map['contract_id'] = _contractId;
    map['staffid'] = _staffId;
    map['dateadded'] = _dateAdded;
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
