class UrlContainer {
  static const String domainUrl = 'https://YOUR_PERFEX_CRM_URL.com';
  static const String baseUrl = '$domainUrl/api/';

  static RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  // Authentication
  static const String loginUrl = 'login/authentication';
  static const String logoutUrl = 'login/logout';
  static const String forgotPasswordUrl = 'login/forgot_password';

  // Pages
  static const String dashboardUrl = 'overview';
  static const String customersUrl = 'customers';
  static const String contactsUrl = 'contacts';
  static const String projectsUrl = 'projects';
  static const String invoicesUrl = 'invoices';
  static const String contractsUrl = 'contracts';
  static const String estimatesUrl = 'estimates';
  static const String proposalsUrl = 'proposals';
  static const String ticketsUrl = 'tickets';
  static const String leadsUrl = 'leads';
  static const String paymentsUrl = 'payments';
  static const String itemsUrl = 'items';
  static const String commonDataUrl = 'common';
  static const String currenciesUrl = 'common/currencies';
  static const String taxDataUrl = 'common/tax_data';
  static const String paymentModeUrl = 'common/payment_mode';
  static const String privacyPolicyUrl = 'policy-pages';
}
