class CustomerPostModel {
  final String company;
  final String? vat;
  final String? phoneNumber;
  final String? website;
  final String? groupsIn;
  final String? defaultLanguage;
  final String? defaultCurrency;
  final String? address;
  final String? city;
  final String? state;
  final String? zip;
  final String? partnershipType;
  final String? country;
  final String? billingStreet;
  final String? billingCity;
  final String? billingState;
  final String? billingZip;
  final String? billingCountry;
  final String? shippingStreet;
  final String? shippingCity;
  final String? shippingState;
  final String? shippingZip;
  final String? shippingCountry;

  CustomerPostModel({
    required this.company,
    this.vat,
    this.phoneNumber,
    this.website,
    this.groupsIn,
    this.defaultLanguage,
    this.defaultCurrency,
    this.address,
    this.city,
    this.state,
    this.zip,
    this.partnershipType,
    this.country,
    this.billingStreet,
    this.billingCity,
    this.billingState,
    this.billingZip,
    this.billingCountry,
    this.shippingStreet,
    this.shippingCity,
    this.shippingState,
    this.shippingZip,
    this.shippingCountry,
  });
}
