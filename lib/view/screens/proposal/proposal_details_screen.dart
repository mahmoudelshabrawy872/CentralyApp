import 'package:flutex_admin/core/helper/string_format_helper.dart';
import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/controller/proposal/proposal_controller.dart';
import 'package:flutex_admin/data/repo/proposal/proposal_repo.dart';
import 'package:flutex_admin/data/services/api_service.dart';
import 'package:flutex_admin/view/components/app-bar/custom_appbar.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';
import 'package:flutex_admin/view/components/divider/custom_divider.dart';
import 'package:flutex_admin/view/screens/proposal/widget/proposal_datatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProposalDetailsScreen extends StatefulWidget {
  const ProposalDetailsScreen({super.key, required this.id});
  final String id;

  @override
  State<ProposalDetailsScreen> createState() => _ProposalDetailsScreenState();
}

class _ProposalDetailsScreenState extends State<ProposalDetailsScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(ProposalRepo(apiClient: Get.find()));
    final controller = Get.put(ProposalController(proposalRepo: Get.find()));
    controller.isLoading = true;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadProposalDetails(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocalStrings.proposalDetails.tr,
      ),
      body: GetBuilder<ProposalController>(
        builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : RefreshIndicator(
                  onRefresh: () async {
                    await controller.loadProposalDetails(widget.id);
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.all(Dimensions.space10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width / 1.50,
                                child: Text(
                                  controller
                                          .proposalDetailsModel.data!.subject ??
                                      '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontSize: Dimensions.fontLarge),
                                ),
                              ),
                              Container(
                                  padding:
                                      const EdgeInsets.all(Dimensions.space5),
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.cardRadius),
                                      side: BorderSide(
                                          color: ColorResources
                                              .proposalStatusColor(controller
                                                  .proposalDetailsModel
                                                  .data!
                                                  .status!)),
                                    ),
                                  ),
                                  child: Text(
                                    Converter.proposalStatusString(controller
                                            .proposalDetailsModel
                                            .data!
                                            .status ??
                                        ''),
                                    style: TextStyle(
                                        color:
                                            ColorResources.proposalStatusColor(
                                                controller.proposalDetailsModel
                                                    .data!.status!)),
                                  ))
                            ],
                          ),
                          const CustomDivider(space: Dimensions.space10),
                          Padding(
                            padding: const EdgeInsets.all(Dimensions.space5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${LocalStrings.to.tr}: ${controller.proposalDetailsModel.data!.proposalTo}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(height: Dimensions.space5),
                                Text(
                                  '${LocalStrings.date.tr}: ${controller.proposalDetailsModel.data!.date!}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(
                                  height: Dimensions.space5,
                                ),
                                Text(
                                  '${LocalStrings.openTill.tr}: ${controller.proposalDetailsModel.data!.openTill}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: Dimensions.space5),
                          ProposalDataTable(),
                          Padding(
                            padding: const EdgeInsets.all(Dimensions.space5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      LocalStrings.subtotal.tr,
                                      style: lightDefault,
                                    ),
                                    const SizedBox(height: Dimensions.space10),
                                    Text(
                                      LocalStrings.totalTax.tr,
                                      style: lightDefault,
                                    ),
                                    const SizedBox(height: Dimensions.space10),
                                    Text(
                                      LocalStrings.adjustment.tr,
                                      style: lightDefault,
                                    ),
                                    const SizedBox(height: Dimensions.space10),
                                    Text(
                                      LocalStrings.total.tr,
                                      style: lightDefault,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: Dimensions.space10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${controller.proposalDetailsModel.data!.subtotal} ${controller.proposalDetailsModel.data!.currencyName}',
                                      style: regularDefault,
                                    ),
                                    const SizedBox(height: Dimensions.space10),
                                    Text(
                                      '${controller.proposalDetailsModel.data!.totalTax} ${controller.proposalDetailsModel.data!.currencyName}',
                                      style: regularDefault,
                                    ),
                                    const SizedBox(height: Dimensions.space10),
                                    Text(
                                      '${controller.proposalDetailsModel.data!.adjustment} ${controller.proposalDetailsModel.data!.currencyName}',
                                      style: regularDefault,
                                    ),
                                    const SizedBox(height: Dimensions.space10),
                                    Text(
                                      '${controller.proposalDetailsModel.data!.total!} ${controller.proposalDetailsModel.data!.currencyName}',
                                      style: regularDefault,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
