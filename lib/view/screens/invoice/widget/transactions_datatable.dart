import 'package:flutex_admin/core/utils/dimensions.dart';
import 'package:flutex_admin/core/utils/local_strings.dart';
import 'package:flutex_admin/core/utils/style.dart';
import 'package:flutex_admin/data/controller/invoice/invoice_controller.dart';
import 'package:flutex_admin/data/model/invoice/invoice_details_model.dart';
import 'package:flutex_admin/view/components/custom_loader/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionsDataTable extends StatelessWidget {
  TransactionsDataTable({super.key});

  final columns = [
    LocalStrings.id.tr,
    LocalStrings.paymentMode.tr,
    LocalStrings.date.tr,
    LocalStrings.amount.tr
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceController>(builder: (controller) {
      return controller.isLoading
          ? const CustomLoader()
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Container(
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
                  rows: getRows(controller.invoiceDetailsModel.data!.payments!),
                ),
              ),
            );
    });
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(
              column,
              style: regularDefault,
            ),
          ))
      .toList();

  List<DataRow> getRows(List<Payments> payments) => payments
      .map((Payments payments) => DataRow(
            cells: [
              DataCell(SizedBox(
                width: 20,
                child: Text(payments.id ?? '', style: lightDefault),
              )),
              DataCell(SizedBox(
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(payments.methodName ?? '', style: lightDefault),
                      Text(payments.transactionId ?? '', style: lightDefault),
                    ],
                  ),
                ),
              )),
              DataCell(Text(payments.date ?? '', style: lightDefault)),
              DataCell(SizedBox(
                width: 70,
                child: Text(payments.amount ?? '', style: lightDefault),
              )),
            ],
          ))
      .toList();
}
