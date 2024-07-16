import 'dart:async';
import 'dart:convert';
import 'package:flutex_admin/data/model/item/item_details_model.dart';
import 'package:flutex_admin/data/model/item/item_model.dart';
import 'package:flutex_admin/data/repo/item/item_repo.dart';
import 'package:get/get.dart';
import 'package:flutex_admin/data/model/global/response_model/response_model.dart';
import 'package:flutex_admin/view/components/snack_bar/show_custom_snackbar.dart';

class ItemController extends GetxController {
  ItemRepo itemRepo;
  ItemController({required this.itemRepo});

  bool isLoading = true;
  bool isSubmitLoading = false;
  ItemsModel itemsModel = ItemsModel();
  ItemDetailsModel itemDetailsModel = ItemDetailsModel();

  Future<void> initialData({bool shouldLoad = true}) async {
    isLoading = shouldLoad ? true : false;
    update();

    await loadItems();
    isLoading = false;
    update();
  }

  Future<void> loadItems() async {
    ResponseModel responseModel = await itemRepo.getAllItems();
    itemsModel = ItemsModel.fromJson(jsonDecode(responseModel.responseJson));
    isLoading = false;
    update();
  }

  Future<void> loadItemDetails(itemId) async {
    ResponseModel responseModel = await itemRepo.getItemDetails(itemId);
    if (responseModel.statusCode == 200) {
      itemDetailsModel =
          ItemDetailsModel.fromJson(jsonDecode(responseModel.responseJson));
    } else {
      CustomSnackBar.error(errorList: [responseModel.message]);
    }

    isLoading = false;
    update();
  }
}
