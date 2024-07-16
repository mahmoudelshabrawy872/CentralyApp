import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/data/model/lead/lead_details_model.dart';
import 'package:flutex_admin/view/components/no_data.dart';
import 'package:flutex_admin/view/screens/lead/widget/attachment_card.dart';
import 'package:flutter/material.dart';

class LeadAttachment extends StatelessWidget {
  const LeadAttachment({
    super.key,
    required this.leadModel,
  });
  final Data leadModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.space15),
      child: leadModel.attachments!.isNotEmpty
          ? ListView.separated(
              itemBuilder: (context, index) {
                return AttachmentCard(
                  index: index,
                  attachment: leadModel.attachments!,
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: Dimensions.space10),
              itemCount: leadModel.attachments!.length)
          : const NoDataWidget(),
    );
  }
}
