import 'package:flutex_admin/core/utils/method.dart';
import 'package:flutex_admin/core/utils/url_container.dart';
import 'package:flutex_admin/data/model/global/response_model/response_model.dart';
import 'package:flutex_admin/data/model/invoice/invoice_post_model.dart';
import 'package:flutex_admin/data/services/api_service.dart';

class InvoiceRepo {
  ApiClient apiClient;
  InvoiceRepo({required this.apiClient});

  Future<ResponseModel> getAllInvoices() async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.invoicesUrl}";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> getInvoiceDetails(invoiceId) async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.invoicesUrl}/$invoiceId";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> getAllCustomers() async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.customersUrl}";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> getCurrencies() async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.currenciesUrl}";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> getTaxes() async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.taxDataUrl}";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> getPaymentModes() async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.paymentModeUrl}";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> createInvoice(InvoicePostModel invoiceModel) async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.invoicesUrl}";

    Map<String, dynamic> params = {
      "clientid": invoiceModel.clientId,
      "number": invoiceModel.number,
      "date": invoiceModel.date,
      "duedate": invoiceModel.duedate,
      "currency": invoiceModel.currency,
      "newitems[0][description]": invoiceModel.firstItemName,
      "newitems[0][long_description]": invoiceModel.firstItemDescription,
      "newitems[0][qty]": invoiceModel.firstItemQty,
      "newitems[0][rate]": invoiceModel.firstItemRate,
      "newitems[0][unit]": invoiceModel.firstItemUnit,
      "subtotal": invoiceModel.subtotal,
      "total": invoiceModel.total,
      "billing_street": invoiceModel.billingStreet,
      "allowed_payment_modes": invoiceModel.allowedPaymentModes,
      //"billing_city": invoiceModel.billingCity,
      //"billing_state": invoiceModel.billingState,
      //"billing_zip": invoiceModel.billingZip,
      //"billing_country": invoiceModel.billingCountry,
      //"include_shipping": invoiceModel.includeShipping,
      //"show_shipping_on_invoice": invoiceModel.showShippingOnInvoice,
      //"shipping_street": invoiceModel.shippingStreet,
      //"shipping_city": invoiceModel.shippingCity,
      //"shipping_state": invoiceModel.shippingState,
      //"shipping_zip": invoiceModel.shippingZip,
      //"shipping_country": invoiceModel.shippingCountry,
      //"cancel_overdue_reminders": invoiceModel.cancelOverdueReminders,
      //"tags": invoiceModel.tags,
      //"sale_agent": invoiceModel.saleAgent,
      //"recurring": invoiceModel.recurring,
      //"discount_type": invoiceModel.discountType,
      //"repeat_every_custom": invoiceModel.repeatEveryCustom,
      //"repeat_type_custom": invoiceModel.repeatTypeCustom,
      //"cycles": invoiceModel.cycles,
      //"adminnote": invoiceModel.adminNote,
      //"removed_items": invoiceModel.removedItems,
      "clientnote": invoiceModel.clientNote,
      "terms": invoiceModel.terms,
    };

    int i = 0;
    for (var invoice in invoiceModel.newItems) {
      String invoiceItemName = invoice.itemNameController.text;
      String invoiceItemDescription = invoice.descriptionController.text;
      String invoiceItemQty = invoice.qtyController.text;
      String invoiceItemRate = invoice.rateController.text;
      String invoiceItemUnit = invoice.unitController.text;

      if (invoiceItemName.isNotEmpty && invoiceItemRate.isNotEmpty) {
        i = i + 1;
        params['newitems[$i][description]'] = invoiceItemName;
        params['newitems[$i][long_description]'] = invoiceItemDescription;
        params['newitems[$i][qty]'] = invoiceItemQty;
        params['newitems[$i][rate]'] = invoiceItemRate;
        params['newitems[$i][unit]'] = invoiceItemUnit;
        //params['newitems[$i][order]'] = '1';
        //params['newitems[0][taxname][]'] = 'CGST|9.00';
        //params['newitems[0][taxname][]'] = 'SGST|9.00';
      }
    }

    ResponseModel responseModel = await apiClient
        .request(url, Method.postMethod, params, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> deleteInvoice(invoiceId) async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.invoicesUrl}/$invoiceId";
    ResponseModel responseModel = await apiClient
        .request(url, Method.deleteMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> searchInvoice(keysearch) async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.invoicesUrl}/search/$keysearch";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }
}
