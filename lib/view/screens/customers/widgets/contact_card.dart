import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/model/contact/contact_model.dart';
import 'package:flutex_admin/view/components/circle_avatar_with_letter.dart';

import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.index,
    required this.contactModel,
  });
  final int index;
  final ContactsModel contactModel;

  @override
  Widget build(BuildContext context) {
    return /* GestureDetector(
      onTap: () {
        Get.toNamed(RouteHelper.customerDetails,
            arguments: customerModel.data![index].userId!);
      },
      child:*/
        Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.space5),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.cardRadius),
            color: Theme.of(context).cardColor,
          ),
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
                horizontal: Dimensions.space15, vertical: Dimensions.space10),
            leading: CircleAvatarWithInitialLetter(
                initialLetter: contactModel.data![index].firstName ?? ''),
            title: Text(
                '${contactModel.data![index].firstName} ${contactModel.data![index].lastName}',
                overflow: TextOverflow.ellipsis,
                style: regularDefault.copyWith(
                    color: Theme.of(context).textTheme.bodyMedium!.color)),
            subtitle: Text(
              '${contactModel.data![index].phoneNumber}',
              style: regularSmall.copyWith(color: ColorResources.blueColor),
            ),
            trailing: Switch(
              activeColor: Colors.white,
              activeTrackColor: Theme.of(context).primaryColor,
              onChanged: (value) {},
              value: true,
            ),
          )),
    );
  }
}
