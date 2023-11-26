// ignore_for_file: must_be_immutable

import 'package:dashboard/model/classCodeScreen.dart';
import 'package:dashboard/screens/anmtiongif.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportreturnPurcheseTable extends StatefulWidget {
  List data;
  ReportreturnPurcheseTable({super.key, required this.data});

  @override
  State<ReportreturnPurcheseTable> createState() =>
      _ReportreturnPurcheseTableState();
}

class _ReportreturnPurcheseTableState extends State<ReportreturnPurcheseTable> {
  
  @override
  void initState() {
    super.initState();
      Provider.of<ReportreturnPurcheseModel>(context, listen: false).selectedRows =
          List.generate(widget.data.length, (index) => false);
              Provider.of<ReportreturnPurcheseModel>(context, listen: false).loadMoreData();

    Provider.of<ReportreturnPurcheseModel>(context, listen: false).dataPagesNubmer();
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Consumer<ReportreturnPurcheseModel>(
      builder: (context, model, child) {
        return Column(
          children: [

                  Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 50,
                    width: screenSize.width / 1.4,
                    child: TextFormField(
                      controller: model.searchValueTable,
                      decoration: const InputDecoration(
                        labelText: ' بحث',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: isPortrait
                      ? screenSize.width / 4.5
                      : screenSize.width * 0.2,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        model.search();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.blueGrey,
                        ),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(4)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                      ),
                      child: const Icon(
                        Icons.search,
                        size: 30,
                      )),
                ),
              ],
            ),
           
            model.displayedData.isEmpty
                ? const GifAnimation()
                : 
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                 onSelectAll: (value) {
                    model.disableSelectAll = value!;
                  },
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) {
                    return const Color.fromARGB(118, 187, 210, 221);
                  },
                ),
                columns: const [
                  DataColumn(
                    label: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('كود',
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
                          Text('تاريخ الفاتوره',
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
                          Text('كود فاتوره المشتريات',
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
                          Text('خصم',
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
                          Text('اجمالي',
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
                          Text('اسم المورد',
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
                          Text('اسم الخزينه',
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
                          Text('اسم المستخدم',
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
                rows: List.generate(
                  model.displayedData.length,
                  (index) {
                    final item = model.displayedData[index];
                    return DataRow(
                      selected: model.selectedRowIndex == index,
                      onSelectChanged: (isSelected) {
                        setState(() {
                          model.selectedRows[index] = isSelected!;

                          if (isSelected) {
                            model.selectedRowIndex = index;
                            model.disableSelectAll = true; // Disable "Select All"
                          } else {
                            model.selectedRowIndex = -1;
                            model.disableSelectAll =
                                model.selectedRows.every((selected) => !selected);
                          }
                        });
                        if (isSelected!) {
                          model.showBottomSheet(context,
                              item); // Show the bottom sheet with the selected row data
                        }
                      },
                      cells: [
                        DataCell(
                          Center(
                            child: Text(
                              "${item.id}",
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
                              item.invoiceDate,
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
                              item.invId.toString(),
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
                              item.sheftId.toString(),
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
                              item.discount.toString(),
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
                              item.service.toString(),
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
                              item.tax.toString(),
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
                              item.total.toString(),
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
                              item.customerName.toString(),
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
                              item.safeName.toString(),
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
                              item.userName,
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
                  },
                ),
              ),
            ),
         
            Column(
              children: [
                   model.showAll == false
                          ? const SizedBox()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    model.goToPage(model.currentPage + 1);
                                  },
                                  icon: const Icon(Icons.arrow_back_rounded),
                                ),
                                Text(
                                    "صفحه ${model.currentPage} من ${model.totalPages}"),
                                IconButton(
                                  onPressed: () {
                                    model.goToPage(model.currentPage - 1);
                                  },
                                  icon: const Icon(Icons.arrow_forward_rounded),
                                ),
                              ],
                            ),
          
          
              ],
            )
          
          ],
        );
      },
    );
  }
}
