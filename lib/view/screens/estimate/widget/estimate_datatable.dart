import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/data/controller/estimate/estimate_controller.dart';
import 'package:flutex_admin/data/model/estimate/estimate_details_model.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstimateDataTable extends StatelessWidget {
  EstimateDataTable({super.key});

  final columns = ['ID', 'Item', 'Qty', 'Rate', 'Amount'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstimateController>(builder: (controller) {
      return controller.isLoading
          ? const CustomLoader()
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.all(Dimensions.space5),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(Dimensions.cardRadius),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: DataTable(
                  columns: getColumns(columns),
                  rows: getRows(controller.estimateDetailsModel.data!.items!),
                ),
              ),
            );
    });
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
          ))
      .toList();

  List<DataRow> getRows(List<Items> items) => items
      .map((Items items) => DataRow(
            cells: [
              DataCell(SizedBox(
                width: 20,
                child: Text(items.id!),
              )),
              DataCell(SizedBox(
                width: 150,
                child: Text(items.description!),
              )),
              DataCell(SizedBox(
                width: 50,
                child: Text(items.qty!),
              )),
              DataCell(SizedBox(
                width: 70,
                child: Text(items.rate!),
              )),
              DataCell(SizedBox(
                width: 50,
                child: Text(
                    (double.parse(items.qty!) * double.parse(items.rate!))
                        .toString()),
              )),
            ],
          ))
      .toList();
}
