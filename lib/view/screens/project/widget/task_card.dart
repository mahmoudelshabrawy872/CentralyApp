import 'package:flutex_admin/core/utils/color_resources.dart';
import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/data/model/task/tasks_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.index,
    required this.projectId,
    required this.tasksModel,
  });
  final int index;
  final String projectId;
  final TasksModel tasksModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /*CustomBottomSheet(
            child: TaskDetailsBottomSheet(
          projectId: projectId,
          taskModel: tasksModel.data![index],
        )).customBottomSheet(context);*/
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.cardRadius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimensions.cardRadius),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: Border(
                left: BorderSide(
                  width: 5.0,
                  color: ColorResources.taskStatusColor(
                      tasksModel.data![index].status!),
                ),
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tasksModel.data![index].name ?? '',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Container(
                            padding: const EdgeInsets.all(Dimensions.space5),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.cardRadius),
                                side: BorderSide(
                                    color: ColorResources.taskStatusColor(
                                        tasksModel.data![index].status!)),
                              ),
                            ),
                            child: Text(
                              tasksModel.data![index].statusName?.tr ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: ColorResources.taskStatusColor(
                                          tasksModel.data![index].status!)),
                            ))
                      ],
                    ),
                    const SizedBox(height: Dimensions.space5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          tasksModel.data![index].description!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: Dimensions.fontSmall,
                              color: ColorResources.blueGreyColor),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 0.75,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (tasksModel.data![index].dueDate != null)
                          TextIcon(
                            text: tasksModel.data![index].dueDate,
                            prefix: const Icon(
                              Icons.calendar_month,
                              color: ColorResources.blueGreyColor,
                              size: Dimensions.space15,
                            ),
                            edgeInsets: EdgeInsets.zero,
                            textStyle: const TextStyle(
                                fontSize: Dimensions.fontDefault,
                                color: ColorResources.blueGreyColor),
                          ),
                        Text(
                          tasksModel.data![index].addedFromName!,
                          style: const TextStyle(
                              fontSize: Dimensions.fontDefault,
                              color: ColorResources.blueGreyColor),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
