import 'package:flutex_admin/view/screens/auth/forgot_password/forget_password.dart';
import 'package:flutex_admin/view/screens/auth/login/login_screen.dart';
import 'package:flutex_admin/view/screens/contract/add_contract_screen.dart';
import 'package:flutex_admin/view/screens/contract/contract_details_screen.dart';
import 'package:flutex_admin/view/screens/contract/contracts_screen.dart';
import 'package:flutex_admin/view/screens/customers/add_contact_screen.dart';
import 'package:flutex_admin/view/screens/customers/add_customer_screen.dart';
import 'package:flutex_admin/view/screens/customers/customers_screen.dart';
import 'package:flutex_admin/view/screens/customers/cutstomer_details_screen.dart';
import 'package:flutex_admin/view/screens/estimate/add_estimate_screen.dart';
import 'package:flutex_admin/view/screens/estimate/estimate_details_screen.dart';
import 'package:flutex_admin/view/screens/estimate/estimate_screen.dart';
import 'package:flutex_admin/view/screens/home/home_screen.dart';
import 'package:flutex_admin/view/screens/intro_section/onboard_intro_screen.dart';
import 'package:flutex_admin/view/screens/invoice/add_invoice_screen.dart';
import 'package:flutex_admin/view/screens/invoice/invoice_details_screen.dart';
import 'package:flutex_admin/view/screens/invoice/invoice_screen.dart';
import 'package:flutex_admin/view/screens/item/item_details_screen.dart';
import 'package:flutex_admin/view/screens/item/item_screen.dart';
import 'package:flutex_admin/view/screens/lead/add_lead_screen.dart';
import 'package:flutex_admin/view/screens/lead/lead_details_screen.dart';
import 'package:flutex_admin/view/screens/lead/lead_screen.dart';
import 'package:flutex_admin/view/screens/menu/menu_screen.dart';
import 'package:flutex_admin/view/screens/payments/payment_details_screen.dart';
import 'package:flutex_admin/view/screens/payments/payment_screen.dart';
import 'package:flutex_admin/view/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:flutex_admin/view/screens/profile/profile_screen.dart';
import 'package:flutex_admin/view/screens/project/add_project_screen.dart';
import 'package:flutex_admin/view/screens/project/project_details_screen.dart';
import 'package:flutex_admin/view/screens/project/projects_screen.dart';
import 'package:flutex_admin/view/screens/proposal/add_proposal_screen.dart';
import 'package:flutex_admin/view/screens/proposal/proposal_details_screen.dart';
import 'package:flutex_admin/view/screens/proposal/proposal_screen.dart';
import 'package:flutex_admin/view/screens/splash/splash_screen.dart';
import 'package:flutex_admin/view/screens/ticket/add_ticket_screen.dart';
import 'package:flutex_admin/view/screens/ticket/ticket_details_screen.dart';
import 'package:flutex_admin/view/screens/ticket/ticket_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashScreen = "/splash_screen";
  static const String onboardScreen = '/onboard_screen';
  static const String loginScreen = "/login_screen";
  static const String forgotPasswordScreen = "/forgot_password_screen";

  static const String dashboardScreen = "/dashboard_screen";
  static const String customerScreen = "/customer_screen";
  static const String customerDetailsScreen = "/customer_details_screen";
  static const String addCustomerScreen = "/add_customer_screen";
  static const String addContactScreen = "/add_contact_screen";
  static const String projectScreen = "/project_screen";
  static const String projectDetailsScreen = "/project_details_screen";
  static const String addProjectScreen = "/add_project_screen";
  static const String invoiceScreen = "/invoice_screen";
  static const String invoiceDetailsScreen = "/invoice_details_screen";
  static const String addInvoiceScreen = "/add_invoice_screen";
  static const String contractScreen = "/contract_screen";
  static const String contractDetailsScreen = "/contract_details_screen";
  static const String addContractScreen = "/add_contract_screen";
  static const String ticketScreen = "/ticket_screen";
  static const String ticketDetailsScreen = "/ticket_details_screen";
  static const String addTicketScreen = "/add_ticket_screen";
  static const String leadScreen = "/lead_screen";
  static const String leadDetailsScreen = "/lead_details_screen";
  static const String addLeadScreen = "/add_lead_screen";
  static const String estimateScreen = "/estimate_screen";
  static const String estimateDetailsScreen = "/estimate_details_screen";
  static const String addEstimateScreen = "/add_estimate_screen";
  static const String proposalScreen = "/proposal_screen";
  static const String proposalDetailsScreen = "/proposal_details_screen";
  static const String addProposalScreen = "/add_proposal_screen";
  static const String paymentScreen = "/payment_screen";
  static const String paymentDetailsScreen = "/payment_details_screen";
  static const String itemScreen = "/item_screen";
  static const String itemDetailsScreen = "/item_details_screen";
  static const String settingsScreen = "/settings_screen";
  static const String profileScreen = "/profile_screen";
  static const String privacyScreen = "/privacy_screen";

  List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onboardScreen, page: () => const OnBoardIntroScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(
        name: forgotPasswordScreen, page: () => const ForgetPasswordScreen()),
    GetPage(name: dashboardScreen, page: () => const HomeScreen()),
    GetPage(name: customerScreen, page: () => const CustomersScreen()),
    GetPage(
        name: customerDetailsScreen,
        page: () => CustomerDetailsScreen(id: Get.arguments)),
    GetPage(name: addCustomerScreen, page: () => const AddCustomerScreen()),
    GetPage(
        name: addContactScreen,
        page: () => AddContactScreen(id: Get.arguments)),
    GetPage(name: projectScreen, page: () => const ProjectsScreen()),
    GetPage(
        name: projectDetailsScreen,
        page: () => ProjectDetailsScreen(id: Get.arguments)),
    GetPage(name: addProjectScreen, page: () => const AddProjectScreen()),
    GetPage(name: invoiceScreen, page: () => const InvoicesScreen()),
    GetPage(
        name: invoiceDetailsScreen,
        page: () => InvoiceDetailsScreen(id: Get.arguments)),
    GetPage(name: addInvoiceScreen, page: () => const AddInvoiceScreen()),
    GetPage(name: contractScreen, page: () => const ContractsScreen()),
    GetPage(
        name: contractDetailsScreen,
        page: () => ContractDetailsScreen(id: Get.arguments)),
    GetPage(name: addContractScreen, page: () => const AddContractScreen()),
    GetPage(name: ticketScreen, page: () => const TicketsScreen()),
    GetPage(
        name: ticketDetailsScreen,
        page: () => TicketDetailsScreen(id: Get.arguments)),
    GetPage(name: addTicketScreen, page: () => const AddTicketScreen()),
    GetPage(name: leadScreen, page: () => const LeadScreen()),
    GetPage(
        name: leadDetailsScreen,
        page: () => LeadDetailsScreen(id: Get.arguments)),
    GetPage(name: addLeadScreen, page: () => const AddLeadScreen()),
    GetPage(name: estimateScreen, page: () => const EstimateScreen()),
    GetPage(
        name: estimateDetailsScreen,
        page: () => EstimateDetailsScreen(id: Get.arguments)),
    GetPage(name: addEstimateScreen, page: () => const AddEstimateScreen()),
    GetPage(name: proposalScreen, page: () => const ProposalScreen()),
    GetPage(
        name: proposalDetailsScreen,
        page: () => ProposalDetailsScreen(id: Get.arguments)),
    GetPage(name: addProposalScreen, page: () => const AddProposalScreen()),
    GetPage(name: paymentScreen, page: () => const PaymentScreen()),
    GetPage(
        name: paymentDetailsScreen,
        page: () => PaymentDetailsScreen(id: Get.arguments)),
    GetPage(name: itemScreen, page: () => const ItemScreen()),
    GetPage(
        name: itemDetailsScreen,
        page: () => ItemDetailsScreen(id: Get.arguments)),
    GetPage(name: profileScreen, page: () => const ProfileScreen()),
    GetPage(name: settingsScreen, page: () => const MenuScreen()),
    GetPage(name: privacyScreen, page: () => const PrivacyPolicyScreen()),
  ];
}
