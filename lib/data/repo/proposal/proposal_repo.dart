import 'package:flutex_admin/core/utils/method.dart';
import 'package:flutex_admin/core/utils/url_container.dart';
import 'package:flutex_admin/data/model/global/response_model/response_model.dart';
import 'package:flutex_admin/data/model/proposal/proposal_post_model.dart';
import 'package:flutex_admin/data/services/api_service.dart';

class ProposalRepo {
  ApiClient apiClient;
  ProposalRepo({required this.apiClient});

  Future<ResponseModel> getAllProposals() async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.proposalsUrl}";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> getProposalDetails(proposalId) async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.proposalsUrl}/$proposalId";
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

  Future<ResponseModel> createProposal(ProposalPostModel proposalModel) async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.proposalsUrl}";

    Map<String, dynamic> params = {
      "subject": proposalModel.subject,
      "rel_type": proposalModel.related,
      "rel_id": proposalModel.relId,
      "proposal_to": proposalModel.proposalTo,
      "date": proposalModel.date,
      "open_till": proposalModel.openTill,
      "currency": proposalModel.currency,
      //"discount_type": proposalModel.discountType,
      "status": proposalModel.status,
      //"assigned": proposalModel.assigned,
      "email": proposalModel.email,
      "newitems[0][description]": proposalModel.firstItemName,
      "newitems[0][long_description]": proposalModel.firstItemDescription,
      "newitems[0][qty]": proposalModel.firstItemQty,
      "newitems[0][rate]": proposalModel.firstItemRate,
      "newitems[0][unit]": proposalModel.firstItemUnit,
      "subtotal": proposalModel.subtotal,
      "total": proposalModel.total,
    };

    int i = 0;
    for (var proposal in proposalModel.newItems) {
      String proposalItemName = proposal.itemNameController.text;
      String proposalItemDescription = proposal.descriptionController.text;
      String proposalItemQty = proposal.qtyController.text;
      String proposalItemRate = proposal.rateController.text;
      String proposalItemUnit = proposal.unitController.text;

      if (proposalItemName.isNotEmpty && proposalItemRate.isNotEmpty) {
        i = i + 1;
        params['newitems[$i][description]'] = proposalItemName;
        params['newitems[$i][long_description]'] = proposalItemDescription;
        params['newitems[$i][qty]'] = proposalItemQty;
        params['newitems[$i][rate]'] = proposalItemRate;
        params['newitems[$i][unit]'] = proposalItemUnit;
        //params['newitems[$i][order]'] = '1';
        //params['newitems[0][taxname][]'] = 'CGST|9.00';
        //params['newitems[0][taxname][]'] = 'SGST|9.00';
      }
    }

    ResponseModel responseModel = await apiClient
        .request(url, Method.postMethod, params, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> deleteProposal(proposalId) async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.proposalsUrl}/$proposalId";
    ResponseModel responseModel = await apiClient
        .request(url, Method.deleteMethod, null, passHeader: true);
    return responseModel;
  }

  Future<ResponseModel> searchProposal(keysearch) async {
    String url =
        "${UrlContainer.baseUrl}${UrlContainer.proposalsUrl}/search/$keysearch";
    ResponseModel responseModel =
        await apiClient.request(url, Method.getMethod, null, passHeader: true);
    return responseModel;
  }
}
