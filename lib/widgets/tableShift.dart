import 'package:dashboard/model/classCodeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ShiftReportTable extends StatefulWidget {
  List data;

  ShiftReportTable({Key? key, required this.data}) : super(key: key);

  @override
  State<ShiftReportTable> createState() => _ShiftReportTableState();
}

class _ShiftReportTableState extends State<ShiftReportTable> {

  @override
  void initState() {
    super.initState();
     Provider.of<ShiftReportModel>(context, listen: false).shodata('');
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ShiftReportModel>(
      builder: (context, value, child) {
        return 
        
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
              headingRowColor: MaterialStateColor.resolveWith(
                (states) {
                  return const Color.fromARGB(118, 187, 210, 221);
                },
              ),
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('كود الفتره',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'arabic',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('مستخدم الفتح',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'arabic',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('تاريخ الفتح',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'arabic',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('كاش',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'arabic',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('اجل',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'arabic',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('فيزا',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'arabic',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ضريبه',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'arabic',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('خدمه',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'arabic',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('الخصم',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'arabic',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('تاريخ الاغلاق',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'arabic',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('اسم مستخدم الغلق',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'arabic',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('الرصيد الافتتاحي',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'arabic',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('مصروفات',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'arabic',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('اجمالي الفاتوره',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'arabic',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('مرتجعات المبيعات',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'arabic',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('مرتجع المشتريات',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'arabic',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('محصلات العملاء',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'arabic',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('محصلات الموردين',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'arabic',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('رصيد الخزينه',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'arabic',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              ],
              rows: List.generate(value.displayData.length, (index) {
                final item = value.displayData[index];
                return DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Center(
                        child: Text(
                          "${item.sheftId}",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'arabic',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          item.openUserName,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'arabic',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          item.openDateTime,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'arabic',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          "${item.cash}",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'arabic',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          "${item.later}",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'arabic',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          "${item.visa}",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'arabic',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          "${item.tax}",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'arabic',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          "${item.service}",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'arabic',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          "${item.discounts}",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'arabic',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          "${item.closeDateTime}",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'arabic',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          item.closeUserName.toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'arabic',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          item.openingBalance.toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'arabic',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          item.expence.toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'arabic',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          item.invoiceTotal.toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'arabic',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          item.salesReturns.toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'arabic',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          item.purchasesReturns.toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'arabic',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          item.totalCustomerPayment.toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'arabic',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          item.totalSupplierPayment.toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'arabic',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          item.safeBalance.toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'arabic',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              })),
        );
      },
    );
  }
}
