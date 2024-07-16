class CustomersModel {
  CustomersModel({
    List<Customer>? data,
  }) {
    _data = data;
  }

  CustomersModel.fromJson(dynamic json) {
    _data = [];
    json.forEach((v) {
      _data?.add(Customer.fromJson(v));
    });
  }
  List<Customer>? _data;

  List<Customer>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map[''] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Customer {
  Customer({
    String? userId,
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
    String? leadId,
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
    List<CustomField>? customFields,
  }) {
    _userId = userId;
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
    _leadId = leadId;
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
    _customFields = customFields;
  }

  Customer.fromJson(dynamic json) {
    _userId = json['userid'];
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
    _leadId = json['leadid'];
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
    if (json['customfields'] != null) {
      _customFields = [];
      json['customfields'].forEach((v) {
        _customFields?.add(CustomField.fromJson(v));
      });
    }
  }

  String? _userId;
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
  String? _leadId;
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
  List<CustomField>? _customFields;

  String? get userId => _userId;
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
  String? get leadId => _leadId;
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
  List<CustomField>? get customFields => _customFields;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userid'] = _userId;
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
    map['leadid'] = _leadId;
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
